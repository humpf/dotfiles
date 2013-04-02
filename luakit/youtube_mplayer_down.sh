#!/bin/bash
youtube-dl -o 'Videos/yt/%(title)s-%(uploader)s' "$1" && notify-send "download finished!"
