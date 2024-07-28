# https://github.com/Homebrew/brew
if [ -d /home/linuxbrew/.linuxbrew/bin ]; then
	eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

if [ -d /home/linuxbrew/.linuxbrew/opt/nvm ]; then
	export NVM_DIR=/home/linuxbrew/.nvm
	[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"                                       # This loads nvm
	[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
fi
