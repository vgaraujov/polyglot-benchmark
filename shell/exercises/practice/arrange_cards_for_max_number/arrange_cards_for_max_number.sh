#!/bin/bash
arrange_cards_for_max_number() {
local cards=($1)
# This function arranges cards with numbers 0 and 5 to form the largest number divisible by 90.
# If it's not possible to form such a number, the function returns -1.
# Input: A string of numbers (only 0s and 5s) representing the cards.
# Output: The largest number divisible by 90 that can be formed, or -1 if it's not possible.
# Example Usage:
# >>> arrange_cards_for_max_number "5 0 5 0"
# 0
# >>> arrange_cards_for_max_number "5 5 5 5 5 5 5 5 0 5 5"
# 5555555550
# >>> arrange_cards_for_max_number "5 5"
# -1