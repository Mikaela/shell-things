#!/usr/bin/env bash

# This script should resolve SELINUX warnings about NetworkManager not
# permitted to unlink files.

set -x
for targetfile in $(find /var/lib/iwd/*.{psk,open}); do
	semanage fcontext -a -t NetworkManager_etc_rw_t $targetfile
done
set +x
