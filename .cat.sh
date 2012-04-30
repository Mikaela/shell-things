#!/usr/bin/env bash
# Do not use this script unless you know what you are doing!
cat bashrc > ~/.bashrc
cat tmux.conf > ~/.tmux.conf
cat zshrc > ~/.zshrc
cat gitconfig > ~/.gitconfig
cat vimrc > ~/.vimrc
mkdir -p ~/.gnupg
cat gnupg/gpg.conf > ~/.gnupg/gpg.conf
cat xsessionrc > ~/.xsessionrc
exec $SHELL

# vim : set ft=sh :
