#!/bin/bash

# Load the function definitions
. ./find_sum_segments.sh

test_find_sum_segments() {
local result=$(find_sum_segments 10000)
local expected="18 142
297 328
388 412
1998 2002"
[[ $result == "$expected" ]] || { echo "Test 1 failed"; exit 1; }

result=$(find_sum_segments 100)
expected="9 16
18 22"
[[ $result == "$expected" ]] || { echo "Test 2 failed"; exit 1; }
}

test_find_sum_segments