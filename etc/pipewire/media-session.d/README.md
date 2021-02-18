The old pulseaudio fix for less than 20 % volume being unhearable is editing `alsa-monitor.conf` and uncommenting `api.alsa.ignore-dB = true`

```
2021-049 11:44:40 EET <@wtay> Mikaela, you can set api.alsa.ignore-dB = true in /etc/pipewire/media-session.d/alsa-monitor.conf
2021-049 11:45:31 EET <@wtay> Mikaela, or alternatively: api.alsa.soft-mixer = true in alsa-monitor.conf
```

from #pipewire on freenode which has public logging according to the title.
