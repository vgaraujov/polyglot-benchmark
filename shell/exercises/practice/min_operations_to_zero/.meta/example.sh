#!/bin/bash

# Calculate the minimum number of operations to reduce all elements of an array to zero.
# Each operation consists of subtracting a positive integer x (less than or equal to the smallest non-zero element) from each positive element in the array.
# The function takes a string representing the array, with elements separated by spaces.
# Returns the minimum number of operations required.
# >>> min_operations_to_zero "3 3 2 2 1"
# 3
# >>> min_operations_to_zero "4 0 0 4"
# 1
min_operations_to_zero() {
local nums=($1)
local operations=0
local min_non_zero=99999

# Find the minimum non-zero element in the array
for num in ${nums[@]}; do
if (( num > 0 && num < min_non_zero )); then
min_non_zero=$num
fi
done

while (( min_non_zero != 99999 )); do
# Subtract min_non_zero from each element and count operation
for i in ${!nums[@]}; do
if (( nums[i] > 0 )); then
nums[i]=$(( nums[i] - min_non_zero ))
fi
done
operations=$((operations + 1))

# Find new minimum non-zero element
min_non_zero=99999
for num in ${nums[@]}; do
if (( num > 0 && num < min_non_zero )); then
min_non_zero=$num
fi
done
done

echo $operations
}