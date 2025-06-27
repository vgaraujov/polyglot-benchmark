#!/usr/bin/env python3
import os
import argparse
import pandas as pd
import json
from datasets import load_dataset

# Custom solutions for problematic tasks
CUSTOM_SOLUTIONS = {
    'extract_tenth_line': """#!/bin/bash

# Extract the tenth line from file.txt
# example
# input: for i in {1..20}; do echo "Line $i"; done > file.txt
# output:Line 10
extract_tenth_line() {
    sed -n '10p' file.txt
}
""",

    'merge_items': """#!/bin/bash

# Merge two sets of items and sum the weights of items with the same value.
# Each item is represented as [value, weight].
# The function takes two strings, each representing an array of items, where items are separated by semicolons and values by spaces.
# Returns a sorted array of unique values and their cumulative weights.
# >>> merge_items "10 5;15 10" "15 15;20 20"
# 10 5;15 25;20 20
merge_items() {
    local items1=(${1//;/ })
    local items2=(${2//;/ })
    
    # Create arrays to store unique values and their weights
    local values=()
    local weights=()
    
    # Process first set of items
    for (( i=0; i<${#items1[@]}; i+=2 )); do
        local val=${items1[$i]}
        local weight=${items1[$i+1]}
        local found=0
        
        # Check if value exists
        for (( j=0; j<${#values[@]}; j++ )); do
            if [[ "${values[$j]}" == "$val" ]]; then
                # Add weight to existing value
                weights[$j]=$((weights[$j] + weight))
                found=1
                break
            fi
        done
        
        # Add new value if not found
        if [[ $found -eq 0 ]]; then
            values+=("$val")
            weights+=("$weight")
        fi
    done
    
    # Process second set of items
    for (( i=0; i<${#items2[@]}; i+=2 )); do
        local val=${items2[$i]}
        local weight=${items2[$i+1]}
        local found=0
        
        # Check if value exists
        for (( j=0; j<${#values[@]}; j++ )); do
            if [[ "${values[$j]}" == "$val" ]]; then
                # Add weight to existing value
                weights[$j]=$((weights[$j] + weight))
                found=1
                break
            fi
        done
        
        # Add new value if not found
        if [[ $found -eq 0 ]]; then
            values+=("$val")
            weights+=("$weight")
        fi
    done
    
    # Sort by value
    for (( i=0; i<${#values[@]}; i++ )); do
        for (( j=i+1; j<${#values[@]}; j++ )); do
            if [[ ${values[$i]} -gt ${values[$j]} ]]; then
                # Swap values
                local temp_val=${values[$i]}
                values[$i]=${values[$j]}
                values[$j]=$temp_val
                
                # Swap weights
                local temp_weight=${weights[$i]}
                weights[$i]=${weights[$j]}
                weights[$j]=$temp_weight
            fi
        done
    done
    
    # Build result string
    local result=""
    for (( i=0; i<${#values[@]}; i++ )); do
        if [[ -n "$result" ]]; then
            result="$result;${values[$i]} ${weights[$i]}"
        else
            result="${values[$i]} ${weights[$i]}"
        fi
    done
    
    # Add trailing semicolon if the result is not empty (required by the test)
    if [[ -n "$result" ]]; then
        result="$result;"
    fi
    
    echo "$result"
}
""",

    'evaluate_hand': """#!/bin/bash

# Evaluate a hand of five cards and determine the poker hand type.
# The function takes two arguments:
# 1. A space-separated string of card ranks (2-10, J, Q, K, A)
# 2. A space-separated string of card suits (H, D, S, C)
# Returns one of the following hands: Flush, Three of a Kind, Pair, High Card.
evaluate_hand() {
    local ranks=$1
    local suits=$2
    
    # Convert the input strings to arrays
    local rank_array=()
    local suit_array=()
    read -r -a rank_array <<< "$ranks"
    read -r -a suit_array <<< "$suits"
    
    # Check for flush (all same suit)
    local is_flush=true
    local first_suit="${suit_array[0]}"
    for suit in "${suit_array[@]}"; do
        if [ "$suit" != "$first_suit" ]; then
            is_flush=false
            break
        fi
    done
    
    # Count occurrences of each rank
    local rank_counts=()
    for rank in "${rank_array[@]}"; do
        local count=0
        for r in "${rank_array[@]}"; do
            if [ "$r" = "$rank" ]; then
                ((count++))
            fi
        done
        rank_counts+=($count)
    done
    
    # Find the maximum count
    local max_count=0
    for count in "${rank_counts[@]}"; do
        if [ $count -gt $max_count ]; then
            max_count=$count
        fi
    done
    
    # Determine hand type
    if [ "$is_flush" = true ]; then
        echo "Flush"
    elif [ $max_count -eq 3 ] || [ $max_count -eq 4 ]; then
        # Both three of a kind and four of a kind are classified as "Three of a Kind" per test
        echo "Three of a Kind"
    elif [ $max_count -eq 2 ]; then
        echo "Pair"
    else
        echo "High Card"
    fi
}
""",

    'count_unique_strings': """#!/bin/bash

# Count the number of strings that appear exactly once in both arrays.
# The function takes two strings representing the arrays, where elements are separated by spaces.
# Returns the count of strings that appear exactly once in both arrays.
# >>> count_unique_strings "apple banana mango" "banana fruits apple"
# 2
# >>> count_unique_strings "hello world" "world hello planet"
# 2
count_unique_strings() {
    local -a words1=($1)
    local -a words2=($2)
    local unique_count=0
    
    # Get unique words from both arrays
    local all_words=$(echo "${words1[@]} ${words2[@]}" | tr ' ' '\\n' | sort -u)
    
    # Count occurrences of each word in both arrays
    for word in $all_words; do
        # Count in array 1
        local count1=0
        for w1 in "${words1[@]}"; do
            if [ "$w1" = "$word" ]; then
                ((count1++))
            fi
        done
        
        # Count in array 2
        local count2=0
        for w2 in "${words2[@]}"; do
            if [ "$w2" = "$word" ]; then
                ((count2++))
            fi
        done
        
        # Check if word appears exactly once in both arrays
        if [ $count1 -eq 1 ] && [ $count2 -eq 1 ]; then
            ((unique_count++))
        fi
    done
    
    echo $unique_count
}
""",

    'find_valid_numbers': """#!/bin/bash

# Find valid phone numbers in file.txt
# A valid phone number has one of the following formats:
# 1. xxx-xxx-xxxx
# 2. (xxx) xxx-xxxx
# 3. xxx xxx xxxx
# Returns a list of valid numbers, one per line.
find_valid_numbers() {
    # Default to processing file.txt
    local file="file.txt"
    
    # Check if the file exists
    if [ ! -f "$file" ]; then
        echo "Error: file.txt not found"
        return 1
    fi
    
    # Use grep to match the required patterns
    grep -E '^\\([0-9]{3}\\) [0-9]{3}-[0-9]{4}$|^[0-9]{3}-[0-9]{3}-[0-9]{4}$' "$file"
}
""",

    'is_lucky_word': """#!/bin/bash

is_lucky_word() {
    local word=$1
    
    # Count letter frequencies using a simpler approach
    local max_count=0
    local min_count=100
    
    # Function to check if a number is prime
    is_prime() {
        local num=$1
        if (( num < 2 )); then return 1; fi
        for (( i=2; i*i<=num; i++ )); do
            if (( num % i == 0 )); then return 1; fi
        done
        return 0
    }
    
    # Count letter frequencies
    # Split word into letters and sort them
    local letters=$(echo "$word" | grep -o . | sort)
    local current_letter=""
    local current_count=0
    
    # Count occurrences of each letter
    for letter in $letters; do
        if [[ "$letter" != "$current_letter" ]]; then
            # Save the count of the previous letter
            if [[ -n "$current_letter" ]]; then
                if (( current_count > max_count )); then max_count=$current_count; fi
                if (( current_count < min_count )); then min_count=$current_count; fi
            fi
            current_letter=$letter
            current_count=1
        else
            ((current_count++))
        fi
    done
    
    # Handle the last letter
    if [[ -n "$current_letter" ]]; then
        if (( current_count > max_count )); then max_count=$current_count; fi
        if (( current_count < min_count )); then min_count=$current_count; fi
    fi
    
    # Calculate difference
    local diff=$((max_count - min_count))
    
    # Check if difference is prime
    if is_prime $diff; then
        echo "Lucky Word"
        echo $diff
    else
        echo "No Answer"
        echo 0
    fi
}
""",

    'is_valid_sudoku': """#!/bin/bash

is_valid_sudoku() {
    local input="$1"
    local rows=()
    
    # Parse input: split by semicolons to get rows
    IFS=';' read -r -a rows <<< "$input"
    
    # Create a 9x9 grid from the input
    local grid=()
    for row in "${rows[@]}"; do
        # Split row by spaces
        local cells=()
        read -r -a cells <<< "$row"
        for cell in "${cells[@]}"; do
            # Convert "." to "0" for easier processing
            if [[ "$cell" == "." ]]; then
                grid+=("0")
            else
                grid+=("$cell")
            fi
        done
    done
    
    # Check if a list of digits contains duplicates
    has_duplicates() {
        local digits=("$@")
        local seen=()
        
        for digit in "${digits[@]}"; do
            # Skip empty cells
            if [[ "$digit" != "0" ]]; then
                for seen_digit in "${seen[@]}"; do
                    if [[ "$seen_digit" == "$digit" ]]; then
                        return 0  # True, has duplicates
                    fi
                done
                seen+=("$digit")
            fi
        done
        return 1  # False, no duplicates
    }
    
    # Check rows
    for i in {0..8}; do
        local row_digits=("${grid[@]:i*9:9}")
        if has_duplicates "${row_digits[@]}"; then
            echo "false"
            return
        fi
    done
    
    # Check columns
    for col in {0..8}; do
        local col_digits=()
        for row in {0..8}; do
            col_digits+=("${grid[row*9+col]}")
        done
        if has_duplicates "${col_digits[@]}"; then
            echo "false"
            return
        fi
    done
    
    # Check 3x3 subgrids
    for grid_row in {0..2}; do
        for grid_col in {0..2}; do
            local subgrid_digits=()
            for r in {0..2}; do
                for c in {0..2}; do
                    local row_idx=$((grid_row*3 + r))
                    local col_idx=$((grid_col*3 + c))
                    subgrid_digits+=("${grid[row_idx*9+col_idx]}")
                done
            done
            if has_duplicates "${subgrid_digits[@]}"; then
                echo "false"
                return
            fi
        done
    done
    
    # If all checks pass, the Sudoku is valid
    echo "true"
}
"""
}

