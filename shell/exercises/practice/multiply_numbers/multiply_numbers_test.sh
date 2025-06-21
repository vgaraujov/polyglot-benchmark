#!/bin/bash

# Load the function definitions
. ./multiply_numbers.sh

test_multiply_numbers() {
    local result

    result=$(multiply_numbers 5 10)
    [[ "$result" -eq 50 ]] || { echo "Test 1 failed: Expected 50, got $result"; exit 1; }

    result=$(multiply_numbers 123 456)
    [[ "$result" -eq 56088 ]] || { echo "Test 2 failed: Expected 56088, got $result"; exit 1; }

    result=$(multiply_numbers 1 50000)
    [[ "$result" -eq 50000 ]] || { echo "Test 3 failed: Expected 50000, got $result"; exit 1; }

    result=$(multiply_numbers 250 200)
    [[ "$result" -eq 50000 ]] || { echo "Test 4 failed: Expected 50000, got $result"; exit 1; }

    result=$(multiply_numbers 500 100)
    [[ "$result" -eq 50000 ]] || { echo "Test 5 failed: Expected 50000, got $result"; exit 1; }
}

test_multiply_numbers