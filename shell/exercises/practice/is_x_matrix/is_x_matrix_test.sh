#!/bin/bash

# Load the function definitions
. ./is_x_matrix.sh

# Testing function
test_is_x_matrix() {
[[ $(is_x_matrix "1 0 0;0 1 0;0 0 1") == "false" ]] || { echo "Test 1 failed"; exit 1; }
[[ $(is_x_matrix "1 0 2;0 1 0;3 0 1") == "true" ]] || { echo "Test 2 failed"; exit 1; }
[[ $(is_x_matrix "2 0 0 0;0 3 0 0;0 0 5 0;0 0 0 7") == "false" ]] || { echo "Test 3 failed"; exit 1; }
[[ $(is_x_matrix "1 0 0;0 0 0;0 0 1") == "false" ]] || { echo "Test 4 failed"; exit 1; }
[[ $(is_x_matrix "0") == "false" ]] || { echo "Test 5 failed"; exit 1; }
[[ $(is_x_matrix "5") == "true" ]] || { echo "Test 6 failed"; exit 1; }
[[ $(is_x_matrix "1 0 1;0 1 0;1 0 1") == "true" ]] || { echo "Test 7 failed"; exit 1; }
}

test_is_x_matrix