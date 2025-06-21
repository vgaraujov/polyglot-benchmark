#!/bin/bash

# Load the function definitions
. ./count_word_frequency.sh

# Test function for count_word_frequency
test_count_word_frequency() {
# Create a sample frequency.txt file
echo -e "apple banana apple\nbanana banana apple" > frequency.txt

# Expected output
local expected_output=$(echo -e "apple 3\nbanana 3")

# Actual output from the function
local actual_output=$(count_word_frequency)

# Compare actual output to expected output
[[ "$actual_output" == "$expected_output" ]] || { echo "Test 1 failed"; exit 1; }

# Clean up
rm frequency.txt
}

# Call the test function
test_count_word_frequency