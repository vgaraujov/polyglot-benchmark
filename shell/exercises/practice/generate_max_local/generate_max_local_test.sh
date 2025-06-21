#!/bin/bash

# Load the function definitions
. ./generate_max_local.sh

# Testing function
test_generate_max_local() {
[[ $(generate_max_local "1 2 3 4;5 6 7 8;9 10 11 12;13 14 15 16") == "11 12 15 16" ]] || { echo "Test 1 failed"; exit 1; }
[[ $(generate_max_local "9 1 7;4 8 2;3 6 5") == "9" ]] || { echo "Test 2 failed"; exit 1; }
[[ $(generate_max_local "1 2 3;4 5 6;7 8 9") == "9" ]] || { echo "Test 3 failed"; exit 1; }
[[ $(generate_max_local "5 6 7;8 9 10;11 12 13") == "13" ]] || { echo "Test 4 failed"; exit 1; }
[[ $(generate_max_local "10 20 30;40 50 60;70 80 90") == "90" ]] || { echo "Test 5 failed"; exit 1; }
}

test_generate_max_local