# This file is a snippet from my {bash,zsh}rc handling both Linuxbrew and
# different programming language version managers to ensure that when using
# the former, it will hopefully work for all users.
#
# Dear future me, if you start changing things heavily in one place while not
# updating the others, consider the traditional resolv.conf chattr +i
# approach.

# https://github.com/go-nv/goenv
if [ -d ~/.goenv/bin ]; then
	export GOENV_ROOT="$HOME/.goenv"
	PATH="$GOENV_ROOT/bin:$PATH"
	eval "$(goenv init -)"
	PATH="$GOROOT/bin:$PATH"
	PATH="$PATH:$GOPATH/bin"
elif [ -d /home/linuxbrew/.linuxbrew/opt/goenv ]; then
	export GOENV_ROOT="$/home/linuxbrew/.linuxbrew/opt/goenv"
	PATH="$GOENV_ROOT/bin:$PATH"
	eval "$(goenv init -)"
	PATH="$GOROOT/bin:$PATH"
	PATH="$PATH:$GOPATH/bin"
fi

# https://github.com/nvm-sh/nvm
if [ -d ~/.nvm ]; then
	. ~/.nvm/nvm.sh
	. ~/.nvm/bash_completion
elif [ -d /home/linuxbrew/.linuxbrew/opt/nvm ]; then
	mkdir -p /home/linuxbrew/.nvm
	export NVM_DIR=/home/linuxbrew/.nvm
	. /home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh
	#. /home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm
fi

# https://github.com/rbenv/rbenv
if [ -d ~/.rbenv/bin ]; then
	PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
	eval "$(rbenv init -)"
	# Remember! And verify it before running!
	# git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
elif [ -d /home/linuxbrew/.linuxbrew/opt/rbenv/bin ]; then
	PATH="/home/linuxbrew/.linuxbrew/opt/rbenv/bin:/home/linuxbrew/.linuxbrew/opt/rbenv/bin/shims:$PATH"
	eval "$(rbenv init -)"
fi

# Add RubyGems to PATH
if hash ruby 2> /dev/null; then
	PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
fi

# https://github.com/pyenv/pyenv
if [ -d ~/.pyenv/bin ]; then
	PATH="$HOME/.pyenv/bin:$HOME/.pyenv/shims:$PATH"
	eval "$(pyenv init -)"
	# Worth considering (and verifying before running)
	# git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
	# git clone https://github.com/pyenv/pyenv-virtualenvwrapper.git $(pyenv root)/plugins/pyenv-virtualenvwrapper
elif [ -d /home/linuxbrew/.linuxbrew/opt/pyenv/bin ]; then
	PATH="/home/linuxbrew/.linuxbrew/opt/pyenv/bin:/home/linuxbrew/.linuxbrew/opt/pyenv/shims:$PATH"
	eval "$(pyenv init -)"
fi

# https://github.com/nodenv/nodenv
if [ -d ~/.nodenv/bin ]; then
	PATH="$HOME/.nodenv/bin:$PATH"
	eval "$(nodenv init -)"
	# Remember! And verify it before running!
	# git clone https://github.com/nodenv/node-build.git "$(nodenv root)"/plugins/node-build
elif [ -d /home/linuxbrew/.linuxbrew/opt/nodenv/bin ]; then
	PATH="/home/linuxbrew/.linuxbrew/opt/nodenv/bin:$PATH"
	eval "$(nodenv init -)"
fi

# https://github.com/Homebrew/brew
if [ -d /home/linuxbrew/.linuxbrew/bin ]; then
	eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi
