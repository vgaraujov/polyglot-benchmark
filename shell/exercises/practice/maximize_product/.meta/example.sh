#!/bin/bash
maximize_product() {
local sum_n=$1
local num_m=$2
# This function finds M positive integers that sum up to N and have the maximum possible product.
# The function outputs the integers in a lexicographically smallest order.
# If no such combination exists, it outputs an error message.
# Example Usage:
# >>> maximize_product 6 3
# 2 2 2
# >>> maximize_product 8 3
# 2 3 3
# >>> maximize_product 10 2
# 5 5
# >>> maximize_product 20 5
# 4 4 4 4 4
if (( sum_n < num_m )); then
echo "Error: Cannot divide $sum_n into $num_m parts"
return 1
fi

# Initialize an array to hold the numbers
local -a numbers
for (( i=0; i<num_m; i++ )); do
numbers[$i]=$((sum_n / num_m))
done

# Distribute the remainder
local remainder=$((sum_n % num_m))
for (( i=0; i<remainder; i++ )); do
((numbers[i]++))
done

# Output the numbers in reverse to get lexicographically smallest order
for (( i=num_m-1; i>=0; i-- )); do
echo -n "${numbers[i]} "
done
echo
}