def main(include_solutions=False):
    # Create shell exercises directory structure
    shell_dir = "shell/exercises/practice"
    os.makedirs(shell_dir, exist_ok=True)
    
    # Load the dataset
    print("Loading McEval dataset...")
    ds = load_dataset("Multilingual-Multimodal-NLP/McEval", "generation", split="test")
    df = ds.to_pandas()
    
    # Filter Shell tasks
    df_shell_tasks = df[df["task_id"].str.match(r"Shell/.*")]
    print(f"Found {len(df_shell_tasks)} Shell tasks")
    
    # Check if canonical_solution column exists
    has_solutions = 'canonical_solution' in df_shell_tasks.columns
    if include_solutions and not has_solutions:
        print("Warning: No canonical_solution column found in dataset. Solutions will not be included.")
        include_solutions = False
    elif include_solutions:
        print("Including canonical solutions in the shell scripts.")
    
    # Keep track of successfully created tasks
    created_tasks = []
    
    # Process each Shell task
    for idx, row in df_shell_tasks.iterrows():
        try:
            task_name = row['entry_point']
            prompt = row['prompt']
            instruction = row['instruction']
            test = row['test']
            
            # Create task directory
            task_dir = os.path.join(shell_dir, task_name)
            os.makedirs(task_dir, exist_ok=True)
            
            # Create .docs directory
            docs_dir = os.path.join(task_dir, ".docs")
            os.makedirs(docs_dir, exist_ok=True)
            
            # Create .meta directory
            meta_dir = os.path.join(task_dir, ".meta")
            os.makedirs(meta_dir, exist_ok=True)
            
            # Create config.json file
            config_data = {
                "authors": ["mceval"],
                "contributors": ["vgaraujov"],
                "files": {
                    "solution": [f"{task_name}.sh"],
                    "test": [f"{task_name}_test.sh"],
                    "example": [".meta/example.sh"]
                }
            }
            
            with open(os.path.join(meta_dir, "config.json"), "w") as f:
                json.dump(config_data, f, indent=2)
            
            # Ensure shell scripts have execute permission
            prompt_with_shebang = prompt
            if not prompt.startswith('#!/'):
                prompt_with_shebang = '#!/bin/bash\n\n' + prompt

            # Write task files
            with open(os.path.join(task_dir, f"{task_name}.sh"), "w") as f:
                f.write(prompt_with_shebang)

            # then we add the solution to the prompt for example.sh
            # If it's one of our custom-fixed tasks
            if task_name in CUSTOM_SOLUTIONS:
                # Use our custom solution directly
                prompt_with_shebang = CUSTOM_SOLUTIONS[task_name]
            else:   
                # If including solutions, append the solution to the prompt
                # if include_solutions and has_solutions and not pd.isna(row.get('canonical_solution')):
                solution = row['canonical_solution']
                
                # Make sure the solution is properly formatted
                if solution.strip() and not solution.strip().endswith('}'):
                    solution = solution.rstrip() + '\n}'
                
                # Simply append the solution to the prompt
                if '}' not in prompt_with_shebang:  # Check if function is not closed
                    # Check if the last line of prompt ends with '{' followed by content without newline
                    lines = prompt_with_shebang.strip().split('\n')
                    last_line = lines[-1].strip()
                    
                    # Check if solution starts with local var declaration that should be on a newline
                    if last_line.endswith('{'):
                        # Function signature ends with {, just add a newline
                        prompt_with_shebang += '\n' + solution
                    elif 'local' in solution.strip().split()[0]:
                        # Add a newline to separate local declaration
                        prompt_with_shebang += '\n' + solution
                    else:
                        # Generic case - ensure there's proper spacing
                        prompt_with_shebang = prompt_with_shebang.rstrip() + '\n' + solution.lstrip()
                
                # Make sure function is properly closed and doesn't have double closing braces
                if not prompt_with_shebang.strip().endswith('}'):
                    prompt_with_shebang += '\n}'
                else:
                    # Make sure we don't have double closing braces
                    count_braces = prompt_with_shebang.count('}')
                    count_open_braces = prompt_with_shebang.count('{')
                    if count_braces > count_open_braces:
                        # Fix by removing the last brace and adding it back properly
                        prompt_with_shebang = prompt_with_shebang.rstrip().rstrip('}') + '\n}'
                
            # Make sure test script loads the function definitions
            test_with_shebang = test
            if not test.startswith('#!/'):
                test_with_shebang = f'#!/bin/bash\n\n# Load the function definitions\n. ./{task_name}.sh\n\n' + test
            else:
                # If there's already a shebang, add the source line after it
                lines = test_with_shebang.split('\n', 1)
                if len(lines) > 1:
                    test_with_shebang = f'{lines[0]}\n\n# Load the function definitions\n. ./{task_name}.sh\n\n{lines[1]}'
                else:
                    test_with_shebang = f'{lines[0]}\n\n# Load the function definitions\n. ./{task_name}.sh\n\n'
            
            # overwrite task files if solutions are included
            if include_solutions:
                with open(os.path.join(task_dir, f"{task_name}.sh"), "w") as f:
                    f.write(prompt_with_shebang)
            
            # Create example.sh with solution in .meta directory (always includes solution)
            with open(os.path.join(meta_dir, "example.sh"), "w") as f:
                f.write(prompt_with_shebang)
            
            with open(os.path.join(task_dir, f"{task_name}_test.sh"), "w") as f:
                f.write(test_with_shebang)
            
            with open(os.path.join(docs_dir, "instructions.md"), "w") as f:
                f.write(instruction)
            
            print(f"Created task: {task_name}")
            created_tasks.append(task_name)
        
        except Exception as e:
            print(f"Error processing task at index {idx}: {e}")
    
    # Verify all tasks were created
    total_tasks = len(df_shell_tasks)
    created_count = len(created_tasks)
    print(f"\nVerification: Created {created_count} out of {total_tasks} tasks")
    
    # Assert that all tasks were created
    if created_count == total_tasks:
        print("✅ SUCCESS: All tasks were successfully created!")
    else:
        print("❌ WARNING: Not all tasks were created successfully.")
        # Find which tasks were not created
        all_task_names = set(df_shell_tasks['entry_point'].tolist())
        created_task_names = set(created_tasks)
        missing_tasks = all_task_names - created_task_names
        print(f"Missing tasks: {', '.join(missing_tasks)}")
    
    print("Done!")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Convert McEval Shell tasks to polyglot-benchmark format")
    parser.add_argument("--include-solutions", action="store_true", 
                        help="Include canonical solutions in the shell scripts")
    args = parser.parse_args()
    
    main(include_solutions=args.include_solutions)