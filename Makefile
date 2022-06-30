.ONESHELL:
	# Applies to every targets in the file! By default every command
	# alls a subshell this prevents that
	# art
	SHELL = /usr/bin/bash -x


clean:
	rm -rfv ./tmp

install_colemak:
	# https://colemak.com/Unix
	mkdir tmp
	cd tmp
	wget -nc https://colemak.com/pub/unix/colemak-1.0.tar.gz
	tar xvf colemak-1.0.tar.gz
	cd colemak-1.0
	setxkbmap us; xmodmap xmodmap/xmodmap.colemak && xset r 66

install_vim_from_flathub:
	mkdir tmp
	cd tmp
	wget https://dl.flathub.org/repo/appstream/org.vim.Vim.flatpakref
	flatpak install --user org.vim.Vim.flatpakref

uninstall_colemak:
	setxkbmap us; xmodmap xmodmap/xmodmap.colemak && xset r 66
