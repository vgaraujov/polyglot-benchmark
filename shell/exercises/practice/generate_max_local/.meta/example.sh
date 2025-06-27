#!/bin/bash

# Generate a matrix of maximum values from each 3x3 sub-matrix in a given n x n matrix.
# The function takes a string representing the n x n matrix, where rows are separated by semicolons and elements by spaces.
# Returns the (n-2) x (n-2) matrix of maximum values.
# >>> generate_max_local "1 2 3 4;5 6 7 8;9 10 11 12;13 14 15 16"
# 11 12;15 16
# >>> generate_max_local "9 1 7;4 8 2;3 6 5"
# 9 8
generate_max_local() {
local -a grid
IFS=';' read -ra grid <<< "$1"
local -a maxLocal
local n=${#grid[@]}

for (( i=0; i<n-2; i++ )); do
local row=""
for (( j=0; j<n-2; j++ )); do
local max=0
for (( x=i; x<=i+2; x++ )); do
IFS=' ' read -ra rowVals <<< "${grid[x]}"
for (( y=j; y<=j+2; y++ )); do
max=$((max < rowVals[y] ? rowVals[y] : max))
done
done
row+="$max "
done
maxLocal+=("${row% }")
done

echo "${maxLocal[@]}"
}