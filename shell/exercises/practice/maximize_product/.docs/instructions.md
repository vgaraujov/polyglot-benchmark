Write a Shell function `maximize_product() {
local sum_n=$1
local num_m=$2
` to solve the following problem:
This function finds M positive integers that sum up to N and have the maximum possible product.
The function outputs the integers in a lexicographically smallest order.
If no such combination exists, it outputs an error message.
Example Usage:
>>> maximize_product 6 3
2 2 2
>>> maximize_product 8 3
2 3 3
>>> maximize_product 10 2
5 5
>>> maximize_product 20 5
4 4 4 4 4