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

# If I run nautilus, I want it to open in folder where I am.
alias nautilus="nautilus ./"

# I don't use terminal based IRC clietns, but usually when I test something, I use IRSSI, even if I want to use WeeChat.
alias irssi="weechat-curses"
#alias weechat="xchat" # Uncomment if you use XChat, like me ;)
