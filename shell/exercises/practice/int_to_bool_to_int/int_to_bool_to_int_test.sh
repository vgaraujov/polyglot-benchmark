#!/bin/bash

# Load the function definitions
. ./int_to_bool_to_int.sh

test_int_to_bool_to_int() {
    local result

    result=$(int_to_bool_to_int 0)
    [[ "$result" -eq 0 ]] || { echo "Test 1 failed: Expected 0, got $result"; exit 1; }

    result=$(int_to_bool_to_int -5)
    [[ "$result" -eq 1 ]] || { echo "Test 2 failed: Expected 1, got $result"; exit 1; }

    result=$(int_to_bool_to_int 10)
    [[ "$result" -eq 1 ]] || { echo "Test 3 failed: Expected 1, got $result"; exit 1; }

    result=$(int_to_bool_to_int -1)
    [[ "$result" -eq 1 ]] || { echo "Test 4 failed: Expected 1, got $result"; exit 1; }

    result=$(int_to_bool_to_int 1)
    [[ "$result" -eq 1 ]] || { echo "Test 5 failed: Expected 1, got $result"; exit 1; }
}

test_int_to_bool_to_int