#!/bin/bash

# Load the function definitions
. ./calculate_sine.sh

test_calculate_sine() {
[[ $(calculate_sine 3 5 4) == "3/5" ]] || { echo "Test 1 failed"; exit 1; }
[[ $(calculate_sine 5 12 13) == "5/13" ]] || { echo "Test 2 failed"; exit 1; }
[[ $(calculate_sine 8 15 17) == "8/17" ]] || { echo "Test 3 failed"; exit 1; }
[[ $(calculate_sine 7 24 25) == "7/25" ]] || { echo "Test 4 failed"; exit 1; }
[[ $(calculate_sine 9 40 41) == "9/41" ]] || { echo "Test 5 failed"; exit 1; }
}

test_calculate_sine