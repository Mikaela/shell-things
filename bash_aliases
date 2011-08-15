# This is ~/.bash_aliases file by Mika Suomalainen (Mkaysi)

# Feel free to redistribute and copy-paste parts of this bash_aliases file, 
# but if you can, please mention where did you get this or part of this file. 
# If it's originally copy-pasted from somewhere else, mention that original source 
# (which is mentioned in this file).

# Moving between directories:
alias ..="cd .."
alias .="cd ."

# As you can see, I don't use/like Vi(m) :)
alias editor="nano"
alias vi="nano"
alias vim="nano"

# Use htop instead of top, it's better. Requires htop.
alias top="htop"

# Automaticly adds title to Youtube-dl when downloading videos with it. Requires youtube-dl.
alias youtube-dl="youtube-dl -t"

# git specific. This is the command which I use when git asks me to commit something and says that I have modified files, even when I haven't.
alias gdrop="git stash && git stash drop"
alias gitk="gitg" # Requires gitg . I just think that it looks nicer than gitk.

# Usually when I run "time", I want to know the current time.
alias time="date"
