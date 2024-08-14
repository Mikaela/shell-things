#!/usr/bin/env bash

. ~/.local/share/dark-mode.d/00-do-not-repeat-yourself.bash

if [[ "$ID" == "kali" ]]; then
	lookandfeeltool --platform offscreen --apply "Kali-Purple-Light"
elif [[ "$ID" == "fedora" ]]; then
	lookandfeeltool --platform offscreen --apply "org.fedoraproject.fedora.desktop"
fi
