UNAME=`uname`
# TOC
#   Defaults etc...             M0TZLS
#   Environment                 7RS56S
#   Aliases                     RJ706I
#   Functions                   ZGC5QQ

# uname should be readable in $uname 
uname=`uname`

# enable terminal bell

if [ -f /usr/bin/xset ];
then
    xset b on
fi

#####   Defaults etc...             M0TZLS  #####

# This is based on zshrc which came with Debian (Third option in wizard for new users.)

# Set up the prompt
autoload -Uz promptinit

# Green for normal user and red for root and show exit status
# if it's not 0. Thank you nyuszika7h
promptinit
autoload -Uz vcs_info
autoload -Uz colors && colors
setopt PROMPT_SUBST
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' enable git svn bzr hg
zstyle ':vcs_info:*' formats '%b '
precmd() { vcs_info }

PS1="%B%(!.%F{red}.%F{green})%n@%m %~
%# %(?..%B%?%b )%f%b"

setopt histignorealldups sharehistory 

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

HISTCONTROL=ignoredups
export HISTSIZE=9999999999
export HISTFILESIZE=99999999999
export HISTTIMEFORMAT='%F %T '
export HISTFILE=~/.zsh_history

HISTSIZE=9999999999
if (( ! EUID )); then
  HISTFILE=~/.history_root
else
  HISTFILE=~/.history
fi
SAVEHIST=9999999999

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
if [[ $UNAME != Darwin ]]; then
    eval "$(dircolors -b)"
fi
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

# Show the hostname, uptime and users logged in on shell start
hostname
uptime
echo ""

if [[ $UNAME != Darwin  ]] then;
    who -H -w -u|head -n10
    echo ""
    last -10 -w -x
fi

if [[ $UNAME = Darwin ]]; then
    who -H -u|head -n10
    echo ""
    last -10
fi

#####   Environment                 7RS56S  #####
# Environment should be placed to .environment or .zsh_environment (or .zshenv).

# Source before mentioned locations if they exist.

# .environment
if [ -f ~/.environment ]; then
    source ~/.environment
fi

# .zsh_environment
if [ -f ~/.zsh_environment ]; then
    source ~/.zsh_environment
fi

# .zshenv (Yes, I know that this is sourced by every zsh session even if this isn't here, but I just want to write it).
if [ -f ~/.zshenv ]; then
    source ~/.zshenv
fi

# Enable core files.
ulimit -c unlimited


#More colours 
if [[ $TERM == 'xterm' ]]; then
export TERM=xterm-256color
fi

if [[ $TERM == 'screen' ]]; then             
export TERM=screen-256color              
fi

# Sets the default editor.
#export EDITOR=vim # MKAYSIGREP # MKAYSIGREPENVIRONMENT

# Sets locale. You can get list of locales with "locale -a" command. This should be something which ends to .utf8
#export LC_ALL=fi_FI.utf8 # MKAYSIGREP # MKAYSIGREPENVIRONMENT

# Sets your timezone. Set in format <Region/City>, or just timezone like UTC.
# export TZ="/usr/share/zoneinfo/Europe/Helsinki" # MKAYSIGREP # MKAYSIGREPENVIRONMENT

# pyenv (Source: their README.md file http://git.io/ReCDSQ )
export PYENV_ROOT="$HOME/.pyenv"
alias pyenv-install="\wget -O /tmp/pyenv-installer https://raw.github.com/yyuu/pyenv-installer/master/bin/pyenv-installer;chmod +x /tmp/pyenv-installer;/tmp/pyenv-installer;rm /tmp/pyenv-installer"
alias pyenv-install-alt="cd ~;git clone https://github.com/yyuu/pyenv.git $PYENV_ROOT"

# Sets PATH. To add another path, add :</path/to/new/path> to string below. 
PATH=$PYENV_ROOT/shims:$PYENV_ROOT/bin:$HOME/.local/bin:$HOME/.local/sbin:$HOME/.local/games:$HOME/bin:$HOME/sbin:$HOME/games:$HOME/tmcbeans/bin:/opt/local/bin:/opt/local/sbin:/opt/local/games:/usr/local/bin:/usr/local/sbin:/usr/local/games:/bin:/sbin:/games:/usr/bin:/usr/sbin:/usr/games:$PATH

# Apply pyenv changes.
if [ -d "$PYENV_ROOT" ]; then
    eval "$(pyenv init -)"
fi

# "Changes" home directory without root. Uncomment both lines below this.
#export HOME=<path to new home>
#cd

