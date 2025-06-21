#!/bin/bash

# Load the function definitions
. ./generate_password.sh

test_generate_password() {
[[ $(generate_password 1 "qwe") == "rxf" ]] || { echo "Test 1 failed"; exit 1; }
[[ $(generate_password 3 "abc") == "def" ]] || { echo "Test 2 failed"; exit 1; }
[[ $(generate_password 2 "xyz") == "zab" ]] || { echo "Test 3 failed"; exit 1; }
[[ $(generate_password 4 "hello") == "lipps" ]] || { echo "Test 4 failed"; exit 1; }
[[ $(generate_password 5 "password") == "ufxxbtwi" ]] || { echo "Test 5 failed"; exit 1; }
}

test_generate_password