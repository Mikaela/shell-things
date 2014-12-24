UNAME=$(uname)
# TOC
#   Defaults etc...             M0TZLS
#   Environment                 7RS56S
#   Aliases                     RJ706I
#   Functions                   ZGC5QQ

# For OS X + SSH sessions. bashrc must be sourced by hand at least once.
echo "if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi" > ~/.bash_profile

# enable terminal bell

if [ -f /usr/bin/xset ];
then
    (xset b on&)
fi

#####   Defaults etc...             M0TZLS  #####

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# save history
export PROMPT_COMMAND='history -a'

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if which tput >&/dev/null && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# Red colour for root, thanks nyuszika7h 
# Check if we're root
if [[ $EUID == 0 ]]; then
    PS1='\033[1;31m\u@\h:\w\$\033[0m '
else
    PS1='\033[1;32m\u@\h:\w\$\033[0m '
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=always'
    alias dir='dir --color=always'
    alias vdir='vdir --color=always'

    alias grep='grep --color=always'
    alias fgrep='fgrep --color=always'
    alias egrep='egrep --color=always'
fi

# some more ls aliases
if [[ $UNAME != Darwin ]]; then
    alias ll='ls -alFh --color=always' && alias la='ls -A --color=always' && alias l='ls -CF --color=always'
fi

if [[ $UNAME = Darwin ]]; then
    alias ls="ls -Gp"
    alias ll="ls -alFHGp"
    alias l="ls -CFGp"
    alias ssh-add="\ssh-add -D && \ssh-add -K"
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#Shopt settings.
#shopt -s autocd

# Show the hostname, uptime and users logged in on shell start
(hostname&)
(uptime&)
(echo "")
if [[ $UNAME != Darwin ]]; then
    (who -H -w -u|head -n10&)
    (echo "")
    (last -10 -w -x&)
fi

if [[ $UNAME = Darwin ]]; then
    (who -H -u|head -n10&)
    (echo "")
    (last -10&)
fi

#####   Environment                 7RS56S  #####
# Environment should be placed to .environment or .bash_environment.

# Source before mentioned locations if they exist.

# .environment
if [ -f ~/.environment ]; then
    source ~/.environment
fi

# .bash_environment
if [ -f ~/.bash_environment ]; then
    source ~/.bash_environment
fi

# Enable core files.
(ulimit -c unlimited&)

# More colours :D
if [[ $TERM == 'xterm' ]]; then
export TERM=xterm-256color
fi

if [[ $TERM == 'screen' ]]; then             
export TERM=screen-256color              
fi

# Things after this are just examples and should be put to some other file, which is sourced above.

# Sets the default editor. I am vim user, so I want it to be vim. If you don't like terminal based text editors, change "" to gedit (Gnome) or Kate (KDE).
#export EDITOR=vim # MIKAELA_GREP MIKAELA_GREP_ENVIRONMENT

# Sets locale. You can get list of locales with "locale -a" command. This should be something which ends to .utf8
#export LC_ALL=fi_FI.UTF-8 # MIKAELA_GREP # MIKAELA_GREP_ENVIRONMENT

# Sets your timezone. Set in format <Region/City>, or just timezone like UTC.
#export TZ="Europe/Helsinki" # MIKAELA_GREP #MIKAELA_GREP_ENVIRONMENT

# pyenv (Source: their README.md file http://git.io/ReCDSQ )
export PYENV_ROOT="$HOME/.pyenv"
alias pyenv-install="\wget -O /tmp/pyenv-installer https://raw.github.com/yyuu/pyenv-installer/master/bin/pyenv-installer;chmod +x /tmp/pyenv-installer;/tmp/pyenv-installer;rm /tmp/pyenv-installer"
alias pyenv-install-alt="cd ~;git clone https://github.com/yyuu/pyenv.git $PYENV_ROOT"

