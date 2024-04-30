#!/usr/bin/env bash
set -x

# I just had a feeling I should also have a quick script to quickly restore
# systemd-resolved handling of the file.

# I know there are old versions that used something else, but I don't remember
# that name and they are ancient.
if ! hash resolvectl 2>/dev/null; then
	echo "You don't seem to have systemd-resolved (or resolvectl) installed." 1>&2
	exit 1
fi

# Require root or exit
if [ "$(id -u)" != "0" ]; then
	echo "This script requires root." 1>&2
	exit 1
fi

# It's pointless to make a dead symlink as it must be running
systemctl enable --now systemd-resolved.service

# In case I am behind the /etc/resolv.conf, it's immutable and read-only,
# which won't allow it to be rewritten.
chattr -V -i /etc/resolv.conf
chmod -v +w /etc/resolv.conf

# It must be removed if it's not a symlink
rm -v /etc/resolv.conf

# and finally making the symlink
ln -sfv /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

# Let's just see it's ok
ls -l /etc/resolv.conf
cat /etc/resolv.conf

set +x
