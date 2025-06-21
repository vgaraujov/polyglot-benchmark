#!/bin/bash

# Evaluate poker hands based on given ranks and suits.
# The function takes two strings: one for ranks and one for suits, each value separated by spaces.
# Returns the best hand type: "Flush", "Three of a Kind", "Pair", or "High Card".
# >>> evaluate_hand "2 3 4 5 6" "H H H H H"
# Flush
# >>> evaluate_hand "4 4 4 7 8" "H D S C H"
# Three of a Kind
evaluate_hand() {
local ranks=($1)
local suits=($2)