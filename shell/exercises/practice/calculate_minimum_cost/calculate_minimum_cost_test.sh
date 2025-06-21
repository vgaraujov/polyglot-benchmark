#!/bin/bash

# Load the function definitions
. ./calculate_minimum_cost.sh

test_calculate_minimum_cost() {
[[ $(calculate_minimum_cost 57 "2 2" "50 30" "30 27") -eq 54 ]] || { echo "Test 1 failed"; exit 1; }
[[ $(calculate_minimum_cost 100 "10 5" "20 8" "50 20") -eq 40 ]] || { echo "Test 2 failed"; exit 1; }
[[ $(calculate_minimum_cost 45 "5 3" "15 10" "25 17") -eq 27 ]] || { echo "Test 3 failed"; exit 1; }
[[ $(calculate_minimum_cost 80 "8 4" "40 19" "60 28") -eq 38 ]] || { echo "Test 4 failed"; exit 1; }
[[ $(calculate_minimum_cost 120 "12 6" "24 9" "48 18") -eq 45 ]] || { echo "Test 5 failed"; exit 1; }
}

test_calculate_minimum_cost