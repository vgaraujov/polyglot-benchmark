#!/bin/bash

# Find the next permutation of the array in lexicographic order.
# If the array is in descending order, rearrange it to the first permutation (ascending order).
# The function takes a string representing the array, with elements separated by spaces.
# Returns the next permutation of the array.
# >>> next_permutation "1 2 3"
# 1 3 2
# >>> next_permutation "3 2 1"
# 1 2 3
next_permutation() {
local -a nums=($1)