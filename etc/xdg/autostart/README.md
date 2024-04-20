# System-wide autostart files

_Note: this directory is also being used as `~/.local/share/applications`
which populates the app menu, my autostart is thankfully not this
populated._

- redshift - app that changes screen temperature along the sun
- telegramdesktop - IM app, based on telegram-desktop package
- com.wire.WireDesktop - Wire flatpak based on the flatpak of the same name

## `a-*.desktop`

These files belong to `/usr/local/share/applications` and are named so to
avoid masking package manager. They have clearly different names such as using
all caps. To refresh them:

```bash
sudo update-desktop-database -v /usr/local/share/applications
```
