#!/bin/bash

# Load the function definitions
. ./calculate_max_pens.sh

test_calculate_max_pens() {
    local result

    result=$(calculate_max_pens 5 5)
    [[ "$result" -eq 2 ]] || { echo "Test 1 failed: Expected 2, got $result"; exit 1; }

    result=$(calculate_max_pens 20 1)
    [[ "$result" -eq 10 ]] || { echo "Test 2 failed: Expected 10, got $result"; exit 1; }

    result=$(calculate_max_pens 3 8)
    [[ "$result" -eq 2 ]] || { echo "Test 3 failed: Expected 1, got $result"; exit 1; }

    result=$(calculate_max_pens 11 0)
    [[ "$result" -eq 5 ]] || { echo "Test 4 failed: Expected 5, got $result"; exit 1; }

    result=$(calculate_max_pens 100 5)
    [[ "$result" -eq 52 ]] || { echo "Test 5 failed: Expected 52, got $result"; exit 1; }
}

test_calculate_max_pens