# Colours to less
# Copied from http://nion.modprobe.de/blog/archives/572-less-colors-for-man-pages.html
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Sets environment variable CPUARCH to output of "uname -p" and UNAME to "uname"
CPUARCH=`uname -p`
UNAME=`uname`

# Copied from http://homepages.see.leeds.ac.uk/~eeaol/notes/2012/03/how_to_only_type_ssh_passphrase_once/
export SSH_AUTH_SOCK=/tmp/$USER.agent
ssh-agent -a /tmp/$USER.agent > /dev/null 2>&1

# If we are on Linux, enable apt progress bar and colours
if [[ $USER = "root" ]]; then
    mkdir -p /etc/apt/apt.conf.d/
    echo 'Dpkg::Progress-Fancy "1";' > /etc/apt/apt.conf.d/99progressbar
    echo 'DPkgPM::Progress-Fancy "1";' >> /etc/apt/apt.conf.d/99progressbar
    echo 'APT::Color "1";' > /etc/apt/apt.conf.d/99color
fi

# In our series useless/weird environment variables, beep
export beep=
export BEEP=

# OS X ls colours (copied from https://apple.stackexchange.com/questions/33677/
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# make
if [[ $UNAME != Darwin ]]; then
    export NPROC=`nproc`
else
    export NPROC=`sysctl -n hw.ncpu`
fi

export MAKEFLAGS="-j$NPROC"
export MAKE="make $MAKEFLAGS"
alias make="make $MAKEFLAGS"

#####   Aliases                     RJ706I  #####

# To get sudo work with aliases.
alias sudo="sudo "

# Moving between directories:
alias ..="cd .."

# Use htop instead of top, it's better. Requires htop.
#alias top="htop" # MKAYSIGREP MKAYSIGREPALIAS

# Automaticly adds title to Youtube-dl when downloading videos with it. Requires youtube-dl.
alias youtube-dl="youtube-dl -t"

# git specific. This is the command which I use when git asks me to commit something and says that I have modified files, even when I haven't.
alias gdrop="git stash && git stash drop"
#alias gitk="gitg" # Requires gitg . I just think that it looks nicer than gitk. # MKAYSIGREP MKAYSIGREPALIAS

# Show compilation date of WeeChat.
alias weechat-version="weechat --help|head -n2"

#NMAP specific. All nmap things should be run as root, so it's probably best to copy these aliases to root's .zshrc. Things which don't run without root ask for sudo password.
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
# Little "safer" scan as connecting to only HTTP and HTTPS ports doesn't look so attacking. Copy-paste to .zsh_custom and remove  " -p 80,443" if you want to scan all ports which nmap scans by default.
alias nmap-osscan="sudo nmap -p 80,443 -O -v --osscan-guess --fuzzy "
#alias netcat="ncat " # MKAYSIGREP # MKAYSIGREPALIAS

# Tor (The Onion Router) specific.
#alias usewithtor="proxychains " # MKAYSIGREP MKAYSIGREPALIAS
#alias torsocks="proxychains " # MKAYSIGREP MKAYSIGREPALIAS

# This should allow aliases to work with proxychains. 
#alias proxychains="proxychains " # MKAYSIGREP MKAYSIGREPALIAS

# Downloads folder over SSH. Usage: rdownload <host>:<remotefolder> <local_destination> | TIP: use ~/ssh/config to configure hosts.
alias rdownload="rsync -h --progress -avz "
alias rscp='rsync -h --progress -avz '
alias rscpr='rsync -h --progress -azvv '

# TMUX specific
alias attach="tmux -u attach-session"
alias detach="tmux -u detach"
alias tmux="tmux -u"

# I am always typoing "aptitude" with my phone...
alias aptitute="aptitude "

# This is the checkinstall rule which I like to use.
#alias checkinstall="make install " # MKAYSIGREP MKAYSIGREPALIAS

# The Battle for Wesnoth specific, http://wesnoth.org/
# It seems to be an good idea to have debug logs on terminal with svn version.
alias wesnoth="wesnoth --debug"

# Auto extension things, ( modified from https://wiki.archlinux.org/index.php/Zsh#Advanced_.zshrc_files )
alias -s html=$BROWSER
alias -s org=$BROWSER
alias -s php=$BROWSER
alias -s com=$BROWSER
alias -s net=$BROWSER
alias -s png="eog"
alias -s jpg="eog"
alias -s gif="eog"
alias -s sxw="libreoffice --writer"
alias -s doc="libreoffice --writer"
alias -s gz='tar -xzvf'
alias -s bz2='tar -xjvf'
#alias -s java=$EDITOR
#alias -s txt=$EDITOR
#alias -s PKGBUILD=$EDITOR

