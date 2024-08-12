#!/usr/bin/env bash
# Another take on my install script, but using symlinks and with a chance of
# replacing the other ones.

set +x
# Tails appears to come with lsb_release and return Tails
export DISTROID="$(lsb_release -si)"

# Tails persistent directory
export PERSISTDIR="~/Persistent"

# This target directory
export SHELL_THINGS_REPO="~/Persistent/src/codeberg.org/Aminda/shell-things"

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
if [[ ! -d "$PERSISTDIR/dotfiles" ]]; then
	printf "\nWARNING! Persistent/dotfiles directory not found, check"
	printf "\npersistent storage settings To override:\n"
	printf "\tmkdir -vp $PERSISTDIR/dotfiles \n\n"
	sleep 3
	exit 1
fi

# This is just a copy-paste of my nastyish function
if [ -d $SHELL_THINGS_REPO ]; then
	printf "$SHELL_THINGS_REPO exists, git pulling...\n\n"
	cd $SHELL_THINGS_REPO
	git remote set-url origin https://codeberg.org/Aminda/shell-things.git
	git fetch --all
	git checkout -b cxefa origin/cxefa
	git pull
	printf "\ngit config --global gpg.ssh.allowedSignersFile $PERSISTDIR/src/codeberg.org/Aminda/ssh-allowed_signers/allowed_signers\n"
	git verify-commit HEAD || exit 1
	sleep 3
	printf "shell-things: Installing/Upgrading..."
else
	printf "shell-things: $SHELL_THINGS_REPO doesn't exist, cloning...\n\n"
	git clone https://codeberg.org/Aminda/shell-things.git $SHELL_THINGS_REPO
	cd $SHELL_THINGS_REPO
	sleep 3
	echo "\nshell-things: Installing/Upgrading...\n"
fi

# Installing...
# bash -x ./install
# echo ""
# echo "shell-things: Installing finished."
# echo ""
#
# echo ""
# echo "shell-things: Everything is now done :)"
# echo ""
cd

# bash
ln -nsfv $SHELL_THINGS_REPO/rc/bashrc $PERSISTDIR/dotfiles/.bashrc
ln -nsfv $SHELL_THINGS_REPO/rc/bashrc ~/.bashrc
# zsh
ln -nsfv $SHELL_THINGS_REPO/rc/zshrc $PERSISTDIR/dotfiles/.zshrc
ln -nsfv $SHELL_THINGS_REPO/rc/zshrc ~/.zshrc
# tmux
ln -nsfv $SHELL_THINGS_REPO/conf/tmux.conf $PERSISTDIR/dotfiles/.tmux.conf
ln -nsfv $SHELL_THINGS_REPO/conf/tmux.conf ~/.tmux.conf
# git
git config --global gpg.ssh.allowedSignersFile $PERSISTDIR/src/codeberg.org/Aminda/ssh-allowed_signers/allowed_signers
ln -nsfv $SHELL_THINGS_REPO/conf/gitconfig $PERSISTDIR/dotfiles/.gitconfig
ln -nsfv $SHELL_THINGS_REPO/conf/gitconfig ~/.gitconfig

# Let's go home
cd

set -x
# vim: filetype=bash
