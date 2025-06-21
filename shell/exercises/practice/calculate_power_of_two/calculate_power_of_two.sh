#!/bin/bash

calculate_power_of_two() {
    # Calculates 2 to the power of n.
    # Given a non-negative integer n, this function computes 2^n.
    # It is important to ensure that n is within the valid range to avoid arithmetic overflow in shell.
    # Args:
    #     n (int): The exponent to raise 2 to. Must be a non-negative integer.
    #
    # Output:
    #     Prints the value of 2 raised to the power of n.
    #
    # Examples:
    # >>> calculate_power_of_two 5
    # 32
    # >>> calculate_power_of_two 10
    # 1024