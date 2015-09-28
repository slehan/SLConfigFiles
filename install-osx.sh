#!/bin/bash
#
# Setup
SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"

# HomeBrew
echo "--- Installing HomeBrew ---"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# VIM
echo "--- Installing Vim configuration... ---"
brew install vim
brew install cmake
brew install tmux
echo "Installing Vundle..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s $SCRIPT_DIR/vim/.vimrc ~/.vimrc 
echo "Installing YCM for Vim..."
echo "For YCM, making sure cmake and python are installed..."
echo "Linking libclang.so.1 to libclang.so..."
vim +PluginInstall +qall
#sudo ln -s /usr/lib/llvm-3.5/lib/libclang.so.1 /usr/lib/llvm-3.5/lib/libclang.so
~/.vim/bundle/YouCompleteMe/install.py --clang-completer --system-libclang


# tmux
echo "--- Installing tmux configuration... ---"
ln -s $SCRIPT_DIR/tmux/.tmux.conf ~/.tmux.conf
tmux source ~/.tmux.conf
