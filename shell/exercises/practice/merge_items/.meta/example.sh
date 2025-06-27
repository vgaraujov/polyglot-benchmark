#!/bin/bash

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
