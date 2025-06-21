#!/bin/bash

# Load the function definitions
. ./third_largest_number.sh

test_third_largest_number() {
[[ $(third_largest_number "4 5 1 3 2") == "3" ]] || { echo "Test 1 failed"; exit 1; }
[[ $(third_largest_number "10 5 1") == "1" ]] || { echo "Test 2 failed"; exit 1; }
[[ $(third_largest_number "7 7 7 7") == "7" ]] || { echo "Test 3 failed"; exit 1; }
[[ $(third_largest_number "9 8 7 6 5") == "7" ]] || { echo "Test 4 failed"; exit 1; }
[[ $(third_largest_number "1 2") == "2" ]] || { echo "Test 5 failed"; exit 1; }
[[ $(third_largest_number "3 3 3 2 1") == "1" ]] || { echo "Test 6 failed"; exit 1; }
[[ $(third_largest_number "1") == "1" ]] || { echo "Test 7 failed"; exit 1; }
}

test_third_largest_number