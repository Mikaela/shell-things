#!/usr/bin/env bash

# This is all adapted from /usr/share/doc/darkman/examples/dark-mode.d/

# GTK Theme
(gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark' &)
(gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark &)
(dbus-send --session --dest=org.kde.GtkConfig --type=method_call /GtkConfig org.kde.GtkConfig.setGtkTheme "string:Adwaita-dark" &)

# Xfce theme?
(xfconf-query --channel xsettings --create --type string --property /Net/ThemeName --set Adwaita-dark &)

# Plasma
(lookandfeeltool --apply "org.kde.breezedark.desktop" &)