# For copy-pasting directly from somewhere
alias %=" "
alias \#=" "

# Supybot specifig. Why to write long command, if you can write short command?
alias supybot-config-reload="killall -HUP supybot "
alias supybot-owner-quit="killall -INT supybot "
# Translating plugins in Limnoria
alias supybot-generate-messages.pot="pygettext --docstrings config.py plugin.py"
alias supybot-check-plugin-trans="sandbox/check_trans.py plugins/"
alias supybot-generate-messages.pot-mass="find . -type d -exec sh -c '(cd {} && pygettext --docstrings config.py plugin.py)' ';'"

# ZSH specific.
# I think that "theme" is more describing than "prompt".
alias theme="prompt "

## -- Start of aliases which are saved from Ubuntu default bashrc. --

# enable color support of ls and also add handy aliases
if [[ $UNAME != Darwin ]]; then
    alias ls='ls --color=always'
fi
alias dir='dir --color=always'
alias vdir='vdir --color=always'
alias grep='grep --color=always'
alias fgrep='fgrep --color=always'
alias egrep='egrep --color=always'
# some more ls aliases
if [[ "$UNAME" != "Darwin" ]]; then
    alias ll='ls -alFh --color=always' && alias la='ls -A --color=always' && alias l='ls -CF --color=always'
fi

if [[ $UNAME = Darwin ]]; then
    alias ls="ls -Gp"
    alias ll="ls -alFHGp"
    alias l="ls -CFGp"
    alias ssh-add="\ssh-add -D && \ssh-add -K"
fi

# Add an "alert" alias for long running commands.  Use like so:
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
                        
## -- End of aliases which are saved from Ubuntu default bashrc. --

# Copying command in Supybot (Internet.DNS)
alias dns="nslookup "
alias dns6="nslookup -type=AAAA "
alias nslookup6="nslookup -type=AAAA "

# If I have nslookup6...
alias dig6="dig AAAA "

# SSHGuard specific
alias sshguard-show-bans="sudo iptables -L sshguard --line-numbers"
# Enter ban number as arguement. You can see ban numbers with previous command.
alias sshguard-unban="sudo iptables -D sshguard "

# This needs something which makes it easy to remember.
alias KILL="killall -KILL "

# For locally rsync copying folder1 to folder2.
alias rsync-folder="rsync -h --progress -azvv "

# SSHGuard seems to prefer users to run this always when connecting with keys in ssh-agent...
if [[ $UNAME != Darwin ]]; then
    alias ssh-add="\ssh-add -D && \ssh-add "
fi

# Use GPG2 instead of GPG!
#alias gpg=gpg2 # MKAYSIGREP MKAYSIGREPALIAS
# ZSH doesn't currently include automatic completion for GPG2, 
# so use the GPG one, which works with GPG2 too. This is in aliases, 
# because that above alias needs this and this will disappear when zsh 
# gets GPG2 completion. See 
# http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=666755
#compdef gpg2=gpg # MKAYSIGREP MKAYSIGREPALIAS

# For locally installed mosh on remote server.
alias lmosh="mosh --server=~/.local/bin/mosh-server "
alias lmosha="mosh --server=~/.local/bin/mosh-server-alt "

# Allow custom aliases to be put in .aliases or .zsh_aliases .

# Secure cat
alias scat="gpg --decrypt "

# To check are keys, which apt uses changed
alias apt-key-refresh-keys="apt-key adv --keyserver pool.sks-keyservers.net --refresh-keys"

# To see which mirror http.debian.net puts you to. The file which has the latest update time is the mirror which you are using.
alias http.debian.net="curl -sL http://http.debian.net/debian/project/trace/|pandoc -f html -t markdown"

# Amount of keys in GPG keyring.
alias gpg-key-amount="gpg --list-keys|grep '^pub'|wc -l"
alias gpg-key-count="gpg --export -a|gpg --import"

alias follow="tail -f "

#myip shows current IP. This was a function.
alias myip="curl -s http://icanhazip.com"
alias myip4="curl -s4 http://icanhazip.com"
alias myip6="curl -s6 http://icanhazip.com"

# Curl instead of wget with warning
#alias wget="echo Running curl -LO instead of wget && curl -LO " # MKAYSIGREP # MKAYSIGREPALIAS

