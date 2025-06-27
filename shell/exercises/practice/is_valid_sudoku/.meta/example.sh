#!/bin/bash

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
