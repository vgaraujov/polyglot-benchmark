#!/bin/bash

# Load the function definitions
. ./previous_permutation.sh

test_previous_permutation() {
[[ $(previous_permutation 3 "1 3 2") == "1 2 3" ]] || { echo "Test 1 failed"; exit 1; }
[[ $(previous_permutation 3 "1 2 3") == "ERROR" ]] || { echo "Test 2 failed"; exit 1; }
[[ $(previous_permutation 4 "2 1 4 3") == "2 1 3 4" ]] || { echo "Test 3 failed"; exit 1; }
[[ $(previous_permutation 5 "5 4 3 2 1") == "5 4 3 1 2" ]] || { echo "Test 4 failed"; exit 1; }
[[ $(previous_permutation 4 "1 4 3 2") == "1 4 2 3" ]] || { echo "Test 5 failed"; exit 1; }
}

test_previous_permutation