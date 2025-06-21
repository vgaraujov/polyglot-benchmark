#!/bin/bash

# Load the function definitions
. ./evaluate_hand.sh

# Testing function
test_evaluate_hand() {
[[ $(evaluate_hand "2 3 4 5 6" "H H H H H") == "Flush" ]] || { echo "Test 1 failed"; exit 1; }
[[ $(evaluate_hand "4 4 4 7 8" "H D S C H") == "Three of a Kind" ]] || { echo "Test 2 failed"; exit 1; }
[[ $(evaluate_hand "5 5 9 10 J" "C D H S D") == "Pair" ]] || { echo "Test 3 failed"; exit 1; }
[[ $(evaluate_hand "2 3 5 8 K" "C D H S D") == "High Card" ]] || { echo "Test 4 failed"; exit 1; }
[[ $(evaluate_hand "9 9 9 9 8" "H D S C H") == "Three of a Kind" ]] || { echo "Test 5 failed"; exit 1; }
[[ $(evaluate_hand "A K Q J 10" "H H C D S") == "High Card" ]] || { echo "Test 6 failed"; exit 1; }
[[ $(evaluate_hand "3 3 6 6 K" "H D S C H") == "Pair" ]] || { echo "Test 7 failed"; exit 1; }
}

test_evaluate_hand