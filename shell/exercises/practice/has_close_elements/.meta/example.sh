#!/bin/bash

has_close_elements() {
local numbers=($1)
local threshold=$2
#Check if in given list of numbers, are any two numbers closer to each other than
#given threshold.
#>>> has_close_elements([1.0, 2.0, 3.0], 0.5)
#False
#>>> has_close_elements([1.0, 2.8, 3.0, 4.0, 5.0, 2.0], 0.3)
#True
local n=${#numbers[@]}

for (( i=0; i<$n; i++ )); do
for (( j=0; j<$n; j++ )); do
if [[ $i -ne $j ]]; then
local diff=$(echo "${numbers[$i]} - ${numbers[$j]}" | bc)
diff=$(echo "$diff" | tr -d -) # Absolute value

local result=$(echo "$diff < $threshold" | bc)
if [[ $result -eq 1 ]]; then
echo "true"
return 0
fi
fi
done
done

echo "false"
}