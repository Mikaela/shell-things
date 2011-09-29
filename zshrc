echo "Please see the README file."

# This is based on zshrc which came with Debian (Third option in wizard for new users.)

# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Sources everything.
source ~/.zsh_aliases
source ~/.zshenv
source ~/.zsh_functions

## DO NOT PUT ANYTHING BELOW THIS LINE OR YOUR CHANGES MAY GET IGNORED BY BASH!
sleep 1;

# Gives three seconds time to press CTRL + C in case you want to prevent action by tmux.

# Starts tmux always on start of bash, not only on SSH login, and quits from bash when tmux quits. WARNING: I DON'T KNOW WHAT HAPPENS IF YOU DON'T HAVE TMUX INSTALLED! (Modified from Cubox's script and William Shallum's tmux on SSH login http://william.shallum.net/random-notes/automatically-start-tmux-on-ssh-login )
if [[ $TERM != "screen" ]]
then
   tmux has-session -t 0 && tmux attach-session -t 0 || tmux new-session -s 0 && exit
fi
