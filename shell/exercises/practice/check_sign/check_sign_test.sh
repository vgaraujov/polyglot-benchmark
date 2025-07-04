#!/bin/bash

# Load the function definitions
. ./check_sign.sh


test_check_sign() {
    [[ $(check_sign 95) == "positive" ]] || { echo "Test 1 failed"; exit 1; }
    [[ $(check_sign 0) == "zero" ]] || { echo "Test 2 failed"; exit 1; }
    [[ $(check_sign -95) == "negative" ]] || { echo "Test 3 failed"; exit 1; }
    [[ $(check_sign 1000000000) == "positive" ]] || { echo "Test 4 failed"; exit 1; }
    [[ $(check_sign -1000000000) == "negative" ]] || { echo "Test 5 failed"; exit 1; }
    [[ $(check_sign 1) == "positive" ]] || { echo "Test 6 failed"; exit 1; }
    [[ $(check_sign -1) == "negative" ]] || { echo "Test 7 failed"; exit 1; }
}

test_check_sign