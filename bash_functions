# This file contains functions of my bashrc. You probably don't need to edit anything here.
#
# To disable function, just comment everything after description.

# GEOIP lookup, copied from the ultimate bashrc http://goo.gl/qGK5j
function geoip() {
geoiplookup $1
}

# MYIP, copied from the ultimate bashrc http://goo.gl/qGK5j . I think that it requires lynx.
function myip()
{
lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | awk '{ print $4 }' | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g'
}

# Checks which package the command comes from. Copied from the ultimate bashrc http://goo.gl/qGK5j
function cmdpkg() { PACKAGE=$(dpkg -S $(which $1) | cut -d':' -f1); echo "[${PACKAGE}]"; dpkg -s "${PACKAGE}" ;}

# ROT13, copied from the ultimate bashrc http://goo.gl/qGK5j
function rot13()
{
    if [ $# -lt 1 ] || [ $# -gt 1 ]; then
        echo "Seriously?  You don't know what rot13 does?"
    else
        echo $@ | tr A-Za-z N-ZA-Mn-za-m
    fi
}

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
