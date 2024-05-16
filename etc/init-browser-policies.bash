#!/usr/bin/env bash
# This script will create the direcories or symlinks that browsers look for
# their policies. The user is trusted to setup those manually.
set -x

# Require root or exit
if [ "$(id -u)" != "0" ]; then
	echo "This script requires root for managing /etc/" 1>&2
	exit 1
fi

# Firefox and LibreWolf (caution! https://codeberg.org/librewolf/issues/issues/1767)
mkdir -vp /etc/firefox/policies
chmod -v a+rx /etc/firefox/
chmod -v a+rx /etc/firefox/policies/
touch /etc/firefox/policies/policies.json
chmod -v a+r /etc/firefox/policies/policies.json
printf "WARNING! LibreWolf default profile may be masked!\nhttps://codeberg.org/librewolf/issues/issues/1767\n"

# Firefox ESR
ln -sfv /etc/firefox /etc/firefox-esr
rm -fv /etc/firefox-esr/firefox-esr

# Chromium
mkdir -vp /etc/opt/chromium/policies/managed
chmod -v a+rx /etc/opt/chromium/policies/
mkdir -vp /etc/opt/chromium/policies/recommended
chmod -v a+rx /etc/opt/chromium/policies/{managed,recommended}/

# Brave
ln -sfv /etc/opt/chromium /etc/brave
rm -fv /etc/brave/brave

# Vivaldi
ln -sfv /etc/opt/chromium /etc/chromium
rm -fv /etc/chromium/chromium

# Google Chrome
ln -sfv /etc/opt/chromium /etc/opt/chrome
rm -fv /etc/etc/opt/chrome/chrome

# Microsoft Edge
# I used to have a separate policy for it so remember to remove this manually
# if it exists!
ln -sfv /etc/opt/chromium /etc/opt/edge
rm -fv /etc/opt/edge/edge

set +x
