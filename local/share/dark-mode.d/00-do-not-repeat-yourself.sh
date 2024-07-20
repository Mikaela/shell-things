if ! hash lsb_release 2> /dev/null; then
	ERRORMESSAGE="lsb_release was not found, the wallpaper scripts cannot figure out the distribution"
	echo $ERRORMESSAGE
	#notify-send $ERRORMESSAGE
	exit 0
fi

export DISTROID=$(lsb_release -si)
export DISTROREL=$(lsb_release -sr)

export DARKMANGET=$(darkman get)

printf "Distribution: $DISTROID\nRelease: $DISTROREL\nMode: $DARKMANGET\n"

if [[ "$DARKMANGET" == "dark" ]]; then
	(notify-send --app-name="darkman" --urgency=low --icon=weather-clear-night "Teema: $DARKMANGET" &)
elif [[ "$DARKMANGET" == "light" ]]; then
	(notify-send --app-name="darkman" --urgency=low --icon=weather-clear "Teema: $DARKMANGET" &)
else
	echo "darkman: Something went wrong?"
fi
