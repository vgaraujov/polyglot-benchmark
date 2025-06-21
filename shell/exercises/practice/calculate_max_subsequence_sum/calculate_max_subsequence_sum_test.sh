#!/bin/bash

# Load the function definitions
. ./calculate_max_subsequence_sum.sh

test_calculate_max_subsequence_sum() {
    [[ $(calculate_max_subsequence_sum "2 -4 3 -1 2 -4 3") -eq 4 ]] || { echo "Test 1 failed"; exit 1; }
    [[ $(calculate_max_subsequence_sum "-1 -2 -3 -4") -eq -1 ]] || { echo "Test 2 failed"; exit 1; }
    [[ $(calculate_max_subsequence_sum "1 2 3 4 -10 5 6") -eq 11 ]] || { echo "Test 3 failed"; exit 1; }
    [[ $(calculate_max_subsequence_sum "1 2 3 4 5 6") -eq 21 ]] || { echo "Test 4 failed"; exit 1; }
    [[ $(calculate_max_subsequence_sum "-1 -2 -3 -4 -5 -6") -eq -1 ]] || { echo "Test 5 failed"; exit 1; }
}

test_calculate_max_subsequence_sum