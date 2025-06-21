#!/bin/bash

print_ascii_code() {
    # Prints the ASCII code of a given visible character (excluding space).
    # Args:
    #     char (string): A single character for which the ASCII code will be printed.
    #
    # Output:
    #     Prints the ASCII code of the given character.
    #
    # Examples:
    # >>> print_ascii_code 'B'
    # 66
    # >>> print_ascii_code 'z'
    # 122