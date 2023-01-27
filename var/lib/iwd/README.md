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
* `private-home-sample.psk` has a comment on MAC address override and sends
   hostname with IPv4 DHCP. `private-cafe-sample.psk` always randomizes MAC
   address and doesn't send hostname.
* The `.open` networks always randomize MAC address too. If a network is
  private and needs MAC address for captive portal override or something,
  `private-home-sample.psk` should be adjusted from.
