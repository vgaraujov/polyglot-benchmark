#!/bin/bash

# Count the number of distinct arithmetic triplets in a strictly increasing integer array.
# A triplet (i, j, k) is arithmetic if nums[j] - nums[i] == diff and nums[k] - nums[j] == diff.
# The function takes a string representing the array and an integer diff, with elements separated by spaces.
# Returns the count of distinct arithmetic triplets.
# >>> count_arithmetic_triplets "1 2 3 4 5" 1
# 3
# >>> count_arithmetic_triplets "1 3 5 7 9" 2
# 4
count_arithmetic_triplets() {
local nums=($1)
local diff=$2
local count=0

for (( i=0; i<${#nums[@]}; i++ )); do
for (( j=i+1; j<${#nums[@]}; j++ )); do
if (( nums[j] - nums[i] == diff )); then
for (( k=j+1; k<${#nums[@]}; k++ )); do
if (( nums[k] - nums[j] == diff )); then
count=$((count + 1))
fi
done
fi
done
done

echo $count
}