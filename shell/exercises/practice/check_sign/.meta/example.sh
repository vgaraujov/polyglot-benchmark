#!/bin/bash

check_sign() {
    # Check the sign of a given integer.
    # If the integer is greater than zero, return "positive".
    # If the integer is zero, return "zero".
    # If the integer is less than zero, return "negative".
    #
    # Example:
    # >>> check_sign 95
    # positive
    # >>> check_sign 0
    # zero
    # >>> check_sign -95
    # negative
if [ $1 -gt 0 ]; then
        echo "positive"
    elif [ $1 -eq 0 ]; then
        echo "zero"
    else
        echo "negative"
    fi
}