# Sets PATH. To add another path, add :</path/to/new/path> to string below. 
PATH=$HOME/.local/bin:$HOME/.local/sbin:$HOME/.local/games:$PYENV_ROOT/shims:$PYENV_ROOT/bin:$HOME/bin:$HOME/sbin:$HOME/games:/usr/local/bin:/usr/local/sbin:/usr/local/games:/usr/bin:/usr/sbin:/usr/games:/bin:/sbin:/games:$PATH

# Removes duplicates from $PATH. Copied from http://unix.stackexchange.com/a/14896
PATH=$(echo "$PATH" | awk -v RS=':' -v ORS=":" '!a[$1]++{if (NR > 1) printf ORS; printf $a[$1]}')

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

# Sets environment variable CPUARCH to output of "uname -p" & UNAME to "uname"
UNAME=$(uname)
CPUARCH=$(uname -p)

# If we are on Linux, enable apt progress bar and colours
if [[ $USER = "root" ]]; then
    mkdir -p /etc/apt/apt.conf.d/
    echo 'Dpkg::Progress-Fancy "1";' > /etc/apt/apt.conf.d/99progressbar
    echo 'DPkgPM::Progress-Fancy "1";' >> /etc/apt/apt.conf.d/99progressbar
    echo 'APT::Color "1";' > /etc/apt/apt.conf.d/99color
fi

# Copied from http://homepages.see.leeds.ac.uk/~eeaol/notes/2012/03/how_to_only_type_ssh_passphrase_once/
export SSH_AUTH_SOCK=/tmp/$USER.agent
(ssh-agent -a /tmp/$USER.agent > /dev/null 2>&1&)

# In our series useless/weird environment variables, beep
export beep=
export BEEP=

# OS X ls colours (copied from https://apple.stackexchange.com/questions/33677/how-can-i-configure-mac-terminal-to-have-color-ls-output )
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# make
if [[ $UNAME != Darwin ]]; then
    export NPROC=$(nproc)
else
    export NPROC=$(sysctl -n hw.ncpu)
fi
alias maken="make -j$NPROC"

# Ensure that pkg-config paths are found
export PKG_CONFIG_PATH=$(which pkg-config)

#####   Aliases                     RJ706I  #####

# To get sudo work with aliases.
alias sudo="sudo "

# Moving between directories:
alias ..="cd .."

# Use htop instead of top, it's better. Requires htop.
#alias top="htop" # MIKAELA_GREP # MIKAELA_GREP_ALIAS

# Add title to youtube-dl & make yle-dl Windows-friendly
alias youtube-dl="youtube-dl -t"
alias yle-dl="yle-dl --vfat"

# git specific. This is the command which I use when git asks me to commit something and says that I have modified files, even when I haven't.
alias gdrop="git stash && git stash drop"
#alias gitk="gitg" # Requires gitg . I just think that it looks nicer than gitk. #MIKAELA_GREP # MIKAELA_GREP_ALIAS

# If I run nautilus, I want it to open in folder where I am.
#alias nautilus="nautilus ./"

#SHow compilation date of WeeChat.
alias weechat-version="weechat --help|head -n2"

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
# Little "safer" scan as connecting to only HTTP and HTTPS ports doesn't look so attacking. Copy-paste to .bash_custom and remove  " -p 80,443" if you want to scan all ports which nmap scans by default.
alias nmap-osscan="sudo nmap -p 80,443 -O -v --osscan-guess --fuzzy "

# Downloads folder over SSH. Usage: rdownload <host>:<remotefolder> <local_destination> | TIP: use ~/ssh/config to configure hosts.
alias rdownload="rsync -h --progress -avz "
alias rscp='rsync -h --progress -avz '
alias rscpr='rsync -h --progress -azvv '

# TMUX specific
alias tmux="tmux -2u"
alias attach="tmux attach-session"
alias detach="tmux detach"

# I am always typoing "aptitude" with my phone...
alias aptitute="aptitude "

# The Battle for Wesnoth specific, http://wesnoth.org/
# It seems to be an good idea to have debug logs on terminal with svn version.
alias wesnoth="wesnoth --debug"

