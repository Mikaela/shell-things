# Custom app menu entries

These can be used for either `~/.local/share/applications` or
`/usr/local/share/applications` which are read by graphical desktop
environments for their app menus and default applications selections.

Additionally `~/.config/autostart` or `/etc/xdg/autostart` could symlink here
so graphical desktop environments started the apps on login.

<!-- editorconfig-checker-disable -->
<!-- prettier-ignore-start -->

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [`a-*.desktop`](#a-desktop)
- [Refreshing the menus](#refreshing-the-menus)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

<!-- prettier-ignore-end -->
<!-- editorconfig-checker-enable -->

## `a-*.desktop`

These files are companions to my script repos `bash/usr-local-bin/*` belonging
to `/usr/local/share/applications` and are named so to
avoid masking package manager. They have clearly different names such as using
all caps.

## Refreshing the menus

```bash
update-desktop-database -v ~/.local/share/applications
sudo update-desktop-database -v /usr/local/share/applications
```
