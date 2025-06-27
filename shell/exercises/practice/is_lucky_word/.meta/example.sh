#!/bin/bash

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
