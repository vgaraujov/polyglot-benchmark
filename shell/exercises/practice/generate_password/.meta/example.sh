#!/bin/bash
generate_password() {
local shift=$1
local string=$2
# This function generates a password by shifting each letter of the given string by 'n' positions in the alphabet.
# The shift wraps around the alphabet, so 'z' followed by a shift of 1 would be 'a'.
# Input: Shift amount 'n' and the original string.
# Output: Transformed string representing the password.
# Example Usage:
# >>> generate_password 1 "qwe"
# rxf
# >>> generate_password 3 "abc"
# def
# >>> generate_password 2 "xyz"
# zab
local shifted_string=""
local alphabet=(a b c d e f g h i j k l m n o p q r s t u v w x y z)

# Function to find index of a character in the alphabet array
find_index() {
local char=$1
for i in "${!alphabet[@]}"; do
if [[ "${alphabet[$i]}" = "${char}" ]]; then
echo $i
return
fi
done
}

# Shift each character
for (( i=0; i<${#string}; i++ )); do
local char=${string:$i:1}
local index=$(find_index $char)
local new_index=$(((index + shift) % 26))
shifted_string+="${alphabet[$new_index]}"
done

echo $shifted_string
}