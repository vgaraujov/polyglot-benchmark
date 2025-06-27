#!/bin/bash

# Evaluate a hand of five cards and determine the poker hand type.
# The function takes two arguments:
# 1. A space-separated string of card ranks (2-10, J, Q, K, A)
# 2. A space-separated string of card suits (H, D, S, C)
# Returns one of the following hands: Flush, Three of a Kind, Pair, High Card.
evaluate_hand() {
    local ranks=$1
    local suits=$2
    
    # Convert the input strings to arrays
    local rank_array=()
    local suit_array=()
    read -r -a rank_array <<< "$ranks"
    read -r -a suit_array <<< "$suits"
    
    # Check for flush (all same suit)
    local is_flush=true
    local first_suit="${suit_array[0]}"
    for suit in "${suit_array[@]}"; do
        if [ "$suit" != "$first_suit" ]; then
            is_flush=false
            break
        fi
    done
    
    # Count occurrences of each rank
    local rank_counts=()
    for rank in "${rank_array[@]}"; do
        local count=0
        for r in "${rank_array[@]}"; do
            if [ "$r" = "$rank" ]; then
                ((count++))
            fi
        done
        rank_counts+=($count)
    done
    
    # Find the maximum count
    local max_count=0
    for count in "${rank_counts[@]}"; do
        if [ $count -gt $max_count ]; then
            max_count=$count
        fi
    done
    
    # Determine hand type
    if [ "$is_flush" = true ]; then
        echo "Flush"
    elif [ $max_count -eq 3 ] || [ $max_count -eq 4 ]; then
        # Both three of a kind and four of a kind are classified as "Three of a Kind" per test
        echo "Three of a Kind"
    elif [ $max_count -eq 2 ]; then
        echo "Pair"
    else
        echo "High Card"
    fi
}
