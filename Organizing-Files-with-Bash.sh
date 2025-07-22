#!/bin/bash

# This script groups the files (in a directory) with same extensions and saves them into their respective folders

# The script should run as "./script-name.sh path/to/dir"

# Check if the argument is provided or not

if [ $# -lt 1 ]; then
    echo "Usage: $0 <path-to-directory>"
    exit 1
fi

# Check if the given argument is a directory
if [ -d "$1" ]; then
        cd "$1" || exit 1
else
        echo "Error: '$1' Not a directory"
        exit 1
fi

# Organize the files
for file in *.*; do

        # Skip non-files
        [ -f "$file" ] || continue

        ext="${file##*.}"
        if [ -n "$ext" ]; then
                mkdir -p "$ext"
                mv "$file" "$ext/"
                echo "$file moved to the directory $(pwd)/$ext"
        else
                echo "Skipping $file because it has no extension"
        fi
done

echo "Files in $(pwd) have been organized"
