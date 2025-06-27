#!/bin/bash

# Check if a given square matrix is an X Matrix.
# An X Matrix has non-zero elements on its diagonals and zero elements elsewhere.
# The function takes a single string argument representing the matrix, where rows are separated by semicolons and elements by spaces.
# Returns true if it's an X Matrix, false otherwise.
# >>> is_x_matrix "1 0 0;0 1 0;0 0 1"
# false
# >>> is_x_matrix "1 0 2;0 1 0;3 0 1"
# true
is_x_matrix() {
IFS=';' read -ra rows <<< "$1"
local n=${#rows[@]}

for (( i=0; i<$n; i++ )); do
IFS=' ' read -ra cols <<< "${rows[i]}"
for (( j=0; j<$n; j++ )); do
if (( i == j || i + j == n - 1 )); then
if (( cols[j] == 0 )); then
echo "false"
return
fi
else
if (( cols[j] != 0 )); then
echo "false"
return
fi
fi
done
done

echo "true"
}