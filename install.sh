#!/bin/bash
echo "If you are upgrading, press ctrl + c NOW! You have 15 seconds time to cancel this.
re running this script will overwrite your backups and it makes uninstall.sh useless."
echo "Taking backups..."
touch ~/.bashrc # Creates .bashrc if you don't have one.
cat ~/.bashrc > ~/.bashrc.default.backup # Backups your current .bashrc
touch ~/.bash_aliases # Creates .bash_aliases if you don't have one.
cat ~/.bash_aliases > ~/.bash_aliases.default.backup # Backups your current .bash_aliases
touch ~/.bash_profile # Creates .bash_profile if you don't have it already.
cat ~/.bash_profile > ~/.bash_profile.default.backup # Back ups your current bash_profile.
touch ~/.bash_imports # Creates .bash_imports (this is my idea, I am surprised if you have it.)
cat ~/.bash_imports > ~/.bash_imports.default.backup # Backs up .bash_import.
touch ~/.bash_functions # I am surprised if you have this, see above.
cat ~/.bash_functions > ~/.bash_functions.default.backup # Backs up .bash_functions .
echo "Done!"
echo "Installing bash_aliases."
cat bash_aliases > ~/.bash_aliases
echo "bash_aliases installed."
echo "Installing bash_profile"
cat bash_profile > ~/.bash_profile
echo "bash_profile installed."
echo "Installing bashrc."
cat bashrc > ~/.bashrc
echo "Installing bash_imports"
cat bash_imports > ~/.bash_imports
echo "Installing bash_functions"
cat bash_functions > ~/.bash_functions
echo "bashrc installed."
#echo "Sourcing bash_aliases..."
#source ~/.bash_aliases
#echo "Sourcing bashrc..."
#source ~/.bashrc
# echo "Sourcing bash_profile..."
# source bash_profile
## The above is not required, because my bash_profile only sources bashrc.
echo "Installation has completed. Now run source ~/.bashrc to enable the new things."
