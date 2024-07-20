#!/usr/bin/env bash

if ! hash lsb_release 2> /dev/null; then
	ERRORMESSAGE="lsb_release was not found, the wallpaper scripts cannot figure out the distribution"
	echo $ERRORMESSAGE
	notify-send $ERRORMESSAGE
	exit 1
fi

export DISTROID=$(lsb_release -si)
export DISTROREL=$(lsb_release -sr)

if [ "$DISTROID" == "Fedora" ]; then
	export WALLPAPER_PATH="/usr/share/wallpapers/F$DISTROREL/contents/images_dark/3840x2160.png"
fi

qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript 'var allDesktops = desktops();print (allDesktops);for (i=0;i<allDesktops.length;i++) {d = allDesktops[i];d.wallpaperPlugin = "org.kde.image";d.currentConfigGroup = Array("Wallpaper", "org.kde.image", "General");d.writeConfig("Image", "file://'$WALLPAPER_PATH'")}'
