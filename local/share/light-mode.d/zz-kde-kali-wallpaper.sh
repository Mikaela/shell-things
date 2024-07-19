#!/usr/bin/env bash

# To change the wallpaper on all desktops, you have to run a PlasmaShell script
# and iterate over all available desktops. This examples uses the default light
# wallpaper on Manjaro (Bamboo).

# Script credit @mamantoha: https://gist.github.com/mamantoha/c01363e5c791e8324d6248b09cf29bbb

WALLPAPER_PATH="/usr/share/wallpapers/KaliMetal/contents/images/3840x2160.jpg"

qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript 'var allDesktops = desktops();print (allDesktops);for (i=0;i<allDesktops.length;i++) {d = allDesktops[i];d.wallpaperPlugin = "org.kde.image";d.currentConfigGroup = Array("Wallpaper", "org.kde.image", "General");d.writeConfig("Image", "file://'$WALLPAPER_PATH'")}'
