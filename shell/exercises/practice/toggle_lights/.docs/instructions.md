Write a Shell function `toggle_lights() {
local n=$1
` to solve the following problem:
This function simulates a sequence of toggling lights. Initially, all lights are off. 
In each round, a person toggles the state of lights that are multiples of their number. 
For example, the first person toggles all lights, the second person toggles every second light, and so on.
The function outputs the numbers of the lights that remain on after N rounds.
Example Usage:
>>> toggle_lights 5
1 4
>>> toggle_lights 6
1 4
>>> toggle_lights 10
1 4 9