# Update groups without logging out. Requires entering password. Source: http://blog.edwards-research.com/2010/10/linux-refresh-group-membership-without-logging-out/
alias refreshgroups="exec su -l $USER"

# Incasesensitive grepping
alias grep="grep -i"

# Get public key lenght of (public) SSH key
alias ssh-pubkey-length="ssh-keygen -lf "

# MSDOS commands. MSDOS is after every alias line to get these lines easily by grepping.
alias cls=clear # MSDOS
alias help=man # MSDOS
alias ipconfig=ifconfig # MSDOS
alias copy=cp # MSDOS
alias move=mv # MSDOS

# List git committers of repository
alias git-committers="git shortlog -s"

alias unixle="flip -ub "
alias msdosle="flip -mb "

# Making .iso bootable from CD/DVD/USB. Cat it to /dev/<DEVICE>
# MaKe Hybrid ISO
alias mkhiso=isohybrid

# Yum
alias yum-unlock="rm -rf /var/run/yum.pid"
alias yum-rm-timedhosts="rm /var/cache/yum/$CPUARCH/17/timedhost*"
alias yummy="yum -y "
alias yummn="yum -n "
alias yumy=yummy
alias yumn=yummn

# Archiving and extracting with tar
# This is tartar to avoid conflict with tar
alias tartar="tar cfv "
alias targz="tar cfvz "
alias tarbz2="tar cfvj "
# ex-tartar and ex-tar, because there is alias tartar and command tar
alias ex-tar="tar xfv "
alias ex-tartar="tar xfv "
alias ex-targz="tar xfvz "
alias ex-tarbz2="tar xfvj "

alias info="echo 'I don't know anyone who likes and uses info pages, so I aliased this to pinfo. If you don't have it installed, you should install it! To override this alias run: \info <document>' && pinfo "

# systemd runlevels/targets
alias currenttargets="systemctl list-units --type=target"
alias telsystemd="systemctl isolate "
alias defaulttarget="systemctl enable "

# For getting timestamps in history
alias history="history -i "

# To have less handle ls colours
alias less="less -R "

# "su -" with/without sudo
alias ssu="sudo su -"
alias suu="su -"

# Fedora Utils http://satya164.github.com/fedorautils/
alias fedorautils="\fedorautils -c"
alias fedorautils-install='su -c "curl http://download.opensuse.org/repositories/home:/satya164:/fedorautils/Fedora_17/home:satya164:fedorautils.repo -Lo /etc/yum.repos.d/fedorautils.repo && yum -y install fedorautils"'

# ReSet Screen rss
alias rss=reset

# Who command which I use with Conky
alias cwho="who -H -w -u"

# Upgrading Redhad/Debian
alias yumyup="yum -y check-update;yum -y update;grub2-mkconfig -o /boot/grub2/grub.cfg"
alias apt-getyup="apt-get -y update;apt-get -y upgrade;update-grub"
alias aptitudeyup="aptitude -y update;aptitude -y upgrade;update-grub"
alias aptyup="apt -y update;apt -y upgrade;update-grub"

alias apt-gety="apt-get -y "
alias aptitudey="aptitude -y "
alias apty="apt -y"

#alias aptitude='echo "You might want to try apt-* instead..."' #MKAYSIGREP #MKAYSIGREPALIAS

# Set core pattern how I want it to be
alias fcorepattern='echo kernel.core_pattern = %e-%p-%h.core >> /etc/sysctl.conf;sysctl -f'

# ffmpeg is depreceated
alias ffmpeg=avconv

# inxi  https://code.google.com/p/inxi/
alias inxi-install="mkdir -p ~/.local/bin && cd ~/.local/bin && \wget -Nc smxi.org/inxi && chmod +x inxi && cd"
alias inxi-install-root="cd /usr/local/bin;\wget -Nc smxi.org/inxi;chmod +x inxi;./inxi -U;cd"
alias inxi-update="inxi -U"

# FINEID
pkcs11so=`locate opensc-pkcs11.so`
alias ssh-add-sc="ssh-add -s $pkcs11so"
alias ssh-add-sc-pub="ssh-add -L"

## apt in Ubuntu 14.04+ and other distributions

#if [ -f /usr/bin/apt ]; then
#    alias aptitude=apt
#    alias apt-get=apt
#    alias apt-cache=apt
#fi

# Same as the previous, but for yum --> dnf

if [ -f /usr/bin/dnf ]; then
    alias yum=dnf
fi

