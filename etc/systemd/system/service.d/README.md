# systemd unit overrides

These are meant to be in `/etc/systemd/system/whatever.service.d/` and thus
override the behaviour of the unit either in `/etc/systemd/system` or
`/lib/systemd/system`.

See `../*.d/` for services that either symlink here or other inspiration for
using overrides.

**_DON'T PLACE THESE IN ACTUAL `/etc/systemd/system/service.d` OR THEY MIGHT
AFFECT ALL SERVICES CAUSING UNEXPECTED BEHAVIOUR!_**
