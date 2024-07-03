<!-- @format -->

Systemd services. These are sorted by some kind of category into
subdirectories. The sudirectories won't exist in the real
`/etc/systemd/system` unless they end `.wants` or `.d` or something similar
and I forget to update this README file if that happens.

- reflector.service is copied from
  https://wiki.archlinux.org/index.php/Reflector but uses https instead of
  http, because there is no reason I would want someone to see what I
  download.

## Worth reading

- Waiting for network devices to have IP address (**I only use this for
  cables**)
  https://wiki.freedesktop.org/www/Software/systemd/NetworkTarget/#cutthecraphowdoimakenetwork.targetworkforme
  - `systemctl enable NetworkManager-wait-online.service`
  - `systemctl enable systemd-networkd-wait-online.service`
