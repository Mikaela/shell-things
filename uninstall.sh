#!/usr/bin/env zsh
echo "Restoring default files..."
cat ~/.zshrc.default.backup > ~/.zshrc
cat ~/.zsh_aliases.default.backup > ~/.zsh_aliases
cat ~/.zsh_exports.default.backup > ~/.zsh_exports
cat ~/.zsh_functions.default.backup > ~/.zsh_functions
echo "Done! Now you should restart zsh or source files again for default files to affect."
