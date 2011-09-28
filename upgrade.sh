#!/usr/bin/env bash
echo "Backing up files..."
touch ~/.bash_exports
cat ~/.bash_exports > ~/.bash_exports.old.backup
touch ~/.bash_profile
cat ~/.bash_profile > ~/.bash_profile.old.backup
touch ~/.bash_aliases
cat ~/.bash_aliases > ~/.bash_aliases.old.backup
touch ~/.bash_functions
cat ~/.bash_functions > ~/.bash_functions.old.backup
touch ~/.bashrc
cat ~/.bashrc > ~/.bashrc.old.backup
echo "Installing new files..."
cat bash_profile > ~/.bash_profile
cat bash_aliases > ~/.bash_aliases
cat bash_functions > ~/.bash_functions
cat bashrc > ~/.bashrc
echo "Not installing bash_exports, See content of that file:"
touch ~/.bash_exports
echo "--    Start of content of bash_exports    --"
cat bash_exports
echo "--    End of content of bash_exports      --"
echo "--    end of content of bash_private_aliases  --"
echo "Installation has been completed. You might now need to source your ~/.bashrc for changes to happen."
