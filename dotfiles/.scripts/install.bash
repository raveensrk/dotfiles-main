#!/bin/bash

set -e
# set -x

read -p "Enter f for fedora or u for ubuntu: [f/u]" distro

pkg_list_common="
             bat \
             curl \
             ffmpeg \
             ffmpegthumbnailer \
             gnuplot \
             htop \ 
             kdialog \
             kdiff3 \
             mediainfo \
             mlocate \
             mpv \
             neofetch \
             newsboat \
             python \
             python3 \
             python3-pip \
             ranger \
             shellcheck \
             stow \
             tldr \
             vim \
             vim-gtk \
             yank \
             pandoc \
             obs-studio
             "
pkg_list_ubuntu_only="
             shellcheck \
             imagemagick \
                 "
pkg_list_fedora_only="
             ShellCheck \
             ImageMagick \
                 "

case $distro in
    f)
        sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
        sudo dnf install  "$pkg_list_common"
        sudo dnf install  "$pkg_list_fedora_only"
        ;;
    u)
        sudo apt  update
        sudo apt  upgrade
        sudo apt  autoremove
        sudo apt  autoclean
        sudo apt  autopurge
        sudo apt  install "$pkg_list_common"
        sudo apt  install "$pkg_list_ubuntu_only"
        ;;
    *)
        echo "Unknown Distro! 😠"
        exit 2
        ;;
esac

python3 -m pip install bdfr --upgrade

[ -d ~/tmp ] || mkdir $HOME/tmp
[ -d ~/.local/bin ] || mkdir -p ~/.local/bin

if [ ! -d ~/.fzf ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi

[ ! -d ~/.vim/undo ] && mkdir -p ~/.vim/undo
[ ! -d ~/.vim/backup ] && mkdir -p ~/.vim/backup
[ ! -d ~/.vim/swap ] && mkdir -p ~/.vim/undo

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

[ -f ~/.local/bin/cht.sh ] && rm ~/.local/bin/cht.sh
curl https://cht.sh/:cht.sh >$HOME/.local/bin/cht.sh
chmod +x $HOME/.local/bin/cht.sh

curl -sL "https://raw.githubusercontent.com/pystardust/ytfzf/master/ytfzf" | sudo tee $HOME/.local/bin/ytfzf >/dev/null && sudo chmod 755 $HOME/.local/bin/ytfzf

sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o $HOME/.local/bin/youtube-dl
sudo chmod a+rx $HOME/.local/bin/youtube-dl

[ ! -v tldr ] && pip install tldr || echo -e ${YELLOW} tldr install failed ${NC}

pushd ~/tmp
motivate || git clone https://github.com/mubaris/motivate.git && cd motivate/motivate && sudo ./install.sh && source ~/.bashrc

# git clone https://github.com/mubaris/motivate.git
# cd motivate
# ln -s $PWD/motivate/motivate.py moti
# ln -s $PWD/dummy.sh mmoti

# export PATH=$PWD:$PATH
# echo 'export PATH=$PWD:$PATH' >> ~/.zshrc
popd

