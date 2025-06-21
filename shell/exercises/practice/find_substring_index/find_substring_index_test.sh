#!/bin/bash

# Load the function definitions
. ./find_substring_index.sh

test_find_substring_index() {
[[ $(find_substring_index "hello" "ll") -eq 2 ]] || { echo "Test 1 failed"; exit 1; }
[[ $(find_substring_index "abcd" "e") -eq -1 ]] || { echo "Test 2 failed"; exit 1; }
[[ $(find_substring_index "openai" "ai") -eq 4 ]] || { echo "Test 3 failed"; exit 1; }
[[ $(find_substring_index "apple" "pp") -eq 1 ]] || { echo "Test 4 failed"; exit 1; }
[[ $(find_substring_index "banana" "na") -eq 2 ]] || { echo "Test 5 failed"; exit 1; }
[[ $(find_substring_index "teststring" "string") -eq 4 ]] || { echo "Test 6 failed"; exit 1; }
[[ $(find_substring_index "abcd" "") -eq 0 ]] || { echo "Test 7 failed"; exit 1; }
}

test_find_substring_index