Write a Shell function `find_sum_segments() {
local M=$1
` to solve the following problem:
This function identifies all the continuous segments of positive integers that sum to a given integer M.
Each segment must contain at least two consecutive numbers.
Args:
$1: A positive integer M, the target sum (10 <= M <= 2,000,000).
Returns:
The output consists of several lines, each containing two positive integers separated by a space.
These integers represent the first and last numbers in a continuous segment that sums to M.
The lines are sorted in ascending order based on the starting number of each segment.
Example:
find_sum_segments 21
Returns:
6 8
10 11