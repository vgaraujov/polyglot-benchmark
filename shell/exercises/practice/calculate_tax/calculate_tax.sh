#!/bin/bash

# Calculate taxes based on a progressive tax bracket system.
# The function takes two arguments:
# 1. A string representing the tax brackets in the format "upper0 percent0 upper1 percent1 ..."
# 2. An integer representing the total income.
# It returns the total tax amount.
# >>> calculate_tax "10000 10 20000 20 30000 30" 25000
# 4500
# >>> calculate_tax "10000 10 20000 20 30000 30" 15000
# 2000
calculate_tax() {
IFS=' ' read -ra brackets <<< "$1"
local income=$2