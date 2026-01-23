#!/usr/bin/env bash
set -x

# This is otherwise the same as resolv.conf-generate.bash, but only adds
# systemd-resolved as a DNS server. And then it also took parts of the
# restore script.

if [[ -d /sysroot/ostree ]]; then
	echo "Let's not mess up with Fedora Atomic. Try \$RES_OPTIONS instead? In profile.d?"
	exit 1
fi

# I know there are old versions that used something else, but I don't remember
# that name and they are ancient.
if ! hash resolvectl 2> /dev/null; then
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
printf 'nameserver 127.0.0.53\nnameserver 127.0.0.53\nnameserver 127.0.0.53\nsearch .\noptions timeout:1 attempts:5 rotate edns0 trust-ad\n' | tee -p /etc/resolv.conf

# Are we on Fedora Atomic?
if [[ -d /sysroot/ostree ]]; then
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
