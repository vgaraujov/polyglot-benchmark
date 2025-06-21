#!/bin/bash

# Load the function definitions
. ./calculate_tax.sh

# Testing function
test_calculate_tax() {
[[ $(calculate_tax "10000 10 20000 20 30000 30" 25000) == "4500" ]] || { echo "Test 1 failed"; exit 1; }
[[ $(calculate_tax "10000 10 20000 20 30000 30" 15000) == "2000" ]] || { echo "Test 2 failed"; exit 1; }
[[ $(calculate_tax "5000 5 10000 10 20000 20" 12000) == "1150" ]] || { echo "Test 3 failed"; exit 1; }
[[ $(calculate_tax "5000 5 10000 10 20000 20" 5000) == "250" ]] || { echo "Test 4 failed"; exit 1; }
[[ $(calculate_tax "10000 10 20000 20" 0) == "0" ]] || { echo "Test 5 failed"; exit 1; }
}

test_calculate_tax