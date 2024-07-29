#!/usr/bin/env bash

. ~/.local/share/dark-mode.d/00-do-not-repeat-yourself.bash

if [[ "$DISTROID" == "Kali" ]]; then
	lookandfeeltool --platform offscreen --apply "Kali-Purple-Light"
elif [[ "$DISTROID" == "Fedora" ]]; then
	lookandfeeltool --platform offscreen --apply "org.fedoraproject.fedora.desktop"
fi
