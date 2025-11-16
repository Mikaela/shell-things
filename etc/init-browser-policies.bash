#!/usr/bin/env bash
# This script will create the direcories or symlinks that browsers look for
# their policies. The user is trusted to setup those manually.
set -x

# Require root or exit
if [ "$(id -u)" != "0" ]; then
	echo "This script requires root for managing /etc/..."

	# Firefox Flatpak
	mkdir -vp "$HOME/.local/share/flatpak/extension/org.mozilla.firefox.systemconfig/$(uname -m)/stable/policies/"
	mkdir -vp "$HOME/.local/share/flatpak/extension/org.mozilla.firefox.systemconfig/$(uname -m)/beta/policies/"
	cp -v firefox/policies/policies.json "$HOME/.local/share/flatpak/extension/org.mozilla.firefox.systemconfig/$(uname -m)/stable/policies/"
	cp -v firefox/policies/policies.json "$HOME/.local/share/flatpak/extension/org.mozilla.firefox.systemconfig/$(uname -m)/beta/policies/"

	# Chromium Flatpak
	mkdir -vp "$HOME/.local/share/flatpak/extension/org.chromium.Chromium.Extension.system-policies/$(uname -m)/1/managed"
	mkdir -vp "$HOME/.local/share/flatpak/extension/org.chromium.Chromium.Extension.system-policies/$(uname -m)/1/recommended"

	# Chrome Flatpak
	mkdir -vp "$HOME/.local/share/flatpak/extension/com.google.Chrome.Extension.system-policies/$(uname -m)/1/managed"
	mkdir -vp "$HOME/.local/share/flatpak/extension/com.google.Chrome.Extension.system-policies/$(uname -m)/1/recommended"

	echo "...but flatpaks were more or less handled."
	exit 0
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
setfacl --recursive --modify=u:root:rwX,g:root:rwX,o:rX /etc/firefox/policies
chmod -v a+rx /etc/firefox/
chmod -v a+rx /etc/firefox/policies/
#touch /etc/firefox/policies/policies.json
cp -v firefox/policies/policies.json /etc/firefox/policies/policies.json
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
cp opt/chromium/policies/managed/aminda-{extensions,pwa}.json /etc/opt/chromium/policies/managed/
setfacl --recursive --modify=u:root:rwX,g:root:rwX,o:rX /etc/opt/chromium/policies
chmod -v a+rx /etc/opt/chromium/policies/
chmod -v a+rx /etc/opt/chromium/policies/{managed,recommended}/
# Chromium snap
mkdir -p /etc/chromium-browser
setfacl --recursive --modify=u:root:rwX,g:root:rwX,o:rX /etc/chromium-browser
ln -nsfv /etc/opt/chromium/policies /etc/chromium-browser/policies

# Brave
mkdir -p /etc/brave
setfacl --recursive --modify=u:root:rwX,g:root:rwX,o:rX /etc/brave
ln -nsfv /etc/opt/chromium/policies /etc/brave/policies

# Fedora chromium package and for some reason Vivaldi
if [ -d /usr/etc ]; then
	echo "We may be on Fedora Atomic, time for the next if to not break things..."
	if [ -d /usr/etc/chromium ]; then
		cp --verbose --recursive --update /usr/etc/chromium/ --target-directory=/etc/
		cp -v /etc/opt/chromium/policies/managed/*.json /etc/chromium/policies/managed/
		cp -v /etc/opt/chromium/policies/recommended/*.json /etc/chromium/policies/recommended/
		setfacl --recursive --modify=u:root:rwX,g:root:rwX,o:rX /etc/chromium
	fi
# if we are not on Fedora Atomic, this won't break things.
else
	mkdir -p /etc/chromium
	setfacl --recursive --modify=u:root:rwX,g:root:rwX,o:rX /etc/chromium
	ln -nsfv /etc/opt/chromium/policies /etc/chromium/policies
fi

# Google Chrome
mkdir -p /etc/opt/chrome
setfacl --recursive --modify=u:root:rwX,g:root:rwX,o:rX /etc/opt/chrome
ln -nsfv /etc/opt/chromium/policies /etc/opt/chrome/policies

# Naggig suspicion of another Google Chrome
mkdir -p /etc/chrome
setfacl --recursive --modify=u:root:rwX,g:root:rwX,o:rX /etc/chrome
ln -nsfv /etc/opt/chromium/policies /etc/chrome/policies

# Microsoft Edge
# I used to have a separate policy for it so remember to remove this manually
# if it exists!
mkdir -p /etc/opt/edge
setfacl --recursive --modify=u:root:rwX,g:root:rwX,o:rX /etc/opt/edge
ln -nsfv /etc/opt/chromium/policies /etc/opt/edge/policies

# Firefox Flatpak
mkdir -vp "/var/lib/flatpak/extension/org.mozilla.firefox.systemconfig/$(uname -m)/stable/policies/"
mkdir -vp "/var/lib/flatpak/extension/org.mozilla.firefox.systemconfig/$(uname -m)/beta/policies/"
#cp -v /etc/firefox/policies/policies.json "/var/lib/flatpak/extension/org.mozilla.firefox.systemconfig/$(uname -m)/stable/policies/"
#cp -v /etc/firefox/policies/policies.json "/var/lib/flatpak/extension/org.mozilla.firefox.systemconfig/$(uname -m)/beta/policies/"
cp -v firefox/policies/policies.json "/var/lib/flatpak/extension/org.mozilla.firefox.systemconfig/$(uname -m)/stable/policies/"
cp -v firefox/policies/policies.json "/var/lib/flatpak/extension/org.mozilla.firefox.systemconfig/$(uname -m)/beta/policies/"

# Firefox flatpak autoconfig
cp -v ../conf/autoconfig.js.online /var/lib/flatpak/app/org.mozilla.firefox/current/active/files/lib/firefox/defaults/pref/autoconfig.js
#cp -v ../conf/firefox-forbidden-policies.js /var/lib/flatpak/app/org.mozilla.firefox/current/active/files/lib/firefox/
chmod -v a+r /var/lib/flatpak/app/org.mozilla.firefox/current/active/files/lib/firefox/defaults/pref/autoconfig.js
chmod -v a+r /var/lib/flatpak/app/org.mozilla.firefox/current/active/files/lib/firefox/firefox-forbidden-policies.js

# Chromium Flatpak
mkdir -vp "/var/lib/flatpak/extension/org.chromium.Chromium.Extension.system-policies/$(uname -m)/1/"
cp -rv /etc/opt/chromium/policies/ "/var/lib/flatpak/extension/org.chromium.Chromium.Extension.system-policies/$(uname -m)/1/"

# Chrome Flatpak
mkdir -vp "/var/lib/flatpak/extension/com.google.Chrome.Extension.system-policies/$(uname -m)/1/"
cp -rv /etc/opt/chromium/policies/ "/var/lib/flatpak/extension/com.google.Chrome.Extension.system-policies/$(uname -m)/1/"

set +x
