#!/usr/bin/env bash
# Do not use this script unless you know what you are doing!
cat bashrc > ~/.bashrc
cat tmux.conf > ~/.tmux.conf
cat zshrc > ~/.zshrc
#cat gitconfig > ~/.gitconfig # I usually do not want this to be overridden so much.
cat vimrc > ~/.vimrc
exec $SHELL

# vim : set ft=sh :
