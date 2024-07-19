#!/usr/bin/env bash

# KDE's default terminal emulator supports profiles, you can create one in
# Settings > Manage Profiles. You can select a dark or light theme in
# Appearance > Color scheme and font. The following script iterates over all
# instances of Konsole und changes the profile of all sessions. This is necessary,
# if there are multiple tabs in one of the Konsole instances.
# Reference: https://docs.kde.org/stable5/en/konsole/konsole/konsole.pdf

PROFILE='Kali-Light'

# loop over all running konsole instances
for pid in $(pidof konsole); do
	# TODO: loop over all windows of the instance, instead of only the first

	# loop over all sessions in the current window
	for session in $(qdbus "org.kde.konsole-$pid" /Windows/1 sessionList); do
		# change profile through dbus message
		qdbus "org.kde.konsole-$pid" "/Sessions/$session" setProfile "$PROFILE"
	done
done
