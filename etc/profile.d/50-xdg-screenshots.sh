# This script currently sets just the xdg screenshots directory, while I am
# unsure of whether anything else than grimshot utilizes it.

# WARNING: my train of thought got disturbed writing this and I lost the red
# thread of what the fluff was I doing again.

if [ $(hash xdg-user-dir 2> /dev/null) ] && [ $(hash xdg-user-dir-update 2> /dev/null) ]; then
	echo "50-xdg-screenshots.sh ok" > /dev/null 2>&1
fi

if [[ $(xdg-user-dir SCREENSHOTS) != $(xdg-user-dir) ]]; then
	echo "50-xdg-screenshots.sh ok" > /dev/null 2>&1
fi

# Check if the user has a locale preference
XDGLOCALE="$(cat $(xdg-user-dir)/.config/user-dirs.locale)"

# If the user wants Finnish, then let's respect that...
if [[ "$XDGLOCALE" == "fi" || "$XDGLOCALE" == "fi_FI" ]]; then
	xdg-user-dirs-update --set SCREENSHOTS $(xdg-user-dir PICTURES)/Kuvakaappaukset
# ...otherwise English it is.
else
	xdg-user-dirs-update --set SCREENSHOTS $(xdg-user-dir PICTURES)/Screenshots
fi

mkdir -p "$(xdg-user-dir SCREENSHOTS)"
