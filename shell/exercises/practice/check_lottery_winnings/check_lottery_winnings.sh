#!/bin/bash

check_lottery_winnings() {
local winning_numbers=($1)
# This function checks the number of matches each lottery ticket has with the winning numbers
# and categorizes each ticket based on the prize won. It returns the count of tickets for each prize category.
# The function takes the winning numbers and the lottery tickets as arguments.
# Example usage:
# check_lottery_winnings "1 2 3 4 5 6 7" "1 8 9 10 11 12 13" "2 3 4 5 6 7 8"
# This would return '0 1 0 0 0 0 0', as the second ticket wins a first prize.

# check_lottery_winnings "10 11 12 13 14 15 16" "17 18 19 20 21 22 23" "24 25 26 27 28 29 30"
# This would return '0 0 0 0 0 0 0', as no tickets match any winning numbers.