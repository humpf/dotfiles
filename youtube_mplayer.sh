#!/bin/bash
mplayer -fs $(youtube-dl -g "$1") &>/dev/null
