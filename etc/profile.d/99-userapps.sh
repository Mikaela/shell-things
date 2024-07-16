# Heavily copied and modified from /etc/profile.d/snapd.sh

local_bin_path="$HOME/.local/bin"
if [ -n "${PATH##*${local_bin_path}}" ] && [ -n "${PATH##*${local_bin_path}:*}" ]; then
	export PATH="$PATH:${local_bin_path}"
fi

local_xdg_path="$HOME/.local/share"
if [ -n "${XDG_DATA_DIRS##*${local_xdg_path}}" ] && [ -n "${XDG_DATA_DIRS##*${local_xdg_path}:*}" ]; then
	export XDG_DATA_DIRS="${XDG_DATA_DIRS}:${local_xdg_path}"
fi
