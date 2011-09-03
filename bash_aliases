# This file contains aliases which my bashrc uses. You might need to edit something (for example: if you use vi or don't have nmap).

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
alias ping="nping "
alias netcat="ncat "
# More nmap specific things, but these also require proxychains.  WANTED: better abreviation (than pc) for proxyc.
alias proxyc-nmap-intense="proxychains nmap -T4 -A -v -PE -PS22,25,80 -PA21,23,80,3389 "
alias proxyc-nmap-intense-udp="sudo proxychains nmap -sS -sU -T4 -A -v -PE -PS22,25,80 -PA21,23,80,3389 "
alias proxyc-nmap-intense-all-tcp="proxychains nmap -p 1-65535 -T4 -A -v -PE -PS22,25,80 -PA21,23,80,3389 "
alias proxyc-nmap-intense-no-ping="proxychains nmap -T4 -A -v -PN "
alias proxyc-nmap-ping="proxychains nmap -sP -PE -PA21,23,80,3389 "
alias proxyc-nmap-quick="proxychains nmap -T4 -F "
alias proxyc-nmap-quick-plus="sudo proxychains nmap -sV -T4 -O -F --version-light "
alias proxyc-nmap-traceroute="sudo proxychains nmap -sP -PE -PS22,25,80 -PA21,23,80,3389 -PU -PO --traceroute "
alias proxyc-nmap-regular="proxychains nmap "
alias proxyc-nmap-comprehensive="sudo proxychains nmap -sS -sU -T4 -A -v -PE -PP -PS21,22,23,25,80,113,31339 -PA80,113,443,10042 -PO --script all " 
alias proxyc-nmap="proxychains nmap"
alias proxyc-nmapfe="proxychains nmapfe"
alias proxyc-ping="proxychains nmap nping "
alias proxyc-netcat="proxychains nmap ncat "

# TOR (The Onion Router) specific.
alias usewithtor="proxychains "
alias torsocks="proxychains "

# Because I have so many proxyc aliasses and some people want to access proxychains quickly.
alias proxyc="proxychains "

# Downloads folder over SSH. Usage: rdownload <host>:<remotefolder> <local_destination> | TIP: use ~/ssh/config to configure hosts.
alias rdownload="rsync -avz "
