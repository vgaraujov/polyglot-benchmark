#!/bin/bash

# Load the function definitions
. ./count_meal_combinations.sh

test_meal_combinations() {
[[ $(count_meal_combinations 3 5 "1 2 3") -eq 1 ]] || { echo "Test 1 failed"; exit 1; }
[[ $(count_meal_combinations 4 6 "1 2 3 1") -eq 2 ]] || { echo "Test 2 failed"; exit 1; }
[[ $(count_meal_combinations 5 10 "2 2 2 2 2") -eq 1 ]] || { echo "Test 3 failed"; exit 1; }
[[ $(count_meal_combinations 3 3 "1 1 1") -eq 1 ]] || { echo "Test 4 failed"; exit 1; }
[[ $(count_meal_combinations 4 8 "1 2 3 5") -eq 2 ]] || { echo "Test 5 failed"; exit 1; }
}

test_meal_combinations