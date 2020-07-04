## systemd-resolved additional config files

### Files explained

* everywhere.conf - configuration that doesn't affect DNS servers, attempts
  to use DNSSEC and DoT and if it fails, doesn't care and uses insecure
  configuration.
* quad9-compat.conf - non-tech person config for Quad9, same as above except
  specifies the server.
* quad9-strict.conf - tech person config demanding DNSSEC and DoT from Quad9
* README.md - you are reading it right now.

### General commentary

I have moved duplicate comments to this file, so it will possibly look weird
or miss original context.

* Based on my test DNSOverTLS is not supported in Ubuntu 18.04.x LTS (however
  at the time of writing this README.md, the current version is Ubuntu 20.04.0)
  (systemd v237). DNSOverTLS became supported in v239, strict mode (yes) in
  v243 (big improvements in v244).
  * TODO: find out when SNI became supported, I have just spotted it in the
    fine manual in 2020-06-??.
* Domains has to be `.~` for them to override DHCP. See https://www.internetsociety.org/blog/2018/12/dns-privacy-in-linux-systemd
  without which I wouldn't have got this right.
* DNSSEC may not work if the system is down for a long time and not updated.
  Thus `allow-downgrade` may be better for non-tech people, even with the
  potential downgrade attack. There are also captive portals, affecting
  `DNSOverTLS`. Both take `true` or `false` or their own special option,
  for DNNSEC the `allow-downgrade`, for DNSOverTLS `opportunistic`.

Other links I have found important and my files are based on:

* https://wiki.archlinux.org/index.php/Systemd-resolved
* request for strict DOT: https://github.com/systemd/systemd/issues/10755
* vulnerable to MITM: https://github.com/systemd/systemd/issues/9397
