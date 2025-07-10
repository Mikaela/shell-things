#!/usr/bin/env bash

. ~/.local/share/dark-mode.d/00-do-not-repeat-yourself.bash

if [[ -f $HOME/.local/share/darkman-brightness.txt ]]; then
	$QTDBUSBIN org.kde.Solid.PowerManagement /org/kde/Solid/PowerManagement/Actions/BrightnessControl org.kde.Solid.PowerManagement.Actions.BrightnessControl.setBrightness $(head -n1 $HOME/.local/share/darkman-brightness.txt)
fi
