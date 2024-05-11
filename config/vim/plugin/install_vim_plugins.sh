#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'
# set -x

current_file=$(realpath "$0")

help() {
	cat <<-HERE
		Usage
		-----------------
	HERE
	exit 0
}

clean=0
while [ "$#" -ne 0 ]; do
	case "$1" in
	--help | -h)
		help
		;;
	--clean)
		clean=1
		;;
	*)
		echor "Unknown Argument: $1 while running $current_file!"
		exit 2
		;;
	esac
	shift
done

mkdir2 ~/.vim/autoload
# [ -d ~/.vim/bundle ] && rm -rf ~/.vim/bundle

if [[ "$clean" -eq 1 ]]; then
	rm_mkdir ~/.vim/bundle
	pushd2 ~/.vim/bundle
else
	mkdir2 ~/.vim/bundle
	pushd2 ~/.vim/bundle
	if [[ "$(command ls | wc -l)" -ne 0 ]]; then
		for dir in ./*; do
			pushd2 "$dir"
			git pull &
			popd2
		done
	fi
fi

curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim &
git clone "git@github.com:easymotion/vim-easymotion" &
git clone "git@github.com:junegunn/vim-easy-align" &
git clone "git@github.com:junegunn/fzf" &
git clone "git@github.com:junegunn/fzf.vim" &
git clone "git@github.com:mhinz/vim-signify" &
git clone "git@github.com:nathanaelkane/vim-indent-guides" &
git clone "git@github.com:tomtom/tcomment_vim" &
git clone "git@github.com:tpope/vim-eunuch" &
git clone "git@github.com:tpope/vim-fugitive" &
git clone "git@github.com:tpope/vim-repeat" &
git clone "git@github.com:tpope/vim-sensible" &
git clone "git@github.com:tpope/vim-speeddating.git" &
git clone "git@github.com:tpope/vim-surround" &
git clone "git@github.com:tpope/vim-unimpaired" &
git clone "git@github.com:tpope/vim-dispatch" &
git clone "git@github.com:tpope/vim-vinegar" &
git clone "git@github.com:yegappan/taglist.git" &
git clone "https://github.com/dense-analysis/ale" &
git clone "https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup" &
git clone "https://github.com/MarcWeber/vim-addon-qf-layout.git" &
git clone "https://github.com/chrisbra/unicode.vim.git" &
git clone "https://github.com/wuelnerdotexe/vim-enfocado" &
git clone "git@github.com:Donaldttt/fuzzyy.git" &
git clone "https://github.com/preservim/vim-markdown.git" &
# git clone "git@github.com:chrisbra/csv.vim.git" &
# git clone "https://github.com/SidOfc/mkdx" &
git clone "git@github.com:rafi/awesome-vim-colorschemes.git" &
git clone "https://github.com/ledger/vim-ledger" &
git clone "https://github.com/skywind3000/asyncrun.vim" &
git clone "https://tpope.io/vim/scriptease.git" &
git clone "git@github.com:davidhalter/jedi-vim.git" &
git clone "https://github.com/mhinz/vim-startify" &
git clone "git@github.com:tpope/vim-characterize.git" &
pip install jedi
git clone "git@github.com:tpope/vim-obsession.git" &
git clone https://github.com/ap/vim-buftabline &
git clone https://github.com/qpkorr/vim-bufkill ~/.vim/bundle/vim-bufkill &
git clone https://github.com/moll/vim-bbye &
git clone git@github.com:vim-scripts/bufexplorer.zip.git &
# https://vimawesome.com/plugin/vim-interestingwords-safe-and-sound
# git clone https://github.com/kshenoy/vim-signature &
git clone https://github.com/mattesgroeger/vim-bookmarks &
# https://github.com/Shougo/unite.vim
# Digraph: https://www.vim.org/scripts/script.php?script_id=5724
git clone https://github.com/kyuhi/vim-emoji-complete &
wait
