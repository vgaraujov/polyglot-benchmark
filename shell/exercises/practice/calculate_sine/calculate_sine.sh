#!/bin/bash
calculate_sine() {
local a=$1
local b=$2
local c=$3
# This function calculates the sine of the smaller acute angle in a Pythagorean triplet (a, b, c).
# It outputs the sine value in reduced fraction format.
# The Pythagorean triplet is provided as three positive integers, which represent the sides of a right-angled triangle.
# The function assumes that the input numbers form a valid Pythagorean triplet.
# Example Usage:
# >>> calculate_sine 3 5 4
# 3/5
# >>> calculate_sine 5 12 13
# 5/13
# >>> calculate_sine 8 15 17
# 8/17