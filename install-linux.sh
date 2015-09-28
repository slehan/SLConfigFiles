#!/bin/bash
#
# Setup
SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"
RED='\033[0;31m'
NO_COLOR='\033[0m'

# VIM
echo "${RED}--- Installing Vim configuration... ---${NO_COLOR}"
sudo apt-get install vim-nox llvm clang tmux build-essential cmake python-dev
echo "${RED}Installing Vundle...{$NO_COLOR}"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s $SCRIPT_DIR/vim/.vimrc ~/.vimrc 
echo "${RED}Installing YCM for Vim...${NO_COLOR}"
echo "${RED}For YCM, making sure cmake and python are installed...${NO_COLOR}"
echo "${RED}Linking libclang.so.1 to libclang.so...${NO_COLOR}"
vim +PluginInstall +qall
sudo ln -s /usr/lib/llvm-3.5/lib/libclang.so.1 /usr/lib/llvm-3.5/lib/libclang.so
~/.vim/bundle/YouCompleteMe/install.py --clang-completer --system-libclang


# tmux
echo "${RED}--- Installing tmux configuration... ---${NO_COLOR}"
ln -s $SCRIPT_DIR/tmux/.tmux.conf ~/.tmux.conf
tmux source ~/.tmux.conf

# configure Fish
echo -e "${RED}--- Setting Fish as default shell... ---${NO_COLOR}"
su root
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_8.0/ /' >> /etc/apt/sources.list.d/fish.list 
apt-get update
apt-get install fish
exit
chsh -s /usr/bin/fish
