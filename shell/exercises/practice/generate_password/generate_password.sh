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