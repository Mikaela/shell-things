# Use Finnish keyboard layout and map compose to left Windows key and kill
# x with ctrl alt backspace
setxkbmap -option compose:lwin -option terminate:ctrl_alt_bksp

# Steam won't work with it's included runtime
export STEAM_RUNTIME=0
