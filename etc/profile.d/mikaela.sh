# Map compose to left menu and kill x with ctrl alt backspace and
# disable unbreakable space, male alt+shift change layout and
# layouts Finnish, Czech Qwerty and Esperanto.
setxkbmap -option compose:menu -option terminate:ctrl_alt_bksp -option nbsp:none -option 'grp:alt_shift_toggle' -layout fi,cz,epo -variant ,qwerty,

# Set TZ as the current timezone. This is supposed to be sent over SSH.
TZ=$(date +%Z)

# Enable numlock
numlockx on

# Workaround disappearing cursors, probably no harm in any case
export XCURSOR_DISCOVER=1
