iwd network configuration lives in this directory

See also `../../../etc/iwd/main.conf` especially in standalone iwd without
NetworkManager.

Notes:

* `Settings.AutoConnect=true` is unnecessary as it defaults to true
  according to `man iwd.network`.
* `IPv6.Enabled=true` defauls to true being also unnecessary.
