#!/bin/bash

# Function to find the third largest number in an array. If the third largest number does not exist, returns the largest number.
# >>> third_largest_number([1, 2, 3, 4, 5])
# 3
# >>> third_largest_number([10, 5, 1])
# 1
third_largest_number() {
local numbers=($1)
local n=${#numbers[@]}
local first=-INF second=-INF third=-INF

for num in ${numbers[@]}; do
if (( num > first )); then
third=$second
second=$first
first=$num
elif (( num > second && num != first )); then
third=$second
second=$num
elif (( num > third && num != second && num != first )); then
third=$num
fi
done

if [[ $third == -INF ]]; then
echo $first
else
echo $third
fi
}