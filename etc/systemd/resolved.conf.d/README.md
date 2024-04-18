# systemd-resolved additional config files

<!-- editorconfig-checker-disable -->
<!-- prettier-ignore-start -->

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Quickstart](#quickstart)
- [Files explained](#files-explained)
- [General commentary](#general-commentary)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

<!-- prettier-ignore-end -->
<!-- editorconfig-checker-enable -->

## Quickstart

```bash
sudo systemctl enable --now systemd-resolved.service
sudo ln -rsf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
# After changing configuration
sudo systemctl restart systemd-resolved
```

## Files explained

- `00-no-local-resolver.conf` - configuration that should be used everywhere.
  Enables DNSSEC (regardless of systemd-resolved not handling it properly),
  enables opportunistic DoT, caching and local DNS servers (because they
  should exist anyway as I don't trust systemd-resolved entirely. Anyway if
  there truly is no local resolver, systemd-resolved will detect that and act accordingly.)
  - To rephrase, this is sto be used together with other files, especially
    some of those beginning with `dot-`.
- `00-only-local-resolver.conf` - for when there is known local resolver.
  **_Don't combine this with the other files._**
- `dot-*.conf` - configuration to use the DNS provider with DNS-over-TLS. If
  captive portals are a concern, `DNSOverTLS=opportunistic`. At least one of these
  should be used in addition to `00-defaults.conf`
- `nordvpn.conf` - includes NordVPN's resolver addresses for hosts using it
- `README.md` - you are reading it right now.

## General commentary

- DNSOverTLS became supported in systemd v239, strict mode (true) in
  v243 (big improvements in v244).
  - TODO: find out when SNI became supported, I have just spotted it in the
    fine manual in 2020-06-??.
- Domains has to be `.~` for them to override DHCP. See https://www.internetsociety.org/blog/2018/12/dns-privacy-in-linux-systemd
  without which I wouldn't have got this right.
- DNSSEC may not work if the system is down for a long time and not updated.
  Thus `allow-downgrade` may be better for non-tech people, even with the
  potential downgrade attack. There are also captive portals, affecting
  `DNSOverTLS`. Both take `true` or `false` or their own special option,
  for DNSSEC the `allow-downgrade`, for DNSOverTLS `opportunistic`.
  - Then again when was any system that outdated to not have working DNSSEC?
    - TODO: return to this configuration should that actually happen?
    - I am actually running Unbound simultaneously with `resolv.conf` pointing
      to both with `options rotate edns0 trust-ad` which might workaround that
      potential issue.

Other links I have found important and my files are based on:

- https://wiki.archlinux.org/index.php/Systemd-resolved
  - Also provides the serious issues systemd-resolved+DNSSEC issues, https://github.com/systemd/systemd/issues/10579 & https://github.com/systemd/systemd/issues/9867
- request for strict DoT: https://github.com/systemd/systemd/issues/10755
- vulnerable to MITM: https://github.com/systemd/systemd/issues/9397
