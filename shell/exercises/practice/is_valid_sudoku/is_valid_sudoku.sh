#!/bin/bash

# Validate a 9x9 Sudoku board.
# The function takes a 9x9 Sudoku board as a string, where rows are separated by semicolons and elements by spaces.
# Returns "true" if the Sudoku is valid, "false" otherwise.
# >>> is_valid_sudoku "5 3 . . 7 . . . .;6 . . 1 9 5 . . .;. 9 8 . . . . 6 .;8 . . . 6 . . . 3;4 . . 8 . 3 . . 1;7 . . . 2 . . . 6;. 6 . . . . 2 8 .;. . . 4 1 9 . . 5;. . . . 8 . . 7 9"
# true
# >>> is_valid_sudoku "8 3 . . 7 . . . .;6 . . 1 9 5 . . .;. 9 8 . . . . 6 .;8 . . . 6 . . . 3;4 . . 8 . 3 . . 1;7 . . . 2 . . . 6;. 6 . . . . 2 8 .;. . . 4 1 9 . . 5;. . . . 8 . . 7 9"
# false
is_valid_sudoku() {
local board=$1
local -A rowSeen colSeen boxSeen

# Convert string to 2D array
local -a grid
IFS=';' read -ra grid <<< "$board"