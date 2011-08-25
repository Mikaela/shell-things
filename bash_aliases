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

# Why I must write "weechat-curses" to start it?
alias weechat="weechat-curses"

#NMAP specific. All nmap things should be run as root, so it's probably best to copy these aliases to root's .bashrc. Things which don't run without root ask for sudo password.
alias nmap-intense="nmap -T4 -A -v -PE -PS22,25,80 -PA21,23,80,3389 "
alias nmap-intense-udp="sudo nmap -sS -sU -T4 -A -v -PE -PS22,25,80 -PA21,23,80,3389 "
alias nmap-intense-all-tcp="nmap -p 1-65535 -T4 -A -v -PE -PS22,25,80 -PA21,23,80,3389 "
alias nmap-intense-no-ping="nmap -T4 -A -v -PN "
alias nmap-ping="nmap -sP -PE -PA21,23,80,3389 "
alias nmap-quick="nmap -T4 -F "
alias nmap-quick-plus="sudo nmap -sV -T4 -O -F --version-light "
alias nmap-traceroute="sudo nmap -sP -PE -PS22,25,80 -PA21,23,80,3389 -PU -PO --traceroute "
alias nmap-regular="nmap "
alias nmap-comprehensive="sudo nmap -sS -sU -T4 -A -v -PE -PP -PS21,22,23,25,80,113,31339 -PA80,113,443,10042 -PO --script all " 
alias ping="nping"
alias netcat="ncat"
