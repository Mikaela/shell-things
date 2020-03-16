`~/.config/systemd/user`

To enable lingering

`sudo loginctl enable-linger username` or if it doesn't work, `sudo touch /var/lib/systemd/linger/username`

https://wiki.archlinux.org/index.php/Systemd/User will be a big help
