#!/bin/bash

previous_permutation() {
local n=$1
local permutation=($2)
local i j
# This function finds the previous lexicographical permutation of a given sequence.
# If the current permutation is the first one in lexicographical order, it returns 'ERROR'.
# The function takes the number of elements and the current permutation as arguments.
# Example usage:
# previous_permutation 3 "1 2 3"
# This would return 'ERROR', as '1 2 3' is the first permutation.

# previous_permutation 4 "1 3 4 2"
# This would return '1 3 2 4', as it's the previous permutation in lexicographical order.
for (( i=n-2; i>=0; i-- )); do
if [[ ${permutation[i]} -gt ${permutation[i+1]} ]]; then
break
fi
done

# If no such index exists, the permutation is the first one
if [[ i -eq -1 ]]; then
echo "ERROR"
return
fi

# Find the largest index j greater than i such that permutation[j] < permutation[i]
for (( j=n-1; j>i; j-- )); do
if [[ ${permutation[j]} -lt ${permutation[i]} ]]; then
break
fi
done

# Swap values at i and j
local temp=${permutation[i]}
permutation[i]=${permutation[j]}
permutation[j]=$temp

# Reverse the sequence from i+1 to the end
local left=$((i+1))
local right=$((n-1))
while [[ left -lt right ]]; do
temp=${permutation[left]}
permutation[left]=${permutation[right]}
permutation[right]=$temp
left=$((left+1))
right=$((right-1))
done

echo "${permutation[@]}"
}