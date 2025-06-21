#!/bin/bash

# Load the function definitions
. ./arrange_cards_for_max_number.sh

test_arrange_cards_for_max_number() {
[[ $(arrange_cards_for_max_number "5 0 5 0") == "0" ]] || { echo "Test 1 failed"; exit 1; }
[[ $(arrange_cards_for_max_number "5 5 5 5 5 5 5 5 0 5 5") == "5555555550" ]] || { echo "Test 2 failed"; exit 1; }
[[ $(arrange_cards_for_max_number "5 5") == "-1" ]] || { echo "Test 3 failed"; exit 1; }
[[ $(arrange_cards_for_max_number "0 0 0") == "0" ]] || { echo "Test 4 failed"; exit 1; }
[[ $(arrange_cards_for_max_number "5 5 5 5 5 5 5 5 5 0") == "5555555550" ]] || { echo "Test 5 failed"; exit 1; }
}

test_arrange_cards_for_max_number