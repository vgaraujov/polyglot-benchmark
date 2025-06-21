#!/bin/bash

# Load the function definitions
. ./transpose_file.sh

# Test function for transpose_file
test_transpose_file() {
# Create a sample file.txt file
echo -e "1 2 3\n4 5 6\n7 8 9" > file.txt

# Expected output
local expected_output=$(echo -e "1 4 7\n2 5 8\n3 6 9")

# Actual output from the function
local actual_output=$(transpose_file)

# Compare actual output to expected output
[[ "$actual_output" == "$expected_output" ]] || { echo "Test 1 failed"; exit 1; }

# Clean up
rm file.txt
}

# Call the test function
test_transpose_file