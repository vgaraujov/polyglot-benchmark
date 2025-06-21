Write a Shell function `max_water_container() {
local -a heights=($1)` to solve the following problem:

Find the maximum amount of water that can be contained between two lines.
The function takes a string representing the array of line heights, with elements separated by spaces.
Returns the maximum water container capacity.
>>> max_water_container "1 8 6 2 5 4 8 3 7"
49
>>> max_water_container "1 1"
1
