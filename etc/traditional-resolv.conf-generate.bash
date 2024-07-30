#!/usr/bin/env bash
set -x

# Require root or exit
if [ "$(id -u)" != "0" ]; then
	echo "This script requires root. (And the 3 nameserver IPs as arguments)" 1>&2
	exit 1
fi

# Three arguments or quit.
if [ $# -ne 3 ]; then
	echo "This script requires three arguments that will be passed as nameservers."
	exit 1
fi

# In case I am behind the /etc/resolv.conf, it's immutable and read-only,
# which won't allow it to be rewritten.
chattr -V -i /etc/resolv.conf
chmod -v +w /etc/resolv.conf
# Or it's a symlink to e.g. /run/systemd/resolve/stub-resolv.conf
rm -v /etc/resolv.conf

# No trust-ad here as chances are these resolvers are unencrypted and the
# path to them isn't trusted.
# tee -p = operate in a more appropriate MODE with pipes.
printf "nameserver %b\nnameserver %b\nnameserver %b\nsearch .\noptions timeout:1 attempts:5 rotate edns0\n" "$1" "$2" "$3" | tee -p /etc/resolv.conf

# Remove all other permissions than everyone reading resolv.conf
chmod -v a=r /etc/resolv.conf
# Make resolv.conf immutable again so it's pretty sure nothing else edits it.
chattr -V +i /etc/resolv.conf

# Let's just see it's ok
ls -l /etc/resolv.conf
cat /etc/resolv.conf

set +x
