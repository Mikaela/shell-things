#!/usr/bin/env zsh
echo "Backing up files..."
touch ~/.zsh_exports
cat ~/.zsh_exports > ~/.zsh_exports.old.backup
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
echo "Not installing zsh_exports, See content of that file:"
touch ~/.zsh_exports
echo "--    Start of content of zsh_exports    --"
cat zsh_exports
echo "--    End of content of zsh_exports      --"
echo "Installation has been completed. You might now need to source your ~/.zshrc for changes to happen."
