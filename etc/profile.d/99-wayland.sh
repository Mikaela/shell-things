unset QT_QPA_PLATFORMTHEME
unset QT_STYLE_OVERRIDE
export XDG_CURRENT_DESKTOP=KDE
export XDG_SESSION_DESKTOP=KDE
# Strongly imply these that wayland is preferred
export GDK_BACKEND=wayland
export QT_QPA_PLATFORM=wayland
export CLUTTER_BACKEND=wayland
export SDL_VIDEODRIVER=wayland
export ELECTRON_OZONE_PLATFORM_HINT=wayland
export MOZ_ENABLE_WAYLAND=1
