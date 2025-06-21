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