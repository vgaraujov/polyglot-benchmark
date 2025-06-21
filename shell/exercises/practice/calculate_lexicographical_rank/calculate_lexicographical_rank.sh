#!/bin/bash

calculate_lexicographical_rank() {
local N=$1
local permutation=$2
# This function calculates the lexicographical rank of a given permutation of numbers from 1 to 'N'.
# Input: The number of elements 'N' and the permutation 'X' as a string.
# Output: The lexicographical rank of the permutation.
# The permutation is considered as a sequence of digits without spaces.
# Example Usage:
# >>> calculate_lexicographical_rank 3 "231"
# 4
# >>> calculate_lexicographical_rank 4 "2143"
# 8