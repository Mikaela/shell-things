#!/usr/bin/env zsh
echo "If you are upgrading, press ctrl + c NOW! You have 15 seconds time to cancel this. rerunning this script will overwrite your backups and it makes uninstall.sh useless."
sleep 15;
echo "Taking backups..."
touch ~/.zshrc # Creates .zshrc if you don't have one.
cat ~/.zshrc > ~/.zshrc.default.backup # Backups your current .zshrc
touch ~/.zsh_aliases # Creates .zsh_aliases if you don't have one.
cat ~/.zsh_aliases > ~/.zsh_aliases.default.backup # Backups your current .zsh_aliases
touch ~/.zsh_exports # Creates .zsh_exports (this is my idea, I am surprised if you have it.)
cat ~/.zsh_exports > ~/.zsh_exports.default.backup # Backs up .zsh_exports.
touch ~/.zsh_functions # I am surprised if you have this, see above.
cat ~/.zsh_functions > ~/.zsh_functions.default.backup # Backs up .zsh_functions .
echo "Done!"
echo "Installing zsh_aliases."
cat zsh_aliases > ~/.zsh_aliases
echo "zsh_aliases installed."
echo "Installing zshrc."
cat zshrc > ~/.zshrc
echo "zshrc installed."
echo "Installing zsh_exports"
cat zsh_exports > ~/.zsh_exports
echo "zsh_exports installed."
echo "Installing zsh_functions"
cat zsh_functions > ~/.zsh_functions
echo "zsh_functions installed."
echo "Installation has completed. Now run 'source ~/.zshrc' to enable the new things."
