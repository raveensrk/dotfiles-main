#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

[ ! -d ~/my_repos ] && mkdir ~/my_repos
pushd ~/my_repos || exit 2

git clone git@github.com:raveensrk/dotfiles-main.git
git clone git@github.com:raveensrk/my-scripts-main.git 

popd || exit 2