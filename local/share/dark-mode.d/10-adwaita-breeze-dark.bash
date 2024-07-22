#!/usr/bin/env bash

. ~/.local/share/dark-mode.d/00-do-not-repeat-yourself.bash

# This is all adapted from /usr/share/doc/darkman/examples/dark-mode.d/

# GTK Theme
(sleep 3 && gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark' &)
(sleep 1 && gsettings set org.gnome.desktop.interface gtk-theme Breeze &)
(sleep 2 && gsettings set org.gnome.desktop.interface gtk-theme Breeze-dark &)
(sleep 1 && dbus-send --session --dest=org.kde.GtkConfig --type=method_call /GtkConfig org.kde.GtkConfig.setGtkTheme "string:Breeze" &)
(sleep 2 && dbus-send --session --dest=org.kde.GtkConfig --type=method_call /GtkConfig org.kde.GtkConfig.setGtkTheme "string:Breeze-dark" &)

# Xfce theme?
(sleep 1 && xfconf-query --channel xsettings --create --type string --property /Net/ThemeName --set Breeze &)
(sleep 2 && xfconf-query --channel xsettings --create --type string --property /Net/ThemeName --set Breeze-dark &)

# Plasma
(lookandfeeltool --apply "org.kde.breezedark.desktop" &)

# Kvantum Qt
#(sleep 3 && kvantummanager --set KvGnomeDark --noAssign-All &)
