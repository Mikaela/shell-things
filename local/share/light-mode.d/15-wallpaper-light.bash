#!/usr/bin/env bash

. ~/.local/share/dark-mode.d/00-do-not-repeat-yourself.bash

if [ -f ~/.wallpaper.light ]; then
	export WALLPAPER_PATH="$HOME/.wallpaper.light"
elif [ "$ID" == "fedora" ]; then
	export WALLPAPER_PATH="/usr/share/wallpapers/F$RELEASE_ID/contents/images/3840x2160.png"
elif [ "$ID" == "kali" ]; then
	export WALLPAPER_PATH="/usr/share/wallpapers/KaliMetal/contents/images/3840x2160.jpg"
fi

echo "Wallpaper: $WALLPAPER_PATH"

if [ "$ID" == "arch" ]; then
	qdbus6 org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript 'var allDesktops = desktops();print (allDesktops);for (i=0;i<allDesktops.length;i++) {d = allDesktops[i];d.wallpaperPlugin = "org.kde.image";d.currentConfigGroup = Array("Wallpaper", "org.kde.image", "General");d.writeConfig("Image", "file://'$WALLPAPER_PATH'")}'
else
	qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript 'var allDesktops = desktops();print (allDesktops);for (i=0;i<allDesktops.length;i++) {d = allDesktops[i];d.wallpaperPlugin = "org.kde.image";d.currentConfigGroup = Array("Wallpaper", "org.kde.image", "General");d.writeConfig("Image", "file://'$WALLPAPER_PATH'")}'
fi
