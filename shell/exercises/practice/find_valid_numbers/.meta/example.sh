#!/bin/bash

# Find valid phone numbers in file.txt
# A valid phone number has one of the following formats:
# 1. xxx-xxx-xxxx
# 2. (xxx) xxx-xxxx
# 3. xxx xxx xxxx
# Returns a list of valid numbers, one per line.
find_valid_numbers() {
    # Default to processing file.txt
    local file="file.txt"
    
    # Check if the file exists
    if [ ! -f "$file" ]; then
        echo "Error: file.txt not found"
        return 1
    fi
    
    # Use grep to match the required patterns
    grep -E '^\([0-9]{3}\) [0-9]{3}-[0-9]{4}$|^[0-9]{3}-[0-9]{3}-[0-9]{4}$' "$file"
}
