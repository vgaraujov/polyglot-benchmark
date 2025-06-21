#!/bin/bash

# Load the function definitions
. ./reverse_number.sh

test_reverse_number() {
    local result

    result=$(reverse_number 123)
    [[ "$result" == "321" ]] || { echo "Test 1 failed: Expected 321, got $result"; exit 1; }

    result=$(reverse_number 040)
    [[ "$result" == "040" ]] || { echo "Test 2 failed: Expected 040, got $result"; exit 1; }

    result=$(reverse_number 500)
    [[ "$result" == "005" ]] || { echo "Test 3 failed: Expected 005, got $result"; exit 1; }

    result=$(reverse_number 999)
    [[ "$result" == "999" ]] || { echo "Test 4 failed: Expected 999, got $result"; exit 1; }

    result=$(reverse_number 100)
    [[ "$result" == "001" ]] || { echo "Test 5 failed: Expected 001, got $result"; exit 1; }
}

test_reverse_number