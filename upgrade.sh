#!/bin/bash
echo "Backing up files..."
cat ~/.bash_exports > ~/.bash_exports.old.backup
cat ~/.bash_profile > ~/.bash_profile.old.backup
cat ~/.bash_aliases > ~/.bash_aliases.old.backup
cat ~/.bash_functions > ~/.bash_functions.old.backup
cat ~/.bashrc > ~/.bashrc.old.backup
echo "Installing new files..."
cat bash_exports > ~/.bash_exports
cat bash_profile > ~/.bash_profile
cat bash_aliases > ~/.bash_aliases
cat bash_functions > ~/.bash_functions
cat bashrc ~/.bashrc
echo "Installation has been completed. You might now need to source your ~/.bashrc for changes to
happen."
