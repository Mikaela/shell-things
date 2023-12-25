#!/usr/bin/env bash
# This is a simple script to mask services in conflict with tlp

set -x
# and when doing that, why not enable tlp?
tlp start
tlp-rdw enable
# The service is only meant for boot so no starting now
systemctl enable tlp.service

# Stop the services if they are running
systemctl disable --quiet --now power-profiles-daemon.service
systemctl disable --quiet --now systemd-rfkill.service

# Actual masking
systemctl mask power-profiles-daemon.service
systemctl mask systemd-rfkill.service systemd-rfkill.socket

# In case this script is ran multiple times in succession like when I did
# when writing it
systemctl daemon-reload

set +x
