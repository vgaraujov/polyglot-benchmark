#!/bin/bash

ascii_to_char() {
    # Converts an ASCII code to its corresponding character.
    # Args:
    #     ascii_code (int): The ASCII code to be converted.
    #
    # Output:
    #     Prints the character corresponding to the given ASCII code.
    #
    # Examples:
    # >>> ascii_to_char 66
    # B
    # >>> ascii_to_char 97
    # a
    local ascii_code=$1
    # Convert ASCII code to character
    printf "\\$(printf '%03o' "$ascii_code")\n"
}