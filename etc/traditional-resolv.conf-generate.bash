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

# trust-ad is here, because are you really going to use untrusted remote resolvers?
# tee -p = operate in a more appropriate MODE with pipes.
printf "nameserver %b\nnameserver %b\nnameserver %b\nsearch .\noptions timeout:1 attempts:5 rotate edns0 trust-ad\n" "$1" "$2" "$3" | tee -p /etc/resolv.conf

# Are we on Fedora Atomic?
if [[ ! -d /sysroot/ostree ]]; then
	# Remove all other permissions than everyone reading resolv.conf
	chmod -v a=r /etc/resolv.conf
	# Make resolv.conf immutable again so it's pretty sure nothing else edits it
	chattr -V +i /etc/resolv.conf
else
	# We are on Fedora Atomic and thus won't want to cause additional errors
	chmod -v 0644 /sysroot/ostree/deploy/fedora/deploy/*/etc/resolv.conf | true
	chmod -v 0644 /sysroot/ostree/repo/extensions/rpmostree/private/commit/usr/etc/resolv.conf | true
	chattr -V -i /sysroot/ostree/deploy/fedora/deploy/*/etc/resolv.conf | true
	chattr -V -i /sysroot/ostree/repo/extensions/rpmostree/private/commit/usr/etc/resolv.conf | true
fi

# Let's just see it's ok
ls -l /etc/resolv.conf
cat /etc/resolv.conf

set +x
