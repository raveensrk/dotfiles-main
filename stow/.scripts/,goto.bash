#!/bin/bash

set -e

while [ "$1" ]; do
    case "$1" in
        --ext)
            shift
            ext="$1"
            ;;
        --help)
            echo -e "${BLUE} TODO: Write help.${NC}"
            exit 2
            ;;
        *)
            echo -e "${RED}❌ ERROR! WRONG Argument!${NC}"
            exit 2
            ;;
    esac
    shift
done

if [ "$ext" != "" ]; then
    item=$(grep --include="$ext" --exclude-dir=.git --exclude-dir=.hg -H -n -r . | fzf -e )
else
    # item=$(grep --exclude-dir=.git --exclude-dir=.hg -H -n -r . | fzf -e )
    item=$(rg -n --no-heading -. . --ignore-file "$HOME/.scripts/.ignore" | fzf -e )
fi

# echo "$item"
file=$(echo "$item" | awk -F ':' '{print $1}')
# echo "$file"
line=$(echo "$item" | awk -F ':' '{print $2}')
# echo "$line"
file_absolute_path="$file"

vim -c ":$line" "$file_absolute_path"
