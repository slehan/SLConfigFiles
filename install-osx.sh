#!/bin/bash
#
# Setup
SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"
RED='\033[0;31m'
NO_COLOR='\033[0m'
ORANGE='\033[0;33m'

# HomeBrew
echo "${ORANGE}--- Installing HomeBrew ---${NO_COLOR}"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Tools
echo "${ORANGE}--- Installing Useful Tools ---${NO_COLOR}"
brew install vim
brew install cmake
brew install tmux
brew install fish

# VIM
echo "${ORANGE}--- Installing Vim configuration... ---${NO_COLOR}"
echo "${ORANGE}Installing Vundle...${NO_COLOR}"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s $SCRIPT_DIR/vim/.vimrc ~/.vimrc 
echo "${ORANGE}Installing YCM for Vim...${NO_COLOR}"
echo "${ORANGE}For YCM, making sure cmake and python are installed...${NO_COLOR}"
echo "${ORANGE}Linking libclang.so.1 to libclang.so...${NO_COLOR}"
vim +PluginInstall +qall
#sudo ln -s /usr/lib/llvm-3.5/lib/libclang.so.1 /usr/lib/llvm-3.5/lib/libclang.so
~/.vim/bundle/YouCompleteMe/install.py --clang-completer --system-libclang


# tmux
echo "${ORANGE}--- Installing tmux configuration... ---${NO_COLOR}"
ln -s $SCRIPT_DIR/tmux/.tmux.conf ~/.tmux.conf
tmux source ~/.tmux.conf
