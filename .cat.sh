#!/usr/bin/env bash
# Do not use this script unless you know what you are doing!
cat bashrc > ~/.bashrc
cat tmux.conf > ~/.tmux.conf
cat zshrc > ~/.zshrc
cat gitconfig > ~/.gitconfig
cat vimrc > ~/.vimrc
if [ ! -f ~/.oidentd.conf ]; then
    cat oidentd.conf > ~/.oidentd.conf
fi
mkdir -p ~/.gnupg
cat gpg.conf > ~/.gnupg/gpg.conf
cat gpg-agent.conf > ~/.gnupg/gpg-agent.conf
cat sks-keyservers.netCA.pem > ~/.gnupg/sks-keyservers.netCA.pem
cat xsessionrc > ~/.xsessionrc
cat xinitrc > ~/.xinitrc
cat pastebinit.xml > ~/.pastebinit.xml
cat Xdefaults > ~/.Xdefaults
mkdir -p ~/.inxi
cat inxi.conf > ~/.inxi/inxi.conf
gpg --quiet --import .keys/0x4DB53CFE82A46728.asc&
gpg --quiet --import .keys/0xDAA6CA08F2E96AC7.asc&
gpg --quiet --import .keys/0x0C207F07B2F32B67.asc&
mkdir -p ~/.ssh
chmod a+xr chmod
bash -x ./chmod& 2>/dev/null
cat chmod > ~/chmod
cat wwwuser > ~/wwwuser
chmod a+xr ~/chmod
chmod a+r ~/wwwuser
# vim : set ft=sh :
#chmod 700 $HOME -R
