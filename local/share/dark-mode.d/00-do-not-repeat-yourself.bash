#!/usr/bin/env bash

set -x

if ! hash lsb_release 2> /dev/null; then
	ERRORMESSAGE="lsb_release was not found, the wallpaper scripts cannot figure out the distribution"
	echo "$ERRORMESSAGE"
	notify-send --app-name=darkman --icon=error "$ERRORMESSAGE"
	exit 0
fi

#if ! hash kvantummanager 2> /dev/null; then
#	ERRORMESSAGE="kvantummanager wasn't found, Qt theme switching won't work!"
#	echo "$ERRORMESSAGE"
#	notify-send --app-name="darkman" --icon=error "$ERRORMESSAGE"
#	exit 0
#fi

export DISTROID="$(lsb_release -si)"
export DISTROREL="$(lsb_release -sr)"

export DARKMANGET="$(darkman get)"

printf "Distribution: $DISTROID\nRelease: $DISTROREL\nMode: $DARKMANGET\n"

if [[ "$DARKMANGET" -eq "dark" ]]; then
	(notify-send --app-name="darkman" --urgency=low --icon=weather-clear-night "Teema: $DARKMANGET" &)
elif [[ "$DARKMANGET" -eq "light" ]]; then
	(notify-send --app-name="darkman" --urgency=low --icon=weather-clear "Teema: $DARKMANGET" &)
else
	ERRORMESSAGE="Something went wrong?"
	echo "$ERRORMESSAGE"
	notify-send --app-name="darkman" --icon=error "$ERRORMESSAGE"
fi

#if [[ "$QT_STYLE_OVERRIDE" != "kvantum" ]]; then
#	ERRORMESSAGE="\$QT_STYLE_OVERRIDE is not 'kvantum', Qt theme switching has no effect!"
#	echo $ERRORMESSAGE
#	notify-send --app-name="darkman" --icon=error "$ERRORMESSAGE"
#	exit 0
#fi
