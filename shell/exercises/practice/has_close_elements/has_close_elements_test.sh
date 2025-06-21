#!/bin/bash

# Load the function definitions
. ./has_close_elements.sh

# Testing function
test_close_elements() {
[[ $(has_close_elements "1.0 2.0 3.9 4.0 5.0 2.2" 0.3) == "true" ]] || { echo "Test 1 failed"; exit 1; }
[[ $(has_close_elements "1.0 2.0 3.9 4.0 5.0 2.2" 0.05) == "false" ]] || { echo "Test 2 failed"; exit 1; }
[[ $(has_close_elements "1.0 2.0 5.9 4.0 5.0" 0.95) == "true" ]] || { echo "Test 3 failed"; exit 1; }
[[ $(has_close_elements "1.0 2.0 5.9 4.0 5.0" 0.8) == "false" ]] || { echo "Test 4 failed"; exit 1; }
[[ $(has_close_elements "1.0 2.0 3.0 4.0 5.0 2.0" 0.1) == "true" ]] || { echo "Test 5 failed"; exit 1; }
[[ $(has_close_elements "1.1 2.2 3.1 4.1 5.1" 1.0) == "true" ]] || { echo "Test 6 failed"; exit 1; }
[[ $(has_close_elements "1.1 2.2 3.1 4.1 5.1" 0.5) == "false" ]] || { echo "Test 7 failed"; exit 1; }
}

test_close_elements