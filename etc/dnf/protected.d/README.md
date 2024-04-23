# dnf protected packages

In normal operation, packages listed here will not be removed by dnf even
when told it to do so.

<!-- editorconfig-checker-disable -->
<!-- prettier-ignore-start -->

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [My list](#my-list)
- [Fedora 40 list](#fedora-40-list)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

<!-- prettier-ignore-end -->
<!-- editorconfig-checker-enable -->

## My list

- `aminda-desktop.conf` protects packages I consider essential for my desktop
  experience, mainly `sway` and `waybar`, the latter which once got removed
  due to dependency issue with Fedora 40 during its rawhide days and that was
  a bit painful.
- `aminda-essentials.conf` protects essential packages that are CLI, mainly
  `tmux`, `git` and `zsh` at this time.
- `README.md` explains what these files are about and is the file you are
  currently reading, isn't it?
- `{sdubby,systemd-boot-unsigned}.conf` are required and recommended to be
  protected for `systemd-bootd` when not using `grub`.
- `systemd-{networkd,resolved}.conf` protect the two which I use for
  `resolv.conf` and network management and I will be unhappy if they vanish
  mysteriously (Debian testing once stripped systemd-resolved from core
  systemd and broke my DNS, so just in case...)
- `unbound.conf` is what I use in addition to `systemd-resolved` recommended
  or not, so I have at least one working DNS resolver on my system.

## Fedora 40 list

```
grub2-efi-ia32.conf  grub2-pc.conf             shim.conf
grub2-efi-x64.conf   grub2-tools-minimal.conf  setup.conf   sudo.conf  systemd.conf
```
