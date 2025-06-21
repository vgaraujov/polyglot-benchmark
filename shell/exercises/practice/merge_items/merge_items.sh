#!/bin/bash

# Merge two sets of items and sum the weights of items with the same value.
# Each item is represented as [value, weight].
# The function takes two strings, each representing an array of items, where items are separated by semicolons and values by spaces.
# Returns a sorted array of unique values and their cumulative weights.
# >>> merge_items "10 5;15 10" "15 15;20 20"
# 10 5;15 25;20 20
merge_items() {
local items1=(${1//;/ })
local items2=(${2//;/ })