#!/bin/bash
# This script "installs" files in this gist.
# WARNING: This will overwrite your .bashrc, .bash_aliases and .bash_profile !!!!!!
# NOTICE: For this script to work, you must cd to folder where this script is.
echo "Installing bash_aliases."
cat bash_aliases > ~/.bash_aliases
echo "bash_aliases installed."
echo "Installing bash_profile"
cat bash_profile > ~/.bash_profile
echo "bash_profile installed."
echo "Installing bashrc."
cat bashrc > ~/.bashrc
echo "bashrc installed."
echo "Sourcing bashrc..."
source ~/.bashrc
echo "Installation has completed."
