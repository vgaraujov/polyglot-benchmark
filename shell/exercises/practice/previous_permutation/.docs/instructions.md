Write a Shell function `previous_permutation() {
local n=$1
local permutation=($2)
local i j
` to solve the following problem:
This function finds the previous lexicographical permutation of a given sequence.
If the current permutation is the first one in lexicographical order, it returns 'ERROR'.
The function takes the number of elements and the current permutation as arguments.
Example usage:
previous_permutation 3 "1 2 3"
This would return 'ERROR', as '1 2 3' is the first permutation.

previous_permutation 4 "1 3 4 2"
This would return '1 3 2 4', as it's the previous permutation in lexicographical order.