# Homebrew
alias homebrew-install="mkdir -p ~/.local/bin;cd ~/.local;git clone https://github.com/Homebrew/homebrew.git;mkdir -p $HOME/.local/share/man/man1;ln -sf $HOME/.local/homebrew/bin/brew $HOME/.local/bin/brew;ln -sf $HOME/.local/homebrew/share/man/man1/brew.1 $HOME/.local/share/man/man1/brew.1;cd"

# OS X Server
alias osx-server-caching-interface="serveradmin settings caching:Interface ="

# Simple HTTPd with Python.
alias python2-httpd="python -m SimpleHTTPServer"
alias python3-httpd="python -m http.server"

# .aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# .zsh_aliases
if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
fi

#####   Functions                   ZGC5QQ  #####

# GEOIP lookup, copied from the ultimate bashrc http://goo.gl/qGK5j
function geoip() {
geoiplookup $1
}

# Checks which package the command comes from. Copied from the ultimate bashrc http://goo.gl/qGK5j
function cmdpkg() { PACKAGE=$(dpkg -S $(which $1) | cut -d':' -f1); echo "[${PACKAGE}]"; dpkg -s "${PACKAGE}" ;}

# Down for everyone or just me? Copied from the ultimate bashrc http://goo.gl/qGK5j
function downforme() {
	RED='\e[1;31m'
	GREEN='\e[1;32m'
	YELLOW='\e[1;33m'
	NC='\e[0m'
	if [ $# = 0 ]
	then
		echo -e "${YELLOW}usage:${NC} downforme website_url"
	else
		JUSTYOUARRAY=(`lynx -dump http://downforeveryoneorjustme.com/$1 | grep -o "It's just you"`)
		if [ ${#JUSTYOUARRAY} != 0 ]
		then
			echo -e "${RED}It's just you. \n${NC}$1 is up."
		else
			echo -e "${GREEN}It's not just you! \n${NC}$1 looks down from here."
		fi
	fi
}

# Topt10 commands, copied from the ultimate bashrc http://goo.gl/qGK5j
function top10() {
	# copyright 2007 - 2010 Christopher Bratusek
	history | awk '{a[$2]++ } END{for(i in a){print a[i] " " i}}' | sort -rn | head
}

# ex command. Copied from zshrc of bioterror ( http://ricecows.org/configs/zsh/.zshrc ). Original comment below:
## for unit193 ;)
## use command "ex" to extract any archive files.
## "ex package.zip" for example
function ex ()

{
if [ -f "$1" ] ; then
case "$1" in
      *.tar)                tar xvf $1          ;;
      *.tar.bz2 | *.tbz2 )  tar xjvf $1         ;;
      *.tar.gz | *.tgz )    tar xzvf $1         ;;
      *.bz2)                bunzip2 $1          ;;
      *.rar)                unrar x $1          ;;
      *.gz)                 gunzip $1           ;;
      *.zip)                unzip $1            ;;
      *.Z)                  uncompress $1       ;;
      *.7z)                 7z x $1             ;;
      *.xz)                 tar xJvf $1         ;;
      *.deb)
         DIR=${1%%_*.deb}
         ar xv $1
         mkdir ${DIR}
         tar -C ${DIR} -xzvf data.tar.gz        ;;
      *.rpm)               rpm2cpio $1 | cpio -vid  ;;
      *)   echo ""${1}" cannot be extracted via extract()"
;;
    esac
   else
    echo ""${1}" is not a valid file"
fi
}

# Given by nyuszika7h. Shortens GitHub URLs with git.io
function gitio() {
    curl -s -i http://git.io -F "url=$1" | grep --color=never -P '^Location: ' | awk '{ print $2 }'
}

