#!/usr/bin/env bash

# This script should resolve SELINUX warnings about NetworkManager not
# permitted to unlink files.

set -x
find /var/lib/iwd/*.{psk,open} -exec semanage fcontext -a -t NetworkManager_etc_rw_t '{}' \;
set +x
