#!/bin/bash

multiply_numbers() {
    # Calculates the product of two positive integers A and B.
    # Given two positive integers, this function computes their product.
    # It is important to consider the range of the result to ensure that it does not exceed shell arithmetic limits.
    # Args:
    #     A (int): The first positive integer.
    #     B (int): The second positive integer.
    #
    # Output:
    #     Prints the product of A and B.
    #
    # Examples:
    # >>> multiply_numbers 5 10
    # 50
    # >>> multiply_numbers 123 456
    # 56088
    local A=$1
    local B=$2
    # Calculate and print the product of A and B
    echo $((A * B))
}