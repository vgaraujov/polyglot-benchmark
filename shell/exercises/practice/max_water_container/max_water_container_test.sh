#!/bin/bash

# Load the function definitions
. ./max_water_container.sh

test_max_water_container() {
[[ $(max_water_container "1 8 6 2 5 4 8 3 7") == "49" ]] || { echo "Test 1 failed"; exit 1; }
[[ $(max_water_container "1 1") == "1" ]] || { echo "Test 2 failed"; exit 1; }
[[ $(max_water_container "4 3 2 1 4") == "16" ]] || { echo "Test 3 failed"; exit 1; }
[[ $(max_water_container "1 2 1") == "2" ]] || { echo "Test 4 failed"; exit 1; }
[[ $(max_water_container "2 3 4 5 18 17 6") == "17" ]] || { echo "Test 5 failed"; exit 1; }
[[ $(max_water_container "1 2 4 3") == "4" ]] || { echo "Test 6 failed"; exit 1; }
[[ $(max_water_container "3 9 3 4 7 2 12 6") == "45" ]] || { echo "Test 7 failed"; exit 1; }
}

test_max_water_container