#!/usr/bin/env bash

. ~/.local/share/dark-mode.d/00-do-not-repeat-yourself.sh

if [[ "$DISTROID" == "Kali" ]]; then
	lookandfeeltool --apply "Kali-Purple-Light"
elif [[ "$DISTROID" == "Fedora" ]]; then
	lookandfeeltool --apply "org.fedoraproject.fedora.desktop"
fi
