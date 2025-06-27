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
local -a sides=($(echo -e "$a\n$b\n$c" | sort -n))
local opposite=${sides[0]} # Smallest side, opposite to the smaller acute angle
local hypotenuse=${sides[2]} # Largest side, the hypotenuse

# Function to calculate GCD (Greatest Common Divisor)
gcd() {
local x=$1
local y=$2
while [[ $y -ne 0 ]]; do
local temp=$y
y=$((x % y))
x=$temp
done
echo $x
}

# Calculate GCD of opposite and hypotenuse
local common_divisor=$(gcd $opposite $hypotenuse)

# Calculate reduced fraction
local numerator=$((opposite / common_divisor))
local denominator=$((hypotenuse / common_divisor))

echo "$numerator/$denominator"
}