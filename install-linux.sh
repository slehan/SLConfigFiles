#!/bin/bash
#
# Setup
SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"

# VIM
echo "--- Installing Vim configuration... ---"
echo "Installing Vundle..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s $SCRIPT_DIR/vim/.vimrc ~/.vimrc 
echo "Installing YCM for Vim..."
echo "For YCM, making sure cmake and python are installed..."
sudo apt-get install build-essential cmake
sudo apt-get install python-dev
echo "Linking libclang.so.1 to libclang.so..."
sudo ln -s /usr/lib/llvm-3.5/lib/libclang.so.1 /usr/lib/llvm-3.5/lib/libclang.so
~/.vim/bundle/YouCompleteMe/install.py --clang-completer --system-libclang
vim +PluginInstall +qall

# tmux
echo "--- Installing tmux configuration... ---"
ln -s $SCRIPT_DIR/tmux/.tmux.conf ~/.tmux.conf
tmux source ~/.tmux.conf
