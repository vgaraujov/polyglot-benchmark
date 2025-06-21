Write a Shell function `is_valid_sudoku() {
local board=$1
local -A rowSeen colSeen boxSeen

` to solve the following problem:
Convert string to 2D array
local -a grid
IFS=';' read -ra grid <<< "$board"