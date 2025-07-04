#!/bin/bash

# Load the function definitions
. ./calculate_power_of_two.sh

test_calculate_power_of_two() {
    local result

    result=$(calculate_power_of_two 5)
    [[ "$result" -eq 32 ]] || { echo "Test 1 failed: Expected 32, got $result"; exit 1; }

    result=$(calculate_power_of_two 10)
    [[ "$result" -eq 1024 ]] || { echo "Test 2 failed: Expected 1024, got $result"; exit 1; }

    result=$(calculate_power_of_two 0)
    [[ "$result" -eq 1 ]] || { echo "Test 3 failed: Expected 1, got $result"; exit 1; }

    result=$(calculate_power_of_two 15)
    [[ "$result" -eq 32768 ]] || { echo "Test 4 failed: Expected 32768, got $result"; exit 1; }

    result=$(calculate_power_of_two 20)
    [[ "$result" -eq 1048576 ]] || { echo "Test 5 failed: Expected 1048576, got $result"; exit 1; }
}

test_calculate_power_of_two