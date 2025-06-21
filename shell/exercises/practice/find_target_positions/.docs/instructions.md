Write a Shell function `find_target_positions() {
local -a nums=($1)
local target=$2` to solve the following problem:

Find the start and end positions of the target value in a non-decreasing array.
The function takes a string representing the array and an integer target.
Returns the start and end positions of the target, or [-1, -1] if not found.
>>> find_target_positions "5 7 7 8 8 10" 8
3 4
>>> find_target_positions "5 7 7 8 8 10" 6
-1 -1