# For copy-pasting directly from somewhere
alias %=" "
alias \#=" "
# Supybot specifig. Why to write long command, if you can write short command?
alias supybot-config-reload="killall -HUP supybot "
alias supybot-owner-quit="killall -INT supybot "
# Translating plugins in Limnoria
alias supybot-generate-messages.pot="pygettext --docstrings config.py plugin.py"
alias supybot-generate-messages.pot-xgettext="xgettext --language=Python config.py plugin.py && mv -f messages.po messages.pot"
alias supybot-check-plugin-trans="sandbox/check_trans.py plugins/"
alias supybot-check-core-trans="sandbox/check_trans.py --core"
alias supybot-generate-messages.pot-mass="find . -type d -exec sh -c '(cd {} && pygettext --docstrings config.py plugin.py)' ';'"

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
if [[ $UNAME != Darwin ]]; then
    alias ll='ls -alFh --color=always' && alias la='ls -A --color=always' && alias l='ls -CF --color=always'
fi

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
alias gpg=gpg2
export KEYBASE_GPG=gpg2
alias gpg-fix-tty='export GPG_TTY=$(tty)'

# For userspecific installation of mosh on remote server.
alias lmosh="mosh --server=~/.local/bin/mosh-server "
alias lmosha="mosh --server=~/.local/bin/mosh-server-alt "

# Secure cat
alias scat="gpg --decrypt "

# To check are keys, which apt uses changed
alias apt-key-refresh-keys="apt-key adv --keyserver pool.sks-keyservers.net --refresh-keys"

# To see which mirror http.debian.net puts you to. The file which has the latest update time is the mirror which you are using.
alias http.debian.net="curl -sL http://http.debian.net/debian/project/trace/|pandoc -f html -t markdown"

# Amount of keys in GPG keyring.
alias gpg-key-amount="gpg --list-keys|grep '^pub'|wc -l"
alias gpg-key-count="gpg --export -a|gpg --import"

alias follow="tail -F"

#myip shows current IP. This was a function.
alias myip="curl -s http://icanhazip.com"
alias myip4="dig A +short myip.opendns.com @resolver1.opendns.com"
alias myip6="curl -s6 http://icanhazip.com"

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
alias git-changelog="git log --oneline --decorate"
alias git-changelog-color="git log --oneline --decorate --color"

# Line ending converting with flip
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
# I have function ex so these are ex-* to avoid conflict.
# ex-tartar and ex-tar, because there is alias tartar and command tar
alias ex-tar="tar xfv "
alias ex-tartar="tar xfv "
alias ex-targz="tar xfvz "
alias ex-tarbz2="tar xfvj "

alias info="echo 'I don't know anyone who likes and uses info pages, so I aliased this to pinfo. If you don't have it installed, you should install it! To override this alias run: \info <document>' && pinfo "

# To have less handle ls colours
alias less="less -R "

# "su -" with/without sudo
alias ssu="sudo su -"
alias suu="su -"

# systemd runlevels/targets
alias currenttargets="systemctl list-units --type=target"
alias telsystemd="systemctl isolate "
alias defaulttarget="systemctl enable "

# Fedora Utils http://satya164.github.com/fedorautils/
alias fedorautils="\fedorautils -c"
alias fedorautils-install='su -c "curl http://download.opensuse.org/repositories/home:/satya164:/fedorautils/Fedora_17/home:satya164:fedorautils.repo -Lo /etc/yum.repos.d/fedorautils.repo && yum -y install fedorautils"'

# ReSet Screen rss
alias rss=reset

# Who command which I use with Conky
alias cwho="who -H -w -u"

# Upgrading Redhat/Debian
alias yumyup="yum -y check-update;yum -y update;grub2-mkconfig -o /boot/grub2/grub.cfg"
alias apt-getyup="apt-get -y update;apt-get -y upgrade;update-grub"
alias aptitudeyup="aptitude -y update;aptitude -y upgrade;update-grub"

alias aptyup="apt -y update;apt -y upgrade;update-grub"
alias apty="apt -y"
alias apt-gety="apt-get -y "
alias aptitudey="aptitude -y "

