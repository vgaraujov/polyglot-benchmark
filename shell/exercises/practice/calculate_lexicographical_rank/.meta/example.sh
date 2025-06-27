#!/bin/bash

calculate_lexicographical_rank() {
local N=$1
local permutation=$2
# This function calculates the lexicographical rank of a given permutation of numbers from 1 to 'N'.
# Input: The number of elements 'N' and the permutation 'X' as a string.
# Output: The lexicographical rank of the permutation.
# The permutation is considered as a sequence of digits without spaces.
# Example Usage:
# >>> calculate_lexicographical_rank 3 "231"
# 4
# >>> calculate_lexicographical_rank 4 "2143"
# 8
local rank=0
local factorial=1
local smaller

# Function to calculate factorial
calculate_factorial() {
local num=$1
local fact=1
for (( i=1; i<=num; i++ )); do
fact=$((fact * i))
done
echo $fact
}

for (( i=0; i<N-1; i++ )); do
smaller=0
for (( j=i+1; j<N; j++ )); do
if [[ ${permutation:i:1} > ${permutation:j:1} ]]; then
((smaller++))
fi
done
factorial=$(calculate_factorial $((N-i-1)))
rank=$((rank + smaller * factorial))
done

# Adding 1 because rank starts from 1
echo $((rank + 1))
}