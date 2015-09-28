#!/bin/bash
#
# Setup
SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"
RED='\033[0;31m'
NO_COLOR='\033[0m'

# HomeBrew
echo -e "${RED}--- Installing HomeBrew ---${NO_COLOR}"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Tools
echo -e "${RED}--- Installing Useful Tools ---${NO_COLOR}"
brew install vim
brew install cmake
brew install tmux
brew install fish

# VIM
echo -e "${RED}--- Installing Vim configuration... ---${NO_COLOR}"
echo -e "${RED}Installing Vundle...${NO_COLOR}"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s $SCRIPT_DIR/vim/.vimrc ~/.vimrc 
echo -e "${RED}Installing YCM for Vim...${NO_COLOR}"
echo -e "${RED}For YCM, making sure cmake and python are installed...${NO_COLOR}"
echo -e "${RED}Linking libclang.so.1 to libclang.so...${NO_COLOR}"
vim +PluginInstall +qall
~/.vim/bundle/YouCompleteMe/install.py --clang-completer --system-libclang


# tmux
echo -e "${RED}--- Installing tmux configuration... ---${NO_COLOR}"
ln -s $SCRIPT_DIR/tmux/.tmux.conf ~/.tmux.conf
tmux source ~/.tmux.conf

# configure Fish
echo -e "${RED}--- Setting Fish as default shell... ---${NO_COLOR}"
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
