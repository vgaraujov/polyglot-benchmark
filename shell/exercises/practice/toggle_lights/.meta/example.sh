#!/bin/bash
toggle_lights() {
local n=$1
# This function simulates a sequence of toggling lights. Initially, all lights are off. 
# In each round, a person toggles the state of lights that are multiples of their number. 
# For example, the first person toggles all lights, the second person toggles every second light, and so on.
# The function outputs the numbers of the lights that remain on after N rounds.
# Example Usage:
# >>> toggle_lights 5
# 1 4
# >>> toggle_lights 6
# 1 4
# >>> toggle_lights 10
# 1 4 9
local lights=()

# Initialize all lights to off (0)
for (( i=1; i<=n; i++ )); do
lights[$i]=0
done

# Toggle lights
for (( i=1; i<=n; i++ )); do
for (( j=i; j<=n; j+=i )); do
lights[$j]=$((1 - lights[$j]))
done
done

# Output lights that are on (1)
for (( i=1; i<=n; i++ )); do
if [[ ${lights[$i]} -eq 1 ]]; then
echo -n "$i "
fi
done
echo
}