function mkcd() {
    if [[ $# -gt 1 ]]; then
        echo 'Warning: All directories will be created, but will change to first specified directory.' 1>&2
    fi
    mkdir -p "$*" && cd "$1"
}

function gribble-gpg-everify() {
    # Set which command to use for gpg. You
    # probably want to use gpg2 here.
    local gpg=gpg2

    echo -n 'Enter Bitcoin OTC URL: '
    read REPLY
    lynx -hiddenlinks=ignore -dump $REPLY > bitcoin_otc.txt.asc
    $gpg --decrypt-file bitcoin_otc.txt.asc
    echo -en '\e[1;32m;;everify '
    cat bitcoin_otc.txt
    echo -e '\e[0m'
    rm -rf bitcoin_otc.txt bitcoin_otc.txt.asc
}

# This function will install/upgrade shell-things.

function shell-things {

export SHELL_THINGS_REPO=$HOME/.shell-things
export MKAYSIGREP=$HOME/.MKAYSIGREP

# Check if ~/.shell-things exists and cd and pull.
if [ -d $SHELL_THINGS_REPO ]; then
    echo "shell-things: $SHELL_THINGS_REPO exists, git pulling..."
    echo ""
    cd $SHELL_THINGS_REPO
    git pull
    echo ""
    echo "shell-things: Installing/Upgrading..."
    echo ""
# If it doesn't exist...
else
    echo ""
    echo "shell-things: $SHELL_THINGS_REPO doesn't exist, cloning..."
    echo ""
    git clone https://github.com/Mkaysi/shell-things.git $SHELL_THINGS_REPO
    cd $SHELL_THINGS_REPO
    echo ""
    echo "shell-things: Installing/Upgrading..."
    echo ""
fi

# Installing...
./install.run
echo ""
echo "shell-things: Installing finished."
echo ""

#If ~/.MKAYSIGREP exists, run that script too...
if [ -f "$MKAYSIGREP" ]; then
    echo "MKAYSIGREP has been used previously, Installing/Upgrading."
    ./.install.MKAYSIGREP.run
fi

echo ""
echo "shell-things: Everthing is now done :)"
echo ""

cd

}

# This function will download and install sources.list.

function ubuntu-sources-list-install {

export RELEASE=`lsb_release -sr`
a[1]="http://mkaysi.github.io/shell-things/sources.list/$RELEASE"

echo "I am now changing directory to /etc/apt/."
echo ""
cd /etc/apt/

echo "I will now backup sources.list to sources.list.bak ."
echo ""
cp /etc/apt/sources.list /etc/apt/sources.list.bak

echo "I will now download the sources.list file from https://mkaysi.github.io/shell-things/sources.list/$RELEASE and save it as /etc/apt/sources.list ."
echo ""
echo "" > /etc/apt/sources.list
\wget ${a[1]} -O /etc/apt/sources.list
#\curl -L ${a[1]} >> /etc/apt/sources.list

echo ""
echo "The new sources.list file should now be installed."
echo ""

echo "Finally, I will now run 'apt-get -y update' so the new sources.list is used."
echo ""

apt-get update

echo "I have now finished everything that I was supposed to do."

}

# This function fixes nodejs on Debian based systems.
# (Everything expects nodejs to be called as node, but it's not with Debian.)
function fix-node {

if [[ $USER = "root" && -f /usr/bin/nodejs && ! -f /usr/bin/node && ! -f /usr/local/bin/node ]] then;
    ln -s /usr/bin/nodejs /usr/local/bin/node
fi

mkdir -p $HOME/.local/bin

if [[ -f /usr/bin/nodejs && ! -f /usr/bin/node && ! -f /usr/local/bin/node && ! -f $HOME/.local/bin/node ]] then;
    ln -s /usr/bin/nodejs $HOME/.local/bin/node
fi

}

# Show hidden files in OS X.

function osx-show-hidden-files {
if [ "$1" = "TRUE" ] || ["$1" = 1 ] ; then
    $USERCHOICE = "TRUE"
else
    $USERCHOICE = 0
fi

defaults write com.apple.finder AppleShowAllFiles $USERCHOICE
echo "defaults write com.apple.finder AppleShowAllFiles $USERCHOICE"
}

# Enable AirDrop on unsupported Macs + Ethernet.

function osx-airdrop-listenall {
if [ "$1" = "TRUE" ] || ["$1" = 1 ] ; then
    $USERCHOICE = "TRUE"
else
    $USERCHOICE = 0
fi

defaults write com.apple.NetworkBrowser BrowseAllInterfaces $USERCHOICE
echo "defaults write com.apple.NetworkBrowser BrowseAllInterfaces $USERCHOICE"
}

# Check the time how often updates are checked on OS X.
function osx-set-updatecheck {
defaults write /Library/Preferences/com.apple.SoftwareUpdate ScheduleFrequency $1
echo "defaults write /Library/Preferences/com.apple.SoftwareUpdate ScheduleFrequency $1"
}


# Source files for miscannellious modifications.

# .custom
if [ -f ~/.custom ]; then
    source ~/.custom
    fi

# .zsh_custom
if [ -f ~/.zsh_custom ]; then
    source ~/.zsh_custom
    fi

# Warnings
if [ -f ~/.warnings ]; then
    source ~/.warnings
    fi
