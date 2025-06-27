#!/bin/bash

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
    local all_words=$(echo "${words1[@]} ${words2[@]}" | tr ' ' '\n' | sort -u)
    
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
