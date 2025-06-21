#!/bin/bash

convert_bases() {
local input_base=$1
local number=$2
local target_base=$3
# This function converts a number from one base to another.
# The function accepts three arguments: the base of the input number (2 to 16),
# the number to be converted (in string format), and the base to which it should be converted (2 to 16).
# The function returns the converted number in string format.
# The input number may include digits 0-9 and uppercase letters A-F for bases higher than 10.
# If the input number or the base is invalid, the function returns 'INVALID INPUT'.
# Examples:
# convert_bases 10 "255" 2
# # Returns: "11111111"
# convert_bases 2 "1010" 16
# # Returns: "A"
# convert_bases 8 "17" 10
# # Returns: "15"