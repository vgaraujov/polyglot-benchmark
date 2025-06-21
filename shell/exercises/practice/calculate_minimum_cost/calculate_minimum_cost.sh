#!/bin/bash
calculate_minimum_cost() {
local n=$1
local -a pack1=($2)
local -a pack2=($3)
local -a pack3=($4)
# This function calculates the minimum cost needed to buy at least 'n' pencils,
# where pencils are available in three different packaging options, each with its own quantity and price.
# The function does not allow breaking the packaging, so it may require buying more pencils than 'n'.
# Each packaging option is given in the format 'quantity price'.
# Input: Number of pencils needed and three packaging options.
# Output: Minimum cost to buy at least 'n' pencils.
# Example Usage:
# >>> calculate_minimum_cost 57 "2 2" "50 30" "30 27"
# 54
# >>> calculate_minimum_cost 100 "10 5" "20 8" "50 20"
# 40
# >>> calculate_minimum_cost 45 "5 3" "15 10" "25 17"
# 18