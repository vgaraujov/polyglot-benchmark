#!/bin/bash

# Perform operations on an array to remove pairs of equal integers.
# Returns a two-element array: [number of pairs formed, number of remaining integers].
# >>> process_array "3 1 2 3 2"
# 2 1
# >>> process_array "1 2 3 4"
# 0 4
process_array() {
local nums=($1)