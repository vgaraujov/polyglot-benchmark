#!/bin/bash
find_substring_index() {
local haystack="$1"
local needle="$2"

# This function finds the first occurrence of the substring 'needle' in the string 'haystack'.
# It returns the index of the first character of the first occurrence of 'needle'.
# If 'needle' is not a part of 'haystack', it returns -1.
# Example Usage:
# >>> find_substring_index "hello" "ll"
# 2
# >>> find_substring_index "abcd" "e"
# -1
# >>> find_substring_index "openai" "ai"
# 4