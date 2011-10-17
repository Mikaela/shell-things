#!/usr/bin/env bash
echo "Restoring default files..."
cat ~/.zshrc.default.backup > ~/.zshrc
cat ~/.zsh_aliases.default.backup > ~/.zsh_aliases
cat ~/.zshenv.default.backup > ~/.zshenv
cat ~/.zsh_functions.default.backup > ~/.zsh_functions
echo "Done! Now you should restart zsh or source files again for default files to affect."
