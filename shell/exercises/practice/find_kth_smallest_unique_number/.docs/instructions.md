Write a Shell function `find_kth_smallest_unique_number() {
local numbers=($1)
local k=$2

` to solve the following problem:
This function finds the kth smallest unique number from a list of positive integers. 
Duplicate numbers are only counted once. If k is greater than the number of unique elements, 
it returns 'NO RESULT'.
Args:
$1: A string of space-separated positive integers.
$2: An integer representing the value of k.
Returns:
The kth smallest unique number or 'NO RESULT' if k is too large.
Example:
find_kth_smallest_unique_number "1 2 2 3 4" 3
Returns: 3
find_kth_smallest_unique_number "7 8 9 10 11" 6
Returns: NO RESULT