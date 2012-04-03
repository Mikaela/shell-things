#!/usr/bin/env bash
# Do not use this script unless you know what you are doing!
cat bashrc > ~/.bashrc
cat tmux.conf > ~/.tmux.conf
cat zshrc > ~/.zshrc
#cat gitconfig > ~/.gitconfig # I usually do not want this to be overridden so much.
cat vimrc > ~/.vimrc
#gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys A4271AC5 # Run gpg once to get configuration file and keyrings.
#cat gpg.conf > ~/.gnupg/gpg.conf # Maybe this shouldn't get replaced so much, since it contains my key ids.
cat xsessionrc > ~/.xsessionrc
exec $SHELL

# vim : set ft=sh :
