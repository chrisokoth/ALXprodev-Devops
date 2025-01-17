#!/bin/bash

# Define the JSON file
JSON_FILE="data.json"

# Check if the JSON file exists
if [[ ! -f "$JSON_FILE" ]]; then
    echo "Error: $JSON_FILE not found!"
    exit 1
fi

# Extract data using jq
NAME=$(jq -r '.name' "$JSON_FILE")
HEIGHT=$(jq -r '.height' "$JSON_FILE")
WEIGHT=$(jq -r '.weight' "$JSON_FILE")
TYPE=$(jq -r '.types[0].type.name' "$JSON_FILE")

# Format the output
OUTPUT="$NAME is of type $TYPE, weighs ${WEIGHT}kg, and is ${HEIGHT}m tall."

# Print the output
echo "$OUTPUT" | sed 's/^\(.*\)$/\U\1/'  # Capitalize the first letter of the output
