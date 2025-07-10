#!/usr/bin/env bash

set -x

if [ -f /etc/os-release ]; then
	. /etc/os-release
fi

export DARKMANGET="$(darkman get)"

printf "Distribution: $ID\nRelease: $VERSION_ID\nMode: $DARKMANGET\n"

if [[ "$DARKMANGET" -eq "light" ]]; then
	notify-send --app-name="darkman" --urgency=low --icon=weather-clear-night "Teema: $DARKMANGET"
elif [[ "$DARKMANGET" -eq "dark" ]]; then
	notify-send --app-name="darkman" --urgency=low --icon=weather-clear "Teema: $DARKMANGET"
else
	ERRORMESSAGE="Something went wrong?"
	echo "$ERRORMESSAGE"
	notify-send --app-name="darkman" --icon=error "$ERRORMESSAGE"
fi

if hash qdbus-qt6 2> /dev/null; then
	QTDBUSBIN=qdbus-qt6
elif hash qdbus6 2> /dev/null; then
	QTDBUSBIN=qdbus6
else
	QTDBUSBIN=qdbus
fi
