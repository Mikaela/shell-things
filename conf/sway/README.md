# Sway configuration

This is my `~/.config/sway/config`, and `…config.d/`. The main config contains
thinks that I have felt as essential or otherwise felt like putting there,
but as I love include directives, a lot is in the config.d.

## Themes

My i3 config says that on Debian the packages are:
`sudo apt install lxappearance gtk-chtheme qt4-qtconfig qt5ct`

The source for that is marked as https://askubuntu.com/a/600946
Additionally apparently my `~/.xprofile` specifies `GTK_THEME` which
I have hoped to get get detected/understood by browsers etc, but I think
I decided to not import that to Sway which naturally doesn't read xprofile.

Apparently Adwaita must be set to dark theme in `gnome-control-center`

### Fonts

Using the same apps and `gnome-tweaks` (as there are probably a lot of
methods setting fonts):

- User-interface text: Noto Serif Regular 10
- Document text: Noto Serif Regular 11
- Monospace text: Noto Sans Mono Regular 10
- Legacy window title text: Noto Serif Bold 11
  - Apparently this means "apps that don't use client-side decorations"

The number behind is obviously the number and it's based on what were the
defaults before I touched them so I am hoping GNOME knows what they are
doing.

Noto should have all characters, looks good enough to my eyes, I guess Serif
makes a distinguishion between letters "I" and "l", it doesn't seem to have
a Mono variant, but the Sans is close enough.

Where reading speed is needed, `OpenDyslexic` is nice, but some applications
have trouble handling it, e.g. mpv (makes Ä and Ö and Å all Å) and Firefox
(makes 8 look like 6 and other weirdness).

Other font settings in GNOME-Tweak:

- Hinting: _a bit_
  - for no particular reason
- Antialiasing: _Subpixel (for LCD-displays)_
  - I have no idea where there are "standard grayscale" displays that aren't
    LCD.

### Screen mirroring

[Officially unsupported for now]()

Workarounds:

- Use VNC (see my Scripts repo [`bash/swaymirror.bash`](https://gitea.blesmrt.net/mikaela/scripts/src/branch/master/bash/swaymirror.bash))
- Do something weird with OBS
- Use a dedicated application that don't seem to be in Fedora repos, flatpak
  or snap.
  - [github.com/Ferdi265/wl-mirror](https://github.com/Ferdi265/wl-mirror)
  - [github.com/progandy/wdomirror](https://github.com/progandy/wdomirror)
