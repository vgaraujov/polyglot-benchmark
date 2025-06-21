#!/bin/bash

# Load the function definitions
. ./maximize_product.sh

test_maximize_product() {
[[ $(maximize_product 6 3) == "2 2 2 " ]] || { echo "Test 1 failed"; exit 1; }
[[ $(maximize_product 8 3) == "2 3 3 " ]] || { echo "Test 2 failed"; exit 1; }
[[ $(maximize_product 10 2) == "5 5 " ]] || { echo "Test 3 failed"; exit 1; }
[[ $(maximize_product 20 5) == "4 4 4 4 4 " ]] || { echo "Test 4 failed"; exit 1; }
[[ $(maximize_product 7 3) == "2 2 3 " ]] || { echo "Test 5 failed"; exit 1; }
[[ $(maximize_product 12 4) == "3 3 3 3 " ]] || { echo "Test 6 failed"; exit 1; }
[[ $(maximize_product 5 6) == "Error: Cannot divide 5 into 6 parts" ]] && { echo "Test 7 passed"; } || { echo "Test 7 failed"; exit 1; }
}

test_maximize_product