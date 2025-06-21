#!/bin/bash

# Load the function definitions
. ./is_valid_sudoku.sh

# Testing function
test_is_valid_sudoku() {
local validSudoku="5 3 . . 7 . . . .;6 . . 1 9 5 . . .;. 9 8 . . . . 6 .;8 . . . 6 . . . 3;4 . . 8 . 3 . . 1;7 . . . 2 . . . 6;. 6 . . . . 2 8 .;. . . 4 1 9 . . 5;. . . . 8 . . 7 9"
local invalidSudoku="8 3 . . 7 . . . .;6 . . 1 9 5 . . .;. 9 8 . . . . 6 .;8 . . . 6 . . . 3;4 . . 8 . 3 . . 1;7 . . . 2 . . . 6;. 6 . . . . 2 8 .;. . . 4 1 9 . . 5;. . . . 8 . . 7 9"

[[ $(is_valid_sudoku "$validSudoku") == "true" ]] || { echo "Test 1 failed"; exit 1; }
[[ $(is_valid_sudoku "$invalidSudoku") == "false" ]] || { echo "Test 2 failed"; exit 1; }
}

test_is_valid_sudoku