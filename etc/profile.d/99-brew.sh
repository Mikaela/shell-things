# https://github.com/Homebrew/brew
if [ -d /home/linuxbrew/.linuxbrew/bin ]; then
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# https://github.com/nvm-sh/nvm
if [ -d ~/.nvm ]; then
	. ~/.nvm/nvm.sh
	. ~/.nvm/bash_completion
elif [ -d /home/linuxbrew/.linuxbrew/opt/nvm ]; then
	mkdir -p /home/linuxbrew/.nvm
	export NVM_DIR=/home/linuxbrew/.nvm
	. /home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh
#	. /home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm
fi
