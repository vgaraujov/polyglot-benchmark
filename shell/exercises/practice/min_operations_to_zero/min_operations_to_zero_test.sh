#!/bin/bash

# Load the function definitions
. ./min_operations_to_zero.sh

test_min_operations_to_zero() {
[[ $(min_operations_to_zero "3 3 2 2 1") == "3" ]] || { echo "Test 1 failed"; exit 1; }
[[ $(min_operations_to_zero "4 0 0 4") == "1" ]] || { echo "Test 2 failed"; exit 1; }
[[ $(min_operations_to_zero "1 2 3 4 5") == "5" ]] || { echo "Test 3 failed"; exit 1; }
[[ $(min_operations_to_zero "0 0 0") == "0" ]] || { echo "Test 4 failed"; exit 1; }
[[ $(min_operations_to_zero "5 5 5 5 5") == "1" ]] || { echo "Test 5 failed"; exit 1; }
[[ $(min_operations_to_zero "1 1 1 1") == "1" ]] || { echo "Test 6 failed"; exit 1; }
[[ $(min_operations_to_zero "10 10 10 10 20") == "2" ]] || { echo "Test 7 failed"; exit 1; }
}

test_min_operations_to_zero