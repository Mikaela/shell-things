#!/usr/bin/env bash
# This script will create the direcories or symlinks that browsers look for
# their policies. The user is trusted to setup those manually.
set -x

# Require root or exit
if [ "$(id -u)" != "0" ]; then
	echo "This script requires root for managing /etc/" 1>&2
	exit 1
fi

# TODO: Snap based browsers or at least Firefox can supposedly run with less
# snap sandboxing. Consider these if need arises:
# sudo snap set firefox confinement=classic
# https://bugs.launchpad.net/snapd/+bug/1972762
# sudo snap connect {firefox,chromium,vivaldi}:pcscd
#
# OFFTOPIC TODO: more flatseal style management is coming, consider
# snap refresh snapd --channel=candidate
# snap install desktop-security-center
# snap install prompting-client
# https://discourse.ubuntu.com/t/ubuntu-desktop-s-24-10-dev-cycle-part-5-introducing-permissions-prompting/47963?p-119405-enabling-the-feature

# Firefox and LibreWolf (caution! https://codeberg.org/librewolf/issues/issues/1767)
mkdir -vp /etc/firefox/policies
setfacl --recursive --modify=u:root:rwX,o:rX /etc/firefox/policies
chmod -v a+rx /etc/firefox/
chmod -v a+rx /etc/firefox/policies/
touch /etc/firefox/policies/policies.json
chmod -v a+r /etc/firefox/policies/policies.json
printf "WARNING! LibreWolf default profile may be masked!\nhttps://codeberg.org/librewolf/issues/issues/1767\n"

# Note to self on ln:
# -s is obviously symbolic link.
# -n will not follow symlink if it's a directory stopping the symlinks.
#    pointing to the directory containing them.
# -v is obviously verbose.
# -f is obviously force so there won't be error message about it already
#    existing.

# Firefox ESR
ln -nsfv /etc/firefox /etc/firefox-esr

# Chromium
mkdir -vp /etc/opt/chromium/policies/{managed,recommended}
setfacl --recursive --modify=u:root:rwX,o:rX /etc/opt/chromium/policies
chmod -v a+rx /etc/opt/chromium/policies/
chmod -v a+rx /etc/opt/chromium/policies/{managed,recommended}/
# Chromium snap
mkdir -p /etc/chromium-browser
setfacl --recursive --modify=u:root:rwX,o:rX /etc/chromium-browser
ln -nsfv /etc/opt/chromium/policies /etc/chromium-browser/policies

# Brave
mkdir -p /etc/brave
setfacl --recursive --modify=u:root:rwX,o:rX /etc/brave
ln -nsfv /etc/opt/chromium/policies /etc/brave/policies

# Vivaldi
mkdir -p /etc/chromium
setfacl --recursive --modify=u:root:rwX,o:rX /etc/chromium
ln -nsfv /etc/opt/chromium/policies /etc/chromium/policies

# Google Chrome
mkdir -p /etc/opt/chrome
setfacl --recursive --modify=u:root:rwX,o:rX /etc/opt/chrome
ln -nsfv /etc/opt/chromium/policies /etc/opt/chrome/policies

# Naggig suspicion of another Google Chrome
mkdir -p /etc/chrome
setfacl --recursive --modify=u:root:rwX,o:rX /etc/chrome
ln -nsfv /etc/opt/chromium/policies /etc/chrome/policies

# Microsoft Edge
# I used to have a separate policy for it so remember to remove this manually
# if it exists!
mkdir -p /etc/opt/edge
setfacl --recursive --modify=u:root:rwX,o:rX /etc/opt/edge
ln -nsfv /etc/opt/chromium/policies /etc/opt/edge/policies

# Flatpak
mkdir -vp "/var/lib/flatpak/extension/org.mozilla.firefox.systemconfig/$(uname -m)/stable/policies/"
mkdir -vp "/var/lib/flatpak/extension/org.mozilla.firefox.systemconfig/$(uname -m)/beta/policies/"
cp -v /etc/firefox/policies/policies.json "/var/lib/flatpak/extension/org.mozilla.firefox.systemconfig/$(uname -m)/stable/policies/"
cp -v /etc/firefox/policies/policies.json "/var/lib/flatpak/extension/org.mozilla.firefox.systemconfig/$(uname -m)/beta/policies/"

# # Firefox Stable
# mkdir -vp "/var/lib/flatpak/extension/org.mozilla.firefox.systemconfig/$(uname -m)/stable/defaults/pref"
# cp -v ../conf/autoconfig.js "/var/lib/flatpak/extension/org.mozilla.firefox.systemconfig/$(uname -m)/stable/defaults/pref/"
# cp -v ../conf/firefox-forbidden-policies.js "/var/lib/flatpak/extension/org.mozilla.firefox.systemconfig/$(uname -m)/stable/"
# setfacl --recursive --modify=u:root:rwX,o:rX "/var/lib/flatpak/extension/org.mozilla.firefox.systemconfig/$(uname -m)/stable/"
# chmod -v a+rx "/var/lib/flatpak/extension/org.mozilla.firefox.systemconfig/$(uname -m)/stable/"
# chmod -v a+rx "/var/lib/flatpak/extension/org.mozilla.firefox.systemconfig/$(uname -m)/stable/defaults"
# chmod -v a+rx "/var/lib/flatpak/extension/org.mozilla.firefox.systemconfig/$(uname -m)/stable/defaults/pref"
# chmod -v a+r "/var/lib/flatpak/extension/org.mozilla.firefox.systemconfig/$(uname -m)/stable/defaults/pref/autoconfig.js"
#
# # Firefox Beta
# mkdir -vp "/var/lib/flatpak/extension/org.mozilla.firefox.systemconfig/$(uname -m)/beta/defaults/pref"
# cp -v ../conf/autoconfig.js "/var/lib/flatpak/extension/org.mozilla.firefox.systemconfig/$(uname -m)/beta/defaults/pref/"
# cp -v ../conf/firefox-forbidden-policies.js "/var/lib/flatpak/extension/org.mozilla.firefox.systemconfig/$(uname -m)/beta/"
# setfacl --recursive --modify=u:root:rwX,o:rX "/var/lib/flatpak/extension/org.mozilla.firefox.systemconfig/$(uname -m)/beta/"
# chmod -v a+rx "/var/lib/flatpak/extension/org.mozilla.firefox.systemconfig/$(uname -m)/beta/"
# chmod -v a+rx "/var/lib/flatpak/extension/org.mozilla.firefox.systemconfig/$(uname -m)/beta/defaults"
# chmod -v a+rx "/var/lib/flatpak/extension/org.mozilla.firefox.systemconfig/$(uname -m)/beta/defaults/pref"
# chmod -v a+r "/var/lib/flatpak/extension/org.mozilla.firefox.systemconfig/$(uname -m)/beta/defaults/pref/autoconfig.js"

set +x
