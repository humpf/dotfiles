#!/bin/bash

exe = `cat ~/.dmenufile_cache | dmenu -i -nb '#63B8FF' -sb '#EE4000' -nf '#000000' -fn '-*-*-*-*-*-*-16-*-*-*-*-*-*-*' | xargs xdg-open`

exec $exe
