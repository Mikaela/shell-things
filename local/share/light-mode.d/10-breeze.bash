#!/usr/bin/env bash

# This is all adapted from /usr/share/doc/darkman/examples/light-mode.d/

# GTK Theme
(gsettings set org.gnome.desktop.interface color-scheme 'prefer-light' &)
(gsettings set org.gnome.desktop.interface gtk-theme Breeze &)
(dbus-send --session --dest=org.kde.GtkConfig --type=method_call /GtkConfig org.kde.GtkConfig.setGtkTheme "string:Breeze" &)

# Xfce theme?
(exec xfconf-query -c xsettings -p /Net/ThemeName -s 'Breeze' &)

# Plasma
(lookandfeeltool --apply "org.kde.breeze.desktop" &)
