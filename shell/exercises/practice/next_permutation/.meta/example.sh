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
local i j n=${#nums[@]}

# Find the first index i such that nums[i] < nums[i + 1]
for (( i=n-2; i>=0 && nums[i]>=nums[i+1]; i-- )); do :; done

# If such index exists, find the first index j > i such that nums[i] < nums[j]
if (( i >= 0 )); then
for (( j=n-1; j>i && nums[j]<=nums[i]; j-- )); do :; done
# Swap nums[i] and nums[j]
local temp=${nums[i]}
nums[i]=${nums[j]}
nums[j]=$temp
fi

# Reverse the subarray nums[i+1...end]
for (( j=i+1, k=n-1; j<k; j++, k-- )); do
local temp=${nums[j]}
nums[j]=${nums[k]}
nums[k]=$temp
done

echo "${nums[@]}"
}