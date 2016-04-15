# Map compose to left Windows key and kill x with ctrl alt backspace and
# disable unbreakable space
setxkbmap -option compose:lwin -option terminate:ctrl_alt_bksp -option nbsp:none

# Set TZ as the current timezone. This is supposed to be sent over SSH.
TZ=$(date +%Z)

# Enable numlock
numlockx on

# Workaround disappearing cursors, probably no harm in any case
export XCURSOR_DISCOVER=1
