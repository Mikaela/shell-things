# `/etc/hosts`

This file is DNS before DNS and legacy remain which is still used.

<!-- editorconfig-checker-disable -->
<!-- prettier-ignore-start -->

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [`blocklist`](#blocklist)
- [`dns`](#dns)
- [`hosts.fedora`](#hostsfedora)
- [`hosts.debian`](#hostsdebian)

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

## `hosts.fedora`

I am pretty sure this is the `/etc/hosts` that was given me by Fedora < 40
with changes removed.

## `hosts.debian`

I think this is the Debian format which used to be just `../hosts` in this
repository.
