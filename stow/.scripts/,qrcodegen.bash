#!/bin/bash

source ~/.bash_prompt 

help () {
    less $0
}

while [ "$1" ]; do
    case "$1" in
        --input|-i)
            shift
            input="$1"
            ;;
        --output|-o)
            shift
            output="$1"
            ;;
        --help|-h)
            help
            exit 0
            ;;
        *)
            echo -e "${RED}Wrong option!${NC}"
            exit 2
            ;;
    esac
    shift
done 

red
[ "$input" = "" ] && echo "Missing input!" && exit 2
[ "$output" = "" ] && echo "Missing output!" && exit 2
nc

qrencode -o $outupt "$input"
xdg-open $output