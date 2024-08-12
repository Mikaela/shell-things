#!/usr/bin/env bash
# Another take on my install script, but using symlinks and with a chance of
# replacing the other ones.

set +x
# Tails appears to come with lsb_release and return Tails
export DISTROID="$(lsb_release -si)"

# Tails persistent directories
export PERSISTDIR="$HOME/Persistent"
export PERSISTDOTFILESDIR="/live/persistence/TailsData_unlocked/dotfiles"

# This target directory
export SHELL_THINGS_REPO="$HOME/Persistent/src/codeberg.org/Aminda/shell-things"

# WARNING!
printf "USING THESE FILES IS EVEN MORE DANGEROUS ON TAILS THAN IN GENERAL.\n"
printf "PLEASE DON'T DO THIS EVEN IF THOU ART I. THOU HAVE BEEN WARNED!\n"
sleep 3

# NOTE!
if [[ $DISTROID != "Tails" ]]; then
	printf "\nThis distro identifies itself as $DISTROID instead of Tails...\n"
	sleep 3
fi

# WARNING again!
if [[ ! -d "$PERSISTDIR" ]]; then
	printf "\nWARNING! Persistent directory not found, Tails may not be setup"
	printf " correctly. To override:\n\tmkdir -vp $PERSISTDIR \n\n"
	sleep 3
	exit 1
fi

# THIS IS YOUR FINAL WARNING!
if [[ ! -d "$PERSISTDOTFILESDIR" ]]; then
	printf "\nWARNING! $PERSISTDOTFILESDIR directory not found, check"
	printf "\npersistent storage settings To override:\n"
	printf "\tmkdir -vp $PERSISTDOTFILESDIR \n\n"
	sleep 3
	exit 1
fi

# This is just a copy-paste of my nastyish function
if [ -d "$SHELL_THINGS_REPO" ]; then
	printf "$SHELL_THINGS_REPO exists, git pulling...\n\n"
	cd $SHELL_THINGS_REPO
	git remote set-url origin https://codeberg.org/Aminda/shell-things.git
	git fetch --all
	git checkout -b cxefa origin/cxefa > /dev/null 2>&1
	git pull
	git submodule update --init
	git config --global gpg.ssh.allowedSignersFile "$SHELL_THINGS_REPO/submodules/ssh-allowed_signers/allowed_signers"
	sleep 3
	git verify-commit HEAD || exit 1
	sleep 3
else
	printf "shell-things: $SHELL_THINGS_REPO doesn't exist, cloning...\n\n"
	git clone https://codeberg.org/Aminda/shell-things.git $SHELL_THINGS_REPO
	cd $SHELL_THINGS_REPO
fi

cd

# bash
cp -v $SHELL_THINGS_REPO/rc/bashrc $PERSISTDOTFILESDIR/.bashrc
ln -nsfv $PERSISTDOTFILESDIR/.bashrc $HOME/
# zsh
cp -v $SHELL_THINGS_REPO/rc/zshrc $PERSISTDOTFILESDIR/.zshrc
ln -nsfv $PERSISTDOTFILESDIR/.zshrc $HOME/
# tmux
cp -v $SHELL_THINGS_REPO/conf/tmux.conf $PERSISTDOTFILESDIR/.tmux.conf
ln -nsfv $PERSISTDOTFILESDIR/.tmux.conf $HOME/
# git
git config --global gpg.ssh.allowedSignersFile $PERSISTDIR/src/codeberg.org/Aminda/ssh-allowed_signers/allowed_signers
cp $SHELL_THINGS_REPO/conf/gitconfig $PERSISTDOTFILESDIR/.gitconfig
ln -nsfv $PERSISTDOTFILESDIR/.gitconfig $HOME/

# Hack for directories expecting it to work, although only for this boot
ln -nsfv $SHELL_THINGS_REPO $HOME/.shell-things

# Let's go home
cd

set -x
# vim: filetype=bash
