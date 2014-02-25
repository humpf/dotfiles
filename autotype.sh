#!/bin/bash
passw=$(xclip -selection clipboard -o)

active_window="$(xdotool getactivewindow)"

xdotool type --window "$active_window" "$passw"
