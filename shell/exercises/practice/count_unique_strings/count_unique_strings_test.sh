#!/bin/bash

# Load the function definitions
. ./count_unique_strings.sh

# Testing function
test_count_unique_strings() {
[[ $(count_unique_strings "apple banana mango" "banana fruits apple") == "2" ]] || { echo "Test 1 failed"; exit 1; }
[[ $(count_unique_strings "hello world" "world hello planet") == "2" ]] || { echo "Test 2 failed"; exit 1; }
[[ $(count_unique_strings "one two three" "four five six") == "0" ]] || { echo "Test 3 failed"; exit 1; }
[[ $(count_unique_strings "one two two" "two one one") == "0" ]] || { echo "Test 4 failed"; exit 1; }
[[ $(count_unique_strings "a b c d e" "a b c d e") == "5" ]] || { echo "Test 5 failed"; exit 1; }
[[ $(count_unique_strings "dog cat" "cat dog bird") == "2" ]] || { echo "Test 6 failed"; exit 1; }
[[ $(count_unique_strings "x y z" "x y z a b c") == "3" ]] || { echo "Test 7 failed"; exit 1; }
}

test_count_unique_strings