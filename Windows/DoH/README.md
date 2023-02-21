# DNS over HTTPS in Windows 11

Requires Windows 11.

- `GPO-EnforceDoH.reg` enables the group policy to require DoH. However it
	didn't seem to work for me or it allowed me to set the DNS server to not
	use DoH.

- `DohWellKnownServers` adds DoH support for multiple IPv4 & IPv6 addresses
	that Windows 11 isn't shipping by default, currently:
	- Adguard
	- Cloudflare antimalware
	- DNS0 (& Zero)
	- Mullvad
	- Mullvad Adblock
	- Quad9 ECS (Windows 11 defaults include Quad9 default)

## Configuration

Once Windows knows about the DoH servers (DohWellKnownServers.reg), DNS-over
HTTPS can be enabled for:

- All networks: `Windows-I (Settings) -> Network & Internet -> Advanced network settings -> WLAN -> View additional properties -> DNS Server assignment -> Edit`
	- Same place for Ethernet etc.
- Specific network: `Windows-I (Settings) -> Network & Internet -> WiFi -> Connected SSID -> DNS server assignment -> Edit`
	- Note: if the all networks one is configured, there is a warning about it not being used.
