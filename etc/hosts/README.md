# `/etc/hosts`

This file is DNS before DNS and legacy remain which is still used.

<!-- editorconfig-checker-disable -->
<!-- prettier-ignore-start -->

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [`blocklist`](#blocklist)
- [`dns`](#dns)
- [`hostname`](#hostname)
- [`hosts.arch`](#hostsarch)
- [`hosts.fedora`](#hostsfedora)
- [`hosts.debian`](#hostsdebian)
- [`hosts.steamos`](#hostssteamos)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

<!-- prettier-ignore-end -->
<!-- editorconfig-checker-enable -->

## `blocklist`

Hosts that I dislike enough to mention in my `hosts` file.

## `dns`

This began from question why should I have DNS to have DNS, but having it
on DNS resolver level broke DNSSEC due to my weird mixing of systemd-resolved
and Unbound, so now it's something I can attempt to `/etc/hosts`.

**_EXCERCISE CAUTION!_**

## `hostname`

As can be seen in `hosts.debian`, Debian specifies hostname in format
such as:

```
::1 localhost
::1 FQDN UQDN

127.0.0.1   localhost
127.0.1.1   FQDN UQDN
```

where FQDN means _Fully Qualified Domain Name_ and UQDN _Unqualified Domain
Name_ (although I don't know if anyone else calls it like that) and I find
that a good practice. Additionally I have observed my systems querying their
own hostname from global DNS which seems unnecessary and not a great behaviour
to me, while this file appended to `/etc/hosts` can tell it immediately all
applications and make `resolvectl query hostname.localdomain` find it
instantly.

The `0200:0000:0000:0000:0000:0000:0000:0000`? Replace it with your Yggdrasil
address from `yggdrasilctl getself`.

## `hosts.arch`

For now this is a symlink to `hosts.steamos` as I am pretty sure they haven't
modified it.

## `hosts.fedora`

I am pretty sure this is the `/etc/hosts` that was given me by Fedora < 40
with changes removed.

## `hosts.debian`

I think this is the Debian format which used to be just `../hosts` in this
repository.

## `hosts.steamos`

The `/etc/hosts` file from `SteamOS Holo` variant steamdeck version `3.5.19`
or `20240422.1`.
