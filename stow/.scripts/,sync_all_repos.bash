#!/bin/bash

set -e
# set -x

# This script will sync all repositories under given path

# read -e -p "Enter main top repo dir: " dir
# dir=$(realpath $dir)

# script_dir=$(dirname "$0")

git config --global pull.rebase false
git config --global merge.tool vimdiff
git config --global user.name "Raveen Kumar"
git config --global user.email "raveen.srk.kumar@gmail.com"

dir="$(realpath "$1")"
# echo "$dir" is top dir
pushd "$dir" > /dev/null 
for d in $(find ./* -maxdepth 0 -type d); do
    # clear
    ,dotfiles_sync.bash "$d"
done
popd > /dev/null 

exit

,reinstall.bash 
