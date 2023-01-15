iwd network configuration lives in this directory

See also `../../../etc/iwd/main.conf` especially in standalone iwd without
NetworkManager.

Notes:

* `git commit`ing the same SSID with different capitalisations breaks
  Windows and more common macOS setups due to their filesystems being
  case-insensitive.
* `Settings.AutoConnect=true` is unnecessary as it defaults to true
  according to `man iwd.network`.
* `IPv6.Enabled=true` defauls to true being also unnecessary.
