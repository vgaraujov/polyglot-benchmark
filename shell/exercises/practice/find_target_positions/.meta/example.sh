#!/bin/bash

# Find the start and end positions of the target value in a non-decreasing array.
# The function takes a string representing the array and an integer target.
# Returns the start and end positions of the target, or [-1, -1] if not found.
# >>> find_target_positions "5 7 7 8 8 10" 8
# 3 4
# >>> find_target_positions "5 7 7 8 8 10" 6
# -1 -1
find_target_positions() {
local -a nums=($1)
local target=$2
local n=${#nums[@]}
local start=-1 end=-1

# Binary search for the starting position
local left=0 right=$((n - 1))
while (( left <= right )); do
local mid=$(((left + right) / 2))
if (( nums[mid] == target )); then
start=$mid
right=$((mid - 1))
elif (( nums[mid] < target )); then
left=$((mid + 1))
else
right=$((mid - 1))
fi
done

# Binary search for the ending position
left=0 right=$((n - 1))
while (( left <= right )); do
local mid=$(((left + right) / 2))
if (( nums[mid] == target )); then
end=$mid
left=$((mid + 1))
elif (( nums[mid] < target )); then
left=$((mid + 1))
else
right=$((mid - 1))
fi
done

echo "$start $end"
}