# Set core pattern how I want it to be
alias fcorepattern='echo kernel.core_pattern = %e-%p-%h.core >> /etc/sysctl.conf;sysctl -f'

# ffmpeg is depreceated
alias ffmpeg=avconv

# inxi  https://code.google.com/p/inxi/
alias inxi-install="mkdir -p ~/.local/bin && cd ~/.local/bin && \wget -Nc smxi.org/inxi && chmod +x inxi && cd"
alias inxi-install-root="cd /usr/local/bin;\wget -Nc smxi.org/inxi;chmod +x inxi;./inxi -U;cd"
alias inxi-update="inxi -U"

# FINEID
#alias ssh-add-sc="ssh-add -s $(find /usr/*lib -name 'opensc-pkcs11.so')"
alias ssh-add-sc-pub="\ssh-add -L"

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
alias homebrew-install="cd ~;git clone https://github.com/Homebrew/homebrew.git;mkdir -p .local;rsync -aP homebrew/* .local;rsync -aP homebrew/.* .local;rm -rf homebrew"
alias homebrew-install-root="cd /usr;git clone https://github.com/Homebrew/homebrew.git;mkdir -p local;rsync -aP homebrew/* local;rsync -aP homebrew/.* local/;chmod -R 755 local;chown -R root:wheel local;rm -rf homebrew"
alias linuxbrew-install="cd ~;git clone https://github.com/Homebrew/linuxbrew.git;mkdir -p .local;rsync -aP linuxbrew/* .local;rsync -aP linuxbrew/.* .local;rm -rf linuxbrew"
alias linuxbrew-install-root="cd /usr;git clone https://github.com/Homebrew/linuxbrew.git;mkdir -p local;rsync -aP linuxbrew/* local;rsync -aP linuxbrew/.* local/;chmod -R 755 local;chown -R root:wheel local;rm -rf linuxbrew"

# OS X
alias osx-server-caching-interface="serveradmin settings caching:Interface ="
alias osx-show-hidden-files="defaults write com.apple.finder AppleShowAllFiles"
alias osx-airdrop-listenallif="defaults write com.apple.NetworkBrowser BrowseAllInterfaces"
alias osx-set-updatecheck="defaults write /Library/Preferences/com.apple.SoftwareUpdate ScheduleFrequency"

# Simple HTTPd with Python.
alias python2-httpd="python2 -m SimpleHTTPServer"
alias python3-httpd="python3 -m http.server"

# Resetting different desktop environments
alias reset-gnome="rm -rf ~/.gnome ~/.gnome2 ~/.gconf ~/.gconfd ~/.metacity ~/.cache ~/.dbus ~/.dmrc ~/.mission-control ~/.thumbnails ~/.config/dconf/user ~/.compiz*"
alias reset-unity="unity-tweak-tool --reset-unity"
alias reset-kde="rm -rf ~/.kde4 ~/.kde"
alias reset-lxpanel="rm -rf ~/.config/lxpanel;lxpanelctl restart"
alias reset-xfce4="rm -rf ~/.config/xfce4"
alias reset-matepanel="mate-panel --reset"

# Show date in ISO 8601 format
alias isodate='date "+%Y-%m-%d %H:%M:%S%z"'
alias isodateu='date -u "+%Y-%m-%d %H:%M:%S%z"'

# Show information on PEM file.
alias peminfo="openssl x509 -text -in"

# tmux emergency attach
alias tmuxeattach="/proc/$(pgrep -o tmux)/exe attach"

# Reset configuration files on systems using apt
alias purgeconfig="apt-get install --reinstall -o DPkg::options::=--force-confask"

# Send command output to http://sprunge.us `command|sprungeus`
alias sprungeus="curl -F 'sprunge=<-' http://sprunge.us"

# Always build pythons with --enable-shared when using pyenv
alias pyenv='CONFIGURE_OPTS="--enable-shared" PYTHON_CONFIGURE_OPTS="--enable-shared" command \pyenv'

