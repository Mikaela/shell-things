# `.desktop` entries

These can be used for many things such as

- `~/.local/share/applications` (graphical desktop environments populate app
  menu from here)
- `~/.config/autostart` (graphical desktop environments read user autostarts
  here)
- `/usr/local/share/applications` (global version of above)
- `/etc/xdg/autostart` (global version of the above)

## `a-*.desktop`

These files are companions to my script repos `bash/usr-local-bin/*` belonging
to `/usr/local/share/applications` and are named so to
avoid masking package manager. They have clearly different names such as using
all caps. To refresh them:

```bash
sudo update-desktop-database -v /usr/local/share/applications
```
