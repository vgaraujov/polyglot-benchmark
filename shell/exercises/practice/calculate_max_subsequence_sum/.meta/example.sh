#!/bin/bash

calculate_max_subsequence_sum() {
local sequence=($1)
# This function finds the maximum sum of a continuous non-empty subsequence in a given sequence of integers.
# Input: A string of integers representing the sequence.
# Output: The maximum sum of a continuous non-empty subsequence.
# Example Usage:
# >>> calculate_max_subsequence_sum "2 -4 3 -1 2 -4 3"
# 4
# >>> calculate_max_subsequence_sum "-1 -2 -3 -4"
# -1
# >>> calculate_max_subsequence_sum "1 2 3 4 -10 5 6"
# 11
local max_so_far=0
    local max_ending_here=0

    for num in "${sequence[@]}"; do
        max_ending_here=$((max_ending_here + num))
        if (( max_ending_here < 0 )); then
            max_ending_here=0
        elif (( max_so_far < max_ending_here )); then
            max_so_far=$max_ending_here
        fi
    done

    if (( max_so_far == 0 )); then
        max_so_far=${sequence[0]}
        for num in "${sequence[@]}"; do
            if (( num > max_so_far )); then
                max_so_far=$num
            fi
        done
    fi

    echo $max_so_far
}