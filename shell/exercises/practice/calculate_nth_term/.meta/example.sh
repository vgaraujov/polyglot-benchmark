#!/bin/bash

calculate_nth_term() {
    # Calculates the nth term of an arithmetic sequence given the first two terms a1 and a2.
    # The difference between any two consecutive terms is constant.
    # Args:
    #     a1 (int): The first term of the arithmetic sequence.
    #     a2 (int): The second term of the arithmetic sequence.
    #     n (int): The term number to calculate.
    #
    # Output:
    #     Prints the value of the nth term in the arithmetic sequence.
    #
    # Examples:
    # >>> calculate_nth_term 1 3 5
    # 9
    local a1=$1
    local a2=$2
    local n=$3
    local d=$((a2 - a1)) # Common difference
    local nth_term=$((a1 + (n - 1) * d))
    echo "$nth_term"
}