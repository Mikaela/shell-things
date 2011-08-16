#!/bin/bash
echo "Restoring default files..."
cat ~/.bashrc.default.backup > ~/.bashrc
cat ~/.bash_aliases.default.backup > ~/.bash_aliases
cat ~/.bash_profile.default.backup > ~/.bash_profile
cat ~/.bash_exports.default.backup > ~/.bash_exports
cat ~/.bash_functions.default.backup > ~/.bash_functions
