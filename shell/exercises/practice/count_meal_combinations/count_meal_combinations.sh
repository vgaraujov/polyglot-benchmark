#!/bin/bash

count_meal_combinations() {
local n=$1
local m=$2
local dish_prices=($3)
# This function calculates the number of ways to spend all available money on a selection of dishes in a restaurant. Each dish can only be purchased once. The function takes the number of dishes available, the total amount of money, and a string containing the price of each dish.

# Example Cases:

# count_meal_combinations 3 5 "1 2 3" should return 2 (1+2+2 or 3+2).
# count_meal_combinations 4 6 "1 2 3 1" should return 3 (1+2+3, 1+1+2+2, or 2+3+1).