Write a Shell function `search_rotated_array() {
local -a nums=($1)
local target=$2` to solve the following problem:

Perform modified binary search to find the target in a rotated sorted array.
The function takes a string representing the rotated array and an integer target.
Returns the index of the target if found, otherwise -1.
>>> search_rotated_array "4 5 6 7 0 1 2" 0
4
>>> search_rotated_array "4 5 6 7 0 1 2" 3
-1
