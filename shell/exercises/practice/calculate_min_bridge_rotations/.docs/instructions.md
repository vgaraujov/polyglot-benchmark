Write a Shell function `calculate_min_bridge_rotations() {
local N=$1
local carriages=($2)
` to solve the following problem:
This function calculates the minimum number of bridge rotations required to sort train carriages.
The bridge can hold two carriages at a time and rotate 180 degrees to swap them.
Input: Number of carriages 'N' and a string representing the initial order of carriages.
Output: The minimum number of bridge rotations needed to sort the carriages in ascending order.
Example Usage:
>>> calculate_min_bridge_rotations 4 "4 3 2 1"
6
>>> calculate_min_bridge_rotations 5 "5 4 3 2 1"
10
>>> calculate_min_bridge_rotations 3 "3 1 2"
2