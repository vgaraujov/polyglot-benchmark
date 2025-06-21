#!/bin/bash

# Load the function definitions
. ./calculate_lexicographical_rank.sh

test_calculate_lexicographical_rank() {
[[ $(calculate_lexicographical_rank 3 "231") -eq 4 ]] || { echo "Test 1 failed"; exit 1; }
[[ $(calculate_lexicographical_rank 4 "2143") -eq 8 ]] || { echo "Test 2 failed"; exit 1; }
[[ $(calculate_lexicographical_rank 5 "31245") -eq 49 ]] || { echo "Test 3 failed"; exit 1; }
[[ $(calculate_lexicographical_rank 3 "123") -eq 1 ]] || { echo "Test 4 failed"; exit 1; }
[[ $(calculate_lexicographical_rank 4 "4321") -eq 24 ]] || { echo "Test 5 failed"; exit 1; }
}

test_calculate_lexicographical_rank