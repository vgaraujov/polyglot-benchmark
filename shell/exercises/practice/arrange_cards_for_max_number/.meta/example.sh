#!/bin/bash
arrange_cards_for_max_number() {
local cards=($1)
# This function arranges cards with numbers 0 and 5 to form the largest number divisible by 90.
# If it's not possible to form such a number, the function returns -1.
# Input: A string of numbers (only 0s and 5s) representing the cards.
# Output: The largest number divisible by 90 that can be formed, or -1 if it's not possible.
# Example Usage:
# >>> arrange_cards_for_max_number "5 0 5 0"
# 0
# >>> arrange_cards_for_max_number "5 5 5 5 5 5 5 5 0 5 5"
# 5555555550
# >>> arrange_cards_for_max_number "5 5"
# -1
local count_5=0
local count_0=0

# Count the number of 5s and 0s
for card in "${cards[@]}"; do
if [[ $card -eq 5 ]]; then
((count_5++))
elif [[ $card -eq 0 ]]; then
((count_0++))
fi
done

# Special case: if only zeros are present, return 0
if (( count_0 > 0 && count_5 < 9 )); then
echo 0
return
fi

# Check if it's possible to form a number
if (( count_0 == 0 || count_5 < 9 )); then
echo -1
return
fi

# Calculate the number of 5s to use (multiple of 9)
count_5=$((count_5 / 9 * 9))

# Construct the largest number
local result=""
for (( i=0; i<count_5; i++ )); do
result+="5"
done
for (( i=0; i<count_0; i++ )); do
result+="0"
done

echo $result
}