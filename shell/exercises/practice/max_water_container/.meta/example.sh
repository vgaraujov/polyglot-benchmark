#!/bin/bash

# Find the maximum amount of water that can be contained between two lines.
# The function takes a string representing the array of line heights, with elements separated by spaces.
# Returns the maximum water container capacity.
# >>> max_water_container "1 8 6 2 5 4 8 3 7"
# 49
# >>> max_water_container "1 1"
# 1
max_water_container() {
local -a heights=($1)
local max_capacity=0
local left=0
local right=$((${#heights[@]} - 1))

while (( left < right )); do
local width=$((right - left))
local height=$((heights[left] < heights[right] ? heights[left] : heights[right]))
max_capacity=$((max_capacity > width * height ? max_capacity : width * height))

if (( heights[left] < heights[right] )); then
((left++))
else
((right--))
fi
done

echo $max_capacity
}