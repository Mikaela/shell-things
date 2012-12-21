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
cat warnings > ~/.warnings
cat pastebinit.xml > ~/.pastebinit.xml
cat oidentd.conf > ~/.oidentd.conf
chmod 644 ~/.oidentd.conf
chmod 711 ~

# vim : set ft=sh :
