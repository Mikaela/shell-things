# systemd-resolved additional config files

## Quickstart

```bash
sudo systemctl enable --now systemd-resolved.service
sudo ln -rsf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
# After changing configuration
sudo systemctl restart systemd-resolved
```

## Files explained

- `00-defaults.conf` - configuration not touching resolvers. Enables DNSSEC
  (regardless of systemd-resolved not handling it properly), enables
  opportunistic DoT and caching.
- `dot-*.conf` - configuration to use the DNS provider with DNS-over-TLS. If
  captive portals are a concern, `DNSOverTLS=no`.
- `README.md` - you are reading it right now.

## General commentary

- Based on my test DNSOverTLS is not supported in Ubuntu 18.04.x LTS (however
  at the time of writing this README.md, the current version is Ubuntu 20.04.0)
  (systemd v237). DNSOverTLS became supported in v239, strict mode (yes) in
  v243 (big improvements in v244).
  - TODO: find out when SNI became supported, I have just spotted it in the
    fine manual in 2020-06-??.
- Domains has to be `.~` for them to override DHCP. See https://www.internetsociety.org/blog/2018/12/dns-privacy-in-linux-systemd
  without which I wouldn't have got this right.
- DNSSEC may not work if the system is down for a long time and not updated.
  Thus `allow-downgrade` may be better for non-tech people, even with the
  potential downgrade attack. There are also captive portals, affecting
  `DNSOverTLS`. Both take `yes` or `no` or their own special option,
  for DNNSEC the `allow-downgrade`, for DNSOverTLS `opportunistic`.
  - Then again when was any system that outdated to not have working DNSSEC?
    - TODO: return to this configuration should that actually happen?

Other links I have found important and my files are based on:

- https://wiki.archlinux.org/index.php/Systemd-resolved
  - Also provides the serious issues systemd-resolved+DNSSEC issues, https://github.com/systemd/systemd/issues/10579 & https://github.com/systemd/systemd/issues/9867
- request for strict DoT: https://github.com/systemd/systemd/issues/10755
- vulnerable to MITM: https://github.com/systemd/systemd/issues/9397
