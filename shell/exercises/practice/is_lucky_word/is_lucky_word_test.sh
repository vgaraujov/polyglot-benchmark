#!/bin/bash

# Load the function definitions
. ./is_lucky_word.sh

test_is_lucky_word() {
local result
result=$(is_lucky_word "error")
[[ $result == $'Lucky Word\n2' ]] || { echo "Test 1 failed"; exit 1; }
result=$(is_lucky_word "olympic")
[[ $result == $'No Answer\n0' ]] || { echo "Test 2 failed"; exit 1; }
result=$(is_lucky_word "apple")
[[ $result == $'No Answer\n0' ]] || { echo "Test 3 failed"; exit 1; }
}

test_is_lucky_word