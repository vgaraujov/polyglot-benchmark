#!/bin/bash

calculate_expression() {
    # Calculate the value of the expression (a+b)*c with given integers a, b, and c.
    # Args:
    #     a (int): The first integer.
    #     b (int): The second integer.
    #     c (int): The third integer.
    #
    # Returns:
    #     The result of the expression (a+b)*c.
    #
    # Examples:
    # >>> calculate_expression 1 2 3
    # 9
    # >>> calculate_expression -1 2 -3
    # -3
    local a=$1
    local b=$2
    local c=$3

    # Calculate (a+b)*c
    local result=$(( (a + b) * c ))
    echo "$result"
}