#!/usr/bin/env bash
# This script will create the direcories or symlinks that browsers look for
# their policies. The user is trusted to setup those manually.
set -x

# Firefox and LibreWolf (caution! https://codeberg.org/librewolf/issues/issues/1767)
mkdir -p /etc/firefox/policies
#touch /etc/firefox/policies/policies.json

# Chromium
mkdir -p /etc/opt/chromium/policies/managed

# Brave
ln -s /etc/opt/chromium /etc/brave

# Vivaldi
ln -s /etc/opt/chromium /etc/chromium

# Google Chrome
ln -s /etc/opt/chromium /etc/opt/chrome

# Microsoft Edge
ln -s /etc/opt/chromium /etc/opt/edge

set +x
