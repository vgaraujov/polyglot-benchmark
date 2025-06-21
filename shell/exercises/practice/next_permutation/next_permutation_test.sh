#!/bin/bash

# Load the function definitions
. ./next_permutation.sh

test_next_permutation() {
[[ $(next_permutation "1 2 3") == "1 3 2" ]] || { echo "Test 1 failed"; exit 1; }
[[ $(next_permutation "3 2 1") == "1 2 3" ]] || { echo "Test 2 failed"; exit 1; }
[[ $(next_permutation "1 3 2") == "2 1 3" ]] || { echo "Test 3 failed"; exit 1; }
[[ $(next_permutation "2 3 1") == "3 1 2" ]] || { echo "Test 4 failed"; exit 1; }
[[ $(next_permutation "1 1 5") == "1 5 1" ]] || { echo "Test 5 failed"; exit 1; }
[[ $(next_permutation "2 1 3") == "2 3 1" ]] || { echo "Test 6 failed"; exit 1; }
[[ $(next_permutation "5 4 3 2 1") == "1 2 3 4 5" ]] || { echo "Test 7 failed"; exit 1; }
}

test_next_permutation