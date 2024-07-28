# https://github.com/Homebrew/brew
if [ -d /home/linuxbrew/.linuxbrew/bin ]; then
	PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
	eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi
