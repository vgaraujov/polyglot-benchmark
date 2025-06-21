#!/bin/bash

# Load the function definitions
. ./ascii_to_char.sh

test_ascii_to_char() {
    local result

    result=$(ascii_to_char 66)
    [[ "$result" == "B" ]] || { echo "Test 1 failed: Expected B, got $result"; exit 1; }

    result=$(ascii_to_char 97)
    [[ "$result" == "a" ]] || { echo "Test 2 failed: Expected a, got $result"; exit 1; }

    result=$(ascii_to_char 36)
    [[ "$result" == "$" ]] || { echo "Test 3 failed: Expected $, got $result"; exit 1; }

    result=$(ascii_to_char 57)
    [[ "$result" == "9" ]] || { echo "Test 4 failed: Expected 9, got $result"; exit 1; }

    result=$(ascii_to_char 32)
    [[ "$result" == " " ]] || { echo "Test 5 failed: Expected space, got $result"; exit 1; }
}

test_ascii_to_char