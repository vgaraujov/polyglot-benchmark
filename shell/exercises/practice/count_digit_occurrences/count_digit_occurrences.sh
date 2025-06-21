#!/bin/bash
count_digit_occurrences() {
local n=$1
local x=$2
# generate shell function
# This function calculates the number of times a specific digit 'x' appears in all integers from 1 to 'n'.
# Input: Upper limit of the range 'n' and the digit 'x' to be counted.
# Output: Number of occurrences of the digit 'x'.
# Example Usage:
# >>> count_digit_occurrences 11 1
# 4
# >>> count_digit_occurrences 20 2
# 3
# >>> count_digit_occurrences 100 3
# 20