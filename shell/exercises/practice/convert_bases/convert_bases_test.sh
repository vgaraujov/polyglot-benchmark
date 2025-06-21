#!/bin/bash

# Load the function definitions
. ./convert_bases.sh

test_convert_bases() {
[[ $(convert_bases 10 "1024" 2) == "10000000000" ]] || { echo "Test 1 failed"; exit 1; }
[[ $(convert_bases 16 "1A3" 8) == "643" ]] || { echo "Test 2 failed"; exit 1; }
[[ $(convert_bases 2 "1101" 10) == "13" ]] || { echo "Test 3 failed"; exit 1; }
[[ $(convert_bases 16 "ABC" 2) == "101010111100" ]] || { echo "Test 4 failed"; exit 1; }
[[ $(convert_bases 8 "777" 16) == "1FF" ]] || { echo "Test 5 failed"; exit 1; }
[[ $(convert_bases 4 "123" 10) == "27" ]] || { echo "Test 6 failed"; exit 1; }
[[ $(convert_bases 20 "1A" 2) == "INVALID INPUT" ]] || { echo "Test 7 failed"; exit 1; }
}

test_convert_bases