#!/bin/bash

# Load the function definitions
. ./count_arithmetic_triplets.sh

test_count_arithmetic_triplets() {
[[ $(count_arithmetic_triplets "1 2 3 4 5" 1) == "3" ]] || { echo "Test 1 failed"; exit 1; }
[[ $(count_arithmetic_triplets "1 3 5 7 9" 2) == "3" ]] || { echo "Test 2 failed"; exit 1; }
[[ $(count_arithmetic_triplets "2 4 6 8 10" 2) == "3" ]] || { echo "Test 3 failed"; exit 1; }
[[ $(count_arithmetic_triplets "1 4 7 10 13" 3) == "3" ]] || { echo "Test 4 failed"; exit 1; }
[[ $(count_arithmetic_triplets "1 2 4 5 7" 2) == "0" ]] || { echo "Test 5 failed"; exit 1; }
[[ $(count_arithmetic_triplets "1 5 9 13 17" 4) == "3" ]] || { echo "Test 6 failed"; exit 1; }
[[ $(count_arithmetic_triplets "10 20 30 40 50" 10) == "3" ]] || { echo "Test 7 failed"; exit 1; }
}

test_count_arithmetic_triplets