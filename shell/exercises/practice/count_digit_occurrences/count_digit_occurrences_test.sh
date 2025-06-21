#!/bin/bash

# Load the function definitions
. ./count_digit_occurrences.sh

test_count_digit_occurrences() {
[[ $(count_digit_occurrences 11 1) -eq 4 ]] || { echo "Test 1 failed"; exit 1; }
[[ $(count_digit_occurrences 20 2) -eq 3 ]] || { echo "Test 2 failed"; exit 1; }
[[ $(count_digit_occurrences 100 3) -eq 20 ]] || { echo "Test 3 failed"; exit 1; }
[[ $(count_digit_occurrences 50 4) -eq 15 ]] || { echo "Test 4 failed"; exit 1; }
[[ $(count_digit_occurrences 99 5) -eq 20 ]] || { echo "Test 5 failed"; exit 1; }
}

test_count_digit_occurrences