# Copy-paste mtr output more easily
alias mtrp="mtr -rwc 5"
alias mtrp4="mtr -rw4c 5"
alias mtrp6="mtr -rw6c 5"

# pip
alias pip="python -m pip"
alias pip2="python2 -m pip"
alias pip3="python3 -m pip"
alias pippypy="pypy -m pip"
alias pippypy2="pypy2 -m pip"
alias pippypy3="pypy3 -m pip"
alias pypypip=pippypy
alias pypypip2=pippypy2
alias pypypip3=pippypy3

# apg with small letters, capital letters and numbers. I don't usually use
# special characters as they sometimes have difficulties with some systems
# and cross-platform operating systems.
# Usage: apt-random <minimum length>
alias apg-random="apg -a1 -M LCN -m"

# cp/mv using rsync. rcp appears to be link to scp in my system, so I can
# safely use this alias.
alias rcp="rsync -a --progress"
alias rmv="rsync -a --progress --remove-source-files"

# Allow custom aliases to be put in .aliases or .bash_aliases .

# .aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# .bash_aliases
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
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
JUSTYOUARRAY=($(lynx -dump http://downforeveryoneorjustme.com/$1 | grep -o "It's just you"))
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
    \history | awk '{a[$2]++ } END{for(i in a){print a[i] " " i}}' | sort -rn | head
}

# ex command. Copied from bashrc of bioterror ( http://ricecows.org/configs/bash/.bashrc ). Original comment below:
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

# Check if ~/.shell-things exists and cd and pull.
if [ -d $SHELL_THINGS_REPO ]; then
    echo "shell-things: $SHELL_THINGS_REPO exists, git pulling..."
    echo ""
    cd $SHELL_THINGS_REPO
    git remote set-url origin https://github.com/Mikaela/shell-things.git
    git pull
    echo ""
    echo "shell-things: Installing/Upgrading..."
    echo ""
# If it doesn't exist...
else
    echo ""
    echo "shell-things: $SHELL_THINGS_REPO doesn't exist, cloning..."
    echo ""
    git clone https://github.com/Mikaela/shell-things.git $SHELL_THINGS_REPO
    cd $SHELL_THINGS_REPO
    echo ""
    echo "shell-things: Installing/Upgrading..."
    echo ""
fi

# Installing...
bash -x ./install.run

echo ""
echo "shell-things: Everthing is now done :)"
echo ""

cd

}

# This function will download and install sources.list.

