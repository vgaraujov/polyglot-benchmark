#!/bin/bash

# Load the function definitions
. ./search_rotated_array.sh

test_search_rotated_array() {
[[ $(search_rotated_array "4 5 6 7 0 1 2" 0) == "4" ]] || { echo "Test 1 failed"; exit 1; }
[[ $(search_rotated_array "4 5 6 7 0 1 2" 3) == "-1" ]] || { echo "Test 2 failed"; exit 1; }
[[ $(search_rotated_array "0 1 2 4 5 6 7" 3) == "-1" ]] || { echo "Test 3 failed"; exit 1; }
[[ $(search_rotated_array "6 7 0 1 2 4 5" 3) == "-1" ]] || { echo "Test 4 failed"; exit 1; }
[[ $(search_rotated_array "7 0 1 2 4 5 6" 0) == "1" ]] || { echo "Test 5 failed"; exit 1; }
[[ $(search_rotated_array "1" 0) == "-1" ]] || { echo "Test 6 failed"; exit 1; }
[[ $(search_rotated_array "1 3" 3) == "1" ]] || { echo "Test 7 failed"; exit 1; }
}

test_search_rotated_array