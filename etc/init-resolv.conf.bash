#!/usr/bin/env bash
set -x

# Require root or exit
if [ "$(id -u)" != "0" ]; then
	echo "This script requires root." 1>&2
	exit 1
fi

# Tell NetworkManager to not touch resolv.conf
if [ -d /etc/NetworkManager ]; then
	mkdir -p /etc/NetworkManager/conf.d/
	printf '[main]\ndns=none\n' | tee -p /etc/NetworkManager/conf.d/99-paws-off-resolv.conf
fi

# In case I am behind the /etc/resolv.conf, it may be immutable and
# read-only, which won't allow it to be rewritten.
chattr -V -i /etc/resolv.conf
chmod -v +w /etc/resolv.conf
# Or it's a symlink to e.g. /run/systemd/resolve/stub-resolv.conf
rm -v /etc/resolv.conf

# Actual resolv.conf creation. OK, this could read resolv.conf in this
# directory, but I like this being self-contained.
# tee -p = operate in a more appropriate MODE with pipes.
# As per `man resolv.conf`, no `nameserver` means local resolver
printf 'search .\noptions attempts:5 edns0 trust-ad\n' | tee -p /etc/resolv.conf

# Allow everyone to read /etc/resolv.conf
chmod -v a+r /etc/resolv.conf

# In case systemd exists, configure appropiately
if hash systemctl 2> /dev/null; then
	# so it will know to not touch resolv.conf as configured earlier
	systemctl reload NetworkManager.service
	systemctl disable --now systemd-resolved.service {systemd-resolved-monitor,systemd-resolved-varlink}.socket
	systemctl mask systemd-resolved.service
fi

# Let's just see it's ok
ls -l /etc/resolv.conf
cat /etc/resolv.conf

set +x
