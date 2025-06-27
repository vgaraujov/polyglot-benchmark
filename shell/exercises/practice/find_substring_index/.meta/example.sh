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

if [ -z "$needle" ]; then
echo 0
return 0
fi

local length=${#haystack}
local needle_length=${#needle}

for (( i=0; i<=$length-needle_length; i++ )); do
if [ "${haystack:$i:$needle_length}" == "$needle" ]; then
echo $i
return 0
fi
done

echo -1
}