# This file is a snippet from my {bash,zsh}rc handling both Linuxbrew and
# different programming language version managers to ensure that when using
# the former, it will hopefully work for all users.
#
# Dear future me, if you start changing things heavily in one place while not
# updating the others, consider the traditional resolv.conf chattr +i
# approach.

# https://github.com/go-nv/goenv
if [ -f /home/linuxbrew/.linuxbrew/opt/goenv/bin/goenv ]; then
	eval "$(/home/linuxbrew/.linuxbrew/opt/goenv/bin/goenv init -)" > /dev/null 2>&1
	PATH=/home/linuxbrew/.linuxbrew/opt/goenv/bin/shims:$PATH
elif [ -f ~/.goenv/bin/goenv ]; then
	eval "$(~/.goenv/bin/goenv init -)" > /dev/null 2>&1
fi

# https://github.com/nvm-sh/nvm
if [ -d /home/linuxbrew/.linuxbrew/opt/nvm ]; then
	mkdir -p /home/linuxbrew/.nvm
	export NVM_DIR=/home/linuxbrew/.nvm
	. /home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh
elif [ -d ~/.nvm ]; then
	. ~/.nvm/nvm.sh
	. ~/.nvm/bash_completion
fi

# https://github.com/rbenv/rbenv
if [ -f /home/linuxbrew/.linuxbrew/opt/rbenv/bin/rbenv ]; then
	eval "$(/home/linuxbrew/.linuxbrew/opt/rbenv/bin/rbenv init -)"
	PATH=/home/linuxbrew/.linuxbrew/opt/rbenv/bin/shims:$PATH
	# No OpenSSL? Remember (and substitute the x, y and z)!:
	# rbenv install --  --with-openssl-dir=/home/linuxbrew/.linuxbrew/Cellar/openssl@x/x.y.z/
elif [ -f ~/.rbenv/bin/rbenv ]; then
	eval "$(~/.rbenv/bin/rbenv init -)"
	# Remember! And verify it before running!
	# git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
fi

# Add RubyGems to PATH
if hash ruby 2> /dev/null; then
	PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
fi

# https://github.com/pyenv/pyenv
if [ -f /home/linuxbrew/.linuxbrew/opt/pyenv/bin/pyenv ]; then
	eval "$(/home/linuxbrew/.linuxbrew/opt/pyenv/bin/pyenv init -)"
	PATH=/home/linuxbrew/.linuxbrew/opt/pyenv/bin/shims:$PATH
elif [ -d ~/.pyenv/bin ]; then
	eval "$(~/.pyenv/bin/pyenv init -)"
	# Worth considering (and verifying before running)
	# git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
	# git clone https://github.com/pyenv/pyenv-virtualenvwrapper.git $(pyenv root)/plugins/pyenv-virtualenvwrapper
fi

# https://github.com/nodenv/nodenv
if [ -f /home/linuxbrew/.linuxbrew/opt/nodenv/bin/nodenv ]; then
	eval "$(/home/linuxbrew/.linuxbrew/opt/nodenv/bin/nodenv init -)"
	PATH=/home/linuxbrew/.linuxbrew/opt/nodenv/bin/shims:$PATH
elif [ -d ~/.nodenv/bin/nodenv ]; then
	eval "$(~/.nodenv/bin/nodenv init -)"
	# Remember! And verify it before running!
	# git clone https://github.com/nodenv/node-build.git "$(nodenv root)"/plugins/node-build
fi

# https://github.com/Homebrew/brew
if [ -d /home/linuxbrew/.linuxbrew/bin ]; then
	eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi
