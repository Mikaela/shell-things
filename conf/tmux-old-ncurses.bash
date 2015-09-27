#!/usr/bin/env bash
# Intended for systems with ncurses < 6 which is missing TERMINFO
# for tmux-256color.
if [[ $TERM == 'tmux-256color' ]]; then
    export TERM=screen-256color
fi
