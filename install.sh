#!/bin/bash
# This script "installs" files in this gist. This script is created by Mika Suomalainen (Mkaysi).
# WARNING: This will overwrite your .bashrc, .bash_aliases and .bash_profile !
# NOTICE: For this script to work, you must cd to folder where this script is and run ./install.sh
#
#   WARNING: USE THIS SCRIPT WITH YOUR OWN RESPONSIBLITY. AUTHOR OF THIS SCRIPT IS NOT RESPONSIBLE
#   OF ANY HARMS WHICH MIGHT BE CAUSED BY THIS SCRIPT. NOTICE THAT AS SAID BEFORE, THIS WILL
#   OVERWRITE YOUR CURRENT .bashrc, .bash_aliases AND .bash_profile ! YOU HAVE BEEN WARNED!
#
echo "Installing bash_aliases."
cat bash_aliases > ~/.bash_aliases
echo "bash_aliases installed."
echo "Installing bash_profile"
cat bash_profile > ~/.bash_profile
echo "bash_profile installed."
echo "Installing bashrc."
cat bashrc > ~/.bashrc
echo "bashrc installed."
echo "Sourcing bash_aliases..."
source ~/.bash_aliases
echo "Sourcing bashrc..."
source ~/.bashrc
# echo "Sourcing bash_profile..."
# source bash_profile
## The above is not required, because my bash_profile only sources bashrc.
echo "Installation has completed."
