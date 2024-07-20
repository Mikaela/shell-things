#!/usr/bin/env bash

# This is all adapted from /usr/share/doc/darkman/examples/dark-mode.d/

# Notify of light theme switch
(notify-send --app-name="darkman" --urgency=low --icon=moon-phase-full "Moonlights" &)

# GTK Theme
(gsettings set org.gnome.desktop.interface gtk-theme Breeze-Dark &)
(dbus-send --session --dest=org.kde.GtkConfig --type=method_call /GtkConfig org.kde.GtkConfig.setGtkTheme "string:Breeze" &)

# Xfce theme?
(exec xfconf-query -c xsettings -p /Net/ThemeName -s 'Breeze' &)

# Plasma
(lookandfeeltool --apply "org.kde.breezedark.desktop" &)