function ubuntu-sources-list-install {

export RELEASE=$(lsb_release -sr)
a[1]="http://mikaela.github.io/shell-things/sources.list/$RELEASE"

echo "I am now changing directory to /etc/apt/."
echo ""
cd /etc/apt/

echo "I will now backup sources.list to sources.list.bak ."
echo ""
cp /etc/apt/sources.list /etc/apt/sources.list.bak

echo "I will now download the sources.list file from https://mikaela.github.io/shell-things/sources.list/$RELEASE and save it as /etc/apt/sources.list ."
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
fix-node () {
        if [[ $USER = "root" && -f /usr/bin/nodejs && ! -f /usr/bin/node && ! -f /usr/local/bin/node ]]
        then
                ln -s /usr/bin/nodejs /usr/local/bin/node
        fi
        mkdir -p $HOME/.local/bin
        if [[ -f /usr/bin/nodejs && ! -f /usr/bin/node && ! -f /usr/local/bin/node && ! -f $HOME/.local/bin/node ]]
        then
                ln -s /usr/bin/nodejs $HOME/.local/bin/node
        fi
}

# This function fixes automatic startup in graphical sessions.
# I have had issues with auto start not doing anything and this seems to 
# fix it.
fix-autostart() {
    if [[ $USER = "root" ]]
    then
        mkdir -p /etc/xdg/autostart
        chmod -R 755 /etc/xdg/autostart
    fi
    mkdir -p ~/.config/autostart
    chmod -R 755 ~/.config/autostart
}

# This function removes and regenerates ssh host keys.

ssh-regen-host-keys () {
        rm /etc/ssh/ssh_host_*
        ssh-keygen -t dsa -N "" -f /etc/ssh/ssh_host_dsa_key
        ssh-keygen -t rsa -N "" -f /etc/ssh/ssh_host_rsa_key
        ssh-keygen -t ecdsa -N "" -f /etc/ssh/ssh_host_ecdsa_key
        ssh-keygen -t ed25519 -N "" -f /etc/ssh/ssh_host_ed25519_key
}

# This function erases Master Boot Record from device
# Note: this is dangerous so this function will echo the command
# instad of running it!
erase-mbr() {
    echo dd if=/dev/zero of=$1 bs=512 count=2
}

# Use clang if installed. It seems interesting and this is probably good
# way to test it. This might not be a function, but I don't have any better
# place for this.
if hash clang 2>/dev/null; then
    export CC=clang
fi

if hash clang++ 2>/dev/null; then
    export CXX=clang++
fi

# Function to temporarily set sysctl options which I want
function sysctl-mikaela() {
   set -x
   sysctl kernel.core_pattern=%e-%p-%h.core
   sysctl vm.swappiness=1
   sysctl net.ipv6.conf.eth0.use_tempaddr=2
   sysctl net.ipv6.conf.wlan0.use_tempaddr=2
   echo 'If network-manager is used, see /etc/NetworkManager/system-connections/<connection>'
   set +x
}

# Function to permanently set sysctl options which I want.
function sysctl-mikaela-run() {
    set -x
    echo kernel.core_pattern = %e-%p-%h.core >> /etc/sysctl.conf
    echo vm.swappiness = 1 >> /etc/sysctl.conf
    echo net.ipv6.conf.eth0.use_tempaddr=2 >> /etc/sysctl.conf
    echo net.ipv6.conf.wlan0.use_tempaddr=2 >> /etc/sysctl.conf
    sysctl -p
    echo 'If network-manager is used, see /etc/NetworkManager/system-connections/<connection>'
    set +x
}

# Add GitHub pull requests to fetched things via http://git.io/-C-0oQ
github-add-pulls() {
    git config --add remote.origin.fetch '+refs/pull/*/head:refs/remotes/origin/pr/*'
    git config --add remote.upstream.fetch '+refs/pull/*/head:refs/remotes/upstream/-pr/*'
}

# Get server SSL certificate fingerprint in MD5, SHA1 and SHA256.
# Note that this should not be pointed to round-robin and is pointed
# preferably to direct IP address.
# Note that OpenSSL doesn't support IPv6 at time of writing (2014-12-21).
serversslcertfp() {
    openssl s_client -connect $1 < /dev/null 2>/dev/null|openssl x509 -fingerprint -md5 -noout -in /dev/stdin
    openssl s_client -connect $1 < /dev/null 2>/dev/null|openssl x509 -fingerprint -sha1 -noout -in /dev/stdin
    openssl s_client -connect $1 < /dev/null 2>/dev/null|openssl x509 -fingerprint -sha256 -noout -in /dev/stdin
}

# Get server SSL certificate fingerprint in MD5, SHA1 and SHA256.
serversslcertfpmd5() {
    openssl s_client -connect $1 < /dev/null 2>/dev/null|openssl x509 -fingerprint -md5 -noout -in /dev/stdin
}

# Get server SSL certificate fingerprint in MD5, SHA1 and SHA256.
serversslcertfpsha1() {
    openssl s_client -connect $1 < /dev/null 2>/dev/null|openssl x509 -fingerprint -sha1 -noout -in /dev/stdin
}

# Get server SSL certificate fingerprint in MD5, SHA1 and SHA256.
serversslcertfpsha256() {
    openssl s_client -connect $1 < /dev/null 2>/dev/null|openssl x509 -fingerprint -sha256 -noout -in /dev/stdin
}

# .custom
if [ -f ~/.custom ]; then
    source ~/.custom
fi

# .bash_custom
if [ -f ~/.bash_custom ]; then
    source ~/.bash_custom
fi
