#!/usr/bin/env bash

. 00-do-not-repeat-yourself.sh

if [ -f ~/.wallpaper.light ]; then
	export WALLPAPER_PATH="$HOME/.wallpaper.light"
elif [ "$DISTROID" == "Fedora" ]; then
	export WALLPAPER_PATH="/usr/share/wallpapers/F$DISTROREL/contents/images/3840x2160.png"
fi

qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript 'var allDesktops = desktops();print (allDesktops);for (i=0;i<allDesktops.length;i++) {d = allDesktops[i];d.wallpaperPlugin = "org.kde.image";d.currentConfigGroup = Array("Wallpaper", "org.kde.image", "General");d.writeConfig("Image", "file://'$WALLPAPER_PATH'")}'
