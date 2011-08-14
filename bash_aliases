# This is ~/.bash_aliases file by Mika Suomalainen (Mkaysi)

# Moving between directories:
alias ..="cd .."
alias .="cd ."

# As you can see, I don't use/like Vi(m) :)
alias editor="nano"
alias vi="nano"
alias vim="nano"

# Use htop instead of top, it's better. Requires htop.
alias top="htop"

# Automatic title to Youtube-dl
alias youtube-dl="youtube-dl -t"

# git specific. This is the command which I use when git asks me to commit something and says that I have modified files, even when I haven't.
alias gdrop="git stash && git stash drop"
