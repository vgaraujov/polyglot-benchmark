#!/bin/bash

# Perform modified binary search to find the target in a rotated sorted array.
# The function takes a string representing the rotated array and an integer target.
# Returns the index of the target if found, otherwise -1.
# >>> search_rotated_array "4 5 6 7 0 1 2" 0
# 4
# >>> search_rotated_array "4 5 6 7 0 1 2" 3
# -1
search_rotated_array() {
local -a nums=($1)
local target=$2
local left=0
local right=$((${#nums[@]} - 1))

while (( left <= right )); do
local mid=$(((left + right) / 2))

if (( nums[mid] == target )); then
echo $mid
return
fi

if (( nums[left] <= nums[mid] )); then
if (( nums[left] <= target && target < nums[mid] )); then
right=$((mid - 1))
else
left=$((mid + 1))
fi
else
if (( nums[mid] < target && target <= nums[right] )); then
left=$((mid + 1))
else
right=$((mid - 1))
fi
fi
done

echo -1
}