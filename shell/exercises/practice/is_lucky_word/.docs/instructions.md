Write a Shell function `is_lucky_word() {
local word=$1
local -A letter_counts
` to solve the following problem:
This function checks if the given word is a "Lucky Word".
A word is considered "Lucky" if the difference between the highest and lowest letter frequency is a prime number.
Input: A single word consisting of lowercase letters and with a length less than 100.
Output: Two lines - the first line is either 'Lucky Word' or 'No Answer', and the second line is the difference if the word is "Lucky", or 0 otherwise.
Example Usage:
>>> is_lucky_word "error"
Lucky Word
2
>>> is_lucky_word "olympic"
No Answer
0