#!/usr/bin/env bash

. ~/.local/share/dark-mode.d/00-do-not-repeat-yourself.bash

# This is all adapted from /usr/share/doc/darkman/examples/dark-mode.d/

# GTK Theme
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
#gsettings set org.gnome.desktop.interface gtk-theme Adwaita
#dbus-send --session --dest=org.kde.GtkConfig --type=method_call /GtkConfig org.kde.GtkConfig.setGtkTheme "string:Adwaita"
gsettings set org.gnome.desktop.interface gtk-theme Breeze-Dark
dbus-send --session --dest=org.kde.GtkConfig --type=method_call /GtkConfig org.kde.GtkConfig.setGtkTheme "string:Breeze-Dark"
# Xfce theme?e
#xfconf-query --channel xsettings --create --type string --property /Net/ThemeName --set Adwaita
xfconf-query --channel xsettings --create --type string --property /Net/ThemeName --set Breeze-Dark

# Plasma
lookandfeeltool --platform offscreen --apply "org.kde.breezedark.desktop"

# Kvantum Qt
#kvantummanager --set KvGnomeDark --noAssign-All
