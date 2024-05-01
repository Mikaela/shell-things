#!/usr/bin/env bash
set -x

# This is otherwise the same as resolv.conf-generate.bash, but only adds
# systemd-resolved as a DNS server. And then it also took parts of the
# restore script.

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

# It's pointless to point at the service if it's not running.
systemctl enable --now systemd-resolved.service

# In case I am behind the /etc/resolv.conf, it's immutable and read-only,
# which won't allow it to be rewritten.
chattr -V -i /etc/resolv.conf
chmod -v +w /etc/resolv.conf
# Or it's a symlink to e.g. /run/systemd/resolve/stub-resolv.conf
rm -v /etc/resolv.conf

# tee -p = operate in a more appropriate MODE with pipes.
printf 'nameserver 127.0.0.53\nnameserver 127.0.0.53\nnameserver 127.0.0.53\noptions edns0 trust-ad timeout:2 attempts:2 rotate\nsearch .\n' | tee -p /etc/resolv.conf

# Remove all other permissions than everyone reading resolv.conf
chmod -v a=r /etc/resolv.conf
# Make resolv.conf immutable again so it's pretty sure nothing else edits it.
chattr -V +i /etc/resolv.conf

# Let's just see it's ok
ls -l /etc/resolv.conf
cat /etc/resolv.conf

set +x
