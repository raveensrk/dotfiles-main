#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

> ~/.tmp/words.txt

# This script will find the most used words from a text file or a directory

if [ -f "$1" ]; then
    cat $1 | grep -oi "[a-z]\+" | sort | uniq -c | sort -nr
elif [ -d "$1" ]; then
    mapfile -t files < <(find -L "$1" -type f -exec file {} \; | grep "ASCII\|text" | cut -d ':' -f1 | grep -v -e ".*\.git.*")

    cat "${files[@]}" | grep -oi "[a-zA-Z0-9_-]\+" \
        | sort | uniq -c | sort -n

else
    echo "Input neither file nor directory check input"
fi
