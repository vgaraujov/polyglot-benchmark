#!/bin/bash

# Load the function definitions
. ./find_target_positions.sh

test_find_target_positions() {
[[ $(find_target_positions "5 7 7 8 8 10" 8) == "3 4" ]] || { echo "Test 1 failed"; exit 1; }
[[ $(find_target_positions "5 7 7 8 8 10" 6) == "-1 -1" ]] || { echo "Test 2 failed"; exit 1; }
[[ $(find_target_positions "1 2 3 4 5" 5) == "4 4" ]] || { echo "Test 3 failed"; exit 1; }
[[ $(find_target_positions "1 2 3 4 5" 1) == "0 0" ]] || { echo "Test 4 failed"; exit 1; }
[[ $(find_target_positions "1 1 1 1 1" 1) == "0 4" ]] || { echo "Test 5 failed"; exit 1; }
[[ $(find_target_positions "1 2 3 3 3 4 5" 3) == "2 4" ]] || { echo "Test 6 failed"; exit 1; }
[[ $(find_target_positions "1 2 2 3 4 5" 2) == "1 2" ]] || { echo "Test 7 failed"; exit 1; }
}

test_find_target_positions