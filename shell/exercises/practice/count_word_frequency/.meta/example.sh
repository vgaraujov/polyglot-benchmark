#!/bin/bash

# Count the frequency of each word in frequency.txt
# example
# apple banana apple\nbanana banana apple
# apple 3\nbanana 3

count_word_frequency() {
tr -s ' ' '\n' < frequency.txt | grep -v '^$' | sort | uniq -c | awk '{print $2, $1}'
}