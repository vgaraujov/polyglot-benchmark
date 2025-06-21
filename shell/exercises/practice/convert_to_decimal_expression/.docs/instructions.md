Write a Shell function `convert_to_decimal_expression() {
local base=$1
local num=$2
` to solve the following problem:
This function converts a number 'N' from base 'M' to its decimal representation as an expression.
It outputs the expression as a sum of terms, each term in the form of coefficient*base^power.
Coefficients that are zero are omitted in the output.
Input: Base 'M' and number 'N' in base 'M'.
Output: Decimal representation as an expression.
Example Usage:
>>> convert_to_decimal_expression 2 10101
1*2^4+1*2^2+1*2^0
>>> convert_to_decimal_expression 3 102
1*3^2+2*3^0