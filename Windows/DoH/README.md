# DNS over HTTPS in Windows 11

Requires Windows 11.

* `GPO-EnforceDoH.reg` enables the group policy to require DoH. However it
  didn't seem to work for me or it allowed me to set the DNS server to not
  use DoH.

* `DohWellKnownServers` adds DoH support for multiple IPv4 & IPv6 addresses
  that Windows 11 isn't shipping by default, currently:
  * Mullvad
  * Adguard
  * Quad9 ECS (Windows 11 defaults include Quad9 default)
