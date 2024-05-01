#!/usr/bin/env bash
set -x

# Require root or exit
if [ "$(id -u)" != "0" ]; then
	echo "This script requires root." 1>&2
	exit 1
fi

# In case I am behind the /etc/resolv.conf, it's immutable and read-only,
# which won't allow it to be rewritten.
chattr -V -i /etc/resolv.conf
chmod -v +w /etc/resolv.conf
# Or it's a symlink to e.g. /run/systemd/resolve/stub-resolv.conf
rm -v /etc/resolv.conf

# Actual resolv.conf creation. OK, this could read resolv.conf in this
# directory, but I like this being self-contained.
# tee -p = operate in a more appropriate MODE with pipes.
printf 'nameserver ::1\nnameserver 127.0.0.1\nnameserver 127.0.0.53\noptions edns0 trust-ad timeout:2 attempts:2 rotate\nsearch .\n' | tee -p /etc/resolv.conf

# Remove all other permissions than everyone reading resolv.conf
chmod -v a=r /etc/resolv.conf
# Make resolv.conf immutable again so it's pretty sure nothing else edits it.
chattr -V +i /etc/resolv.conf

# Let's just see it's ok
ls -l /etc/resolv.conf
cat /etc/resolv.conf

set +x
