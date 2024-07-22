#!/usr/bin/env bash

. ~/.local/share/dark-mode.d/00-do-not-repeat-yourself.bash

# This is all adapted from /usr/share/doc/darkman/examples/light-mode.d/

# GTK Theme
(gsettings set org.gnome.desktop.interface color-scheme 'prefer-light' &)
(gsettings set org.gnome.desktop.interface gtk-theme Breeze &)
(dbus-send --session --dest=org.kde.GtkConfig --type=method_call /GtkConfig org.kde.GtkConfig.setGtkTheme "string:Breeze" &)

# Xfce theme?
(xfconf-query --channel xsettings --create --type string --property /Net/ThemeName --set Breeze &)

# Plasma
(lookandfeeltool --apply "org.kde.breeze.desktop" &)

# Kvantum Qt
#(sleep 3 && kvantummanager --set KvGnome --noAssign-All &)
