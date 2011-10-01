#!/usr/bin/env zsh
echo "If you are upgrading, press ctrl + c NOW! You have 15 seconds time to cancel this. rerunning this script will overwrite your backups and it makes uninstall.sh useless."
sleep 15;
echo "Taking backups..."
touch ~/.zshrc # Creates .zshrc if you don't have one.
cat ~/.zshrc > ~/.zshrc.default.backup # Backups your current .zshrc
touch ~/.zsh_aliases # Creates .zsh_aliases if you don't have one.
cat ~/.zsh_aliases > ~/.zsh_aliases.default.backup # Backups your current .zsh_aliases
touch ~/.zshenv # Creates .zshenv
cat zshenv > ~/.zshenv.default.backup # Backs up .zsh_exports.
touch ~/.zsh_functions
cat ~/.zsh_functions > ~/.zsh_functions.default.backup # Backs up .zsh_functions .
touch ~/.zsh_tmux
cat ~/.zsh_tmux > ~/.zsh_tmux.default.backup
echo "Done!"
echo "Installing zsh_aliases."
cat zsh_aliases > ~/.zsh_aliases
echo "zsh_aliases installed."
echo "Installing zshrc."
cat zshrc > ~/.zshrc
echo "zshrc installed."
echo "Installing zshenv"
cat zshenv > ~/.zshenv
echo "zsh_exports installed."
echo "Installing zsh_functions"
cat zsh_functions > ~/.zsh_functions
echo "zsh_functions installed."
echo "Installing zsh_tmux..."
cat zsh_tmux > ~/.zsh_tmux
echo "zsh_tmux installed."
echo "Installation has completed. Now run 'source ~/.zshrc' to enable the new things."
