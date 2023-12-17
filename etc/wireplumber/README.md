# PipeWire notes

<!-- editorconfig-checker-disable -->
<!-- prettier-ignore-start -->

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [File moved](#file-moved)
- [USB headset volume problem](#usb-headset-volume-problem)
- [Bluetooth](#bluetooth)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

<!-- prettier-ignore-end -->
<!-- editorconfig-checker-enable -->

## File moved

This file moved here from `pipewire/media-session.d` since that is deprecated
by wireplumber.

## USB headset volume problem

2021-06-14: These files shouldn't even exist, the solution below is wrong,
marking the headset as "Pro-audio" in pavucontrol Settings tab and adjusting
one from `alsamixer` is enough to fix it.

In `alsamixer` having it as pro-audio exposes the sound card in F6 known as
_Logitech USB Headset_ and there I see two siliders, _Headphone_ and _Mic_,
_Headphone_ can apparently be 100 and _Mic_ muted when not in use to avoid
it echoing back.

---

The old pulseaudio fix for less than 20 % volume being unhearable is editing
`alsa-monitor.conf` and uncommenting `api.alsa.ignore-dB = true`

```
2021-049 11:44:40 EET <@wtay> Mikaela, you can set api.alsa.ignore-dB = true in /etc/pipewire/media-session.d/alsa-monitor.conf
2021-049 11:45:31 EET <@wtay> Mikaela, or alternatively: api.alsa.soft-mixer = true in alsa-monitor.conf
```

from #pipewire on freenode which has public logging according to the title.

The `api.alsa.soft-mixer = true` may be nicer as the volume is a lot less,
77 % is well audible on USB headset and even 100 % isn't too loud. External
speakers with subwoofer again work as usual.

2021-06-14: the above solution is wrong and outdated, the files mentioned
don't exist by default anymore, they need to be copied and edited separately

See also:

- https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/1220
  - marked as duplicate of: https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/207

## Bluetooth

- https://www.redpill-linpro.com/techblog/2021/05/31/better-bluetooth-headset-audio-with-msbc.html
  - https://web.archive.org/web/20210614103423/https://www.redpill-linpro.com/techblog/2021/05/31/better-bluetooth-headset-audio-with-msbc.html

The above may be somewhat deprecated. Refer to these instead:

- https://steamdecki.org/Steam_Deck/Wireless/Bluetooth#Enabling_More_Codecs_and_Enabling_Headsets
- Fedora: install `pipewire-codec-aptx` (from `rpmfusion-free-updates`)
