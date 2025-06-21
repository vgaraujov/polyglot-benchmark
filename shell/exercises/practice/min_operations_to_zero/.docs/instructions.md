Write a Shell function `min_operations_to_zero() {
local nums=($1)` to solve the following problem:

Calculate the minimum number of operations to reduce all elements of an array to zero.
Each operation consists of subtracting a positive integer x (less than or equal to the smallest non-zero element) from each positive element in the array.
The function takes a string representing the array, with elements separated by spaces.
Returns the minimum number of operations required.
>>> min_operations_to_zero "3 3 2 2 1"
3
>>> min_operations_to_zero "4 0 0 4"
1
