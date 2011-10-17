#!/usr/bin/env bash
echo "Backing up files..."
touch ~/.zshenv
cat ~/.zshenv > ~/.zshenv.old.backup
touch ~/.zsh_aliases
cat ~/.zsh_aliases > ~/.zsh_aliases.old.backup
touch ~/.zsh_functions
cat ~/.zsh_functions > ~/.zsh_functions.old.backup
touch ~/.zshrc
cat ~/.zshrc > ~/.zshrc.old.backup
echo "Installing new files..."
cat zsh_aliases > ~/.zsh_aliases
cat zsh_functions > ~/.zsh_functions
cat zshrc > ~/.zshrc
echo "Not installing zshenv, See content of that file:"
touch ~/.zshenv
echo "--    Start of content of zshenv    --"
cat zshenv
echo "--    End of content of zshenv      --"
echo "Installation has been completed. You might now need to source your ~/.zshrc for changes to happen."
