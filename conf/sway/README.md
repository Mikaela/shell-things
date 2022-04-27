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
