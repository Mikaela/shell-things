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

- `00-defaults.conf` - configuration that should be used everywhere.
  Enables DNSSEC (regardless of systemd-resolved not handling it properly),
  enables opportunistic DoT, caching and local DNS servers (because they
  should exist anyway as I don't trust systemd-resolved entirely. Anyway if
  there truly is no local resolver, systemd-resolved will detect that and act accordingly.)
  - To rephrase, this is to be used together with other files, especially
    some of those beginning with `10-dot-`.
- `05-do53-dna-moi.conf` - DNS servers used by DNA and Moi (who is on DNA's
  network and owned by them)
- `05-do53-elisa.conf` - DNS servers used by Elisa and apparently their
  Saunalahti still exists here as well.
- `10-dot-*.conf` - configuration to use the DNS provider with DNS-over-TLS.
  At least one of these should be used in addition to `00-defaults.conf`
- `98-local-resolver.conf` attempts to configure localhost resolver and
  disables unnecessary features for that scenario. The number 10 takes
  priority over 00 and 05 so if a DNSOverTLS=true is uncommented, it will
  also apply to the former ones that are unlikely to support it. When
  numbering the files, I didn't think I would be adding the plaintext DNS
  servers that I am unlikely to use whenever Unbound is available (and I
  currently have only one system that has systemd-resolved while not having
  Unbound and it seems to prefer DoT over my router anyway).
- `99-lan-resolver.conf.sample` when renamed would allow enabling resolvers on
  LAN assuming they are trusted. Note that if used together with
  `98-local-resolver.conf`, DNSSEC would be disabled.
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
- DNS server priority is the one they are specified in. The first working one
  will be used when it won't work anymore and then the next is used as long
  as it works and then it's back to the beginning.
  - https://github.com/systemd/systemd/issues/16322#issuecomment-724143641

Other links I have found important and my files are based on:

- https://wiki.archlinux.org/index.php/Systemd-resolved
  - Also provides the serious issues systemd-resolved+DNSSEC issues, https://github.com/systemd/systemd/issues/10579 & https://github.com/systemd/systemd/issues/9867
- request for strict DoT: https://github.com/systemd/systemd/issues/10755
- vulnerable to MITM: https://github.com/systemd/systemd/issues/9397
