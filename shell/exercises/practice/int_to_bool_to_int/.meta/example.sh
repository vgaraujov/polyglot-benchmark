#!/bin/bash

int_to_bool_to_int() {
    # Converts an integer to a boolean value, then converts this boolean back to an integer.
    # The process involves assigning an integer value to a boolean variable and then
    # assigning this boolean value back to an integer variable.
    # Args:
    #     initial_int (int): The initial integer value.
    #
    # Output:
    #     Prints the integer value obtained after conversion from integer to boolean and back to integer.
    #
    # Examples:
    # >>> int_to_bool_to_int 0
    # 0
    # >>> int_to_bool_to_int -5
    # 1
    local initial_int=$1
    local bool_val
    local final_int

    # Convert initial_int to boolean
    if [[ initial_int -ne 0 ]]; then
        bool_val=1
    else
        bool_val=0
    fi

    # Convert boolean back to integer
    final_int=$bool_val

    echo "$final_int"
}