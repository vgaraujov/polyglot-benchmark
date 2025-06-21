Write a Shell function `count_unique_strings() {
local -a words1=($1)
local -a words2=($2)` to solve the following problem:

Count the number of strings that appear exactly once in both arrays.
The function takes two strings representing the arrays, where elements are separated by spaces.
Returns the count of strings that appear exactly once in both arrays.
>>> count_unique_strings "apple banana mango" "banana fruits apple"
2
>>> count_unique_strings "hello world" "world hello planet"
2
