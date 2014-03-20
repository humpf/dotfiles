#!/bin/bash
mpv --fs $(youtube-dl -g "$1") &>/dev/null
