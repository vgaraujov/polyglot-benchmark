#!/bin/bash

# Load the function definitions
. ./calculate_nth_term.sh

test_calculate_nth_term() {
    local result

    result=$(calculate_nth_term 1 3 5)
    [[ "$result" -eq 9 ]] || { echo "Test 1 failed: Expected 9, got $result"; exit 1; }

    result=$(calculate_nth_term 2 5 10)
    [[ "$result" -eq 29 ]] || { echo "Test 2 failed: Expected 20, got $result"; exit 1; }

    result=$(calculate_nth_term -1 1 50)
    [[ "$result" -eq 97 ]] || { echo "Test 3 failed: Expected 97, got $result"; exit 1; }

    result=$(calculate_nth_term 100 -100 3)
    [[ "$result" -eq -300 ]] || { echo "Test 4 failed: Expected -300, got $result"; exit 1; }

}

test_calculate_nth_term