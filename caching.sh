#!/bin/bash

rm ~/.cache/dmenufile_cache

directories="Documents dotfiles Desktop Downloads Music Pictures scripts stuff Videos"

for dir in $directories; do
    find ~/$dir -type f | sed 's/ /\\ /g' | grep -v "\.git/" | grep -v "\.lot" |grep -v "\.out" | grep -v "\.lof" |grep -v "\.aux" | grep -v "\.tex" | grep -v "\.log" | grep -v "\.toc" >> ~/.cache/dmenufile_cache_sort
done
find ~ -maxdepth 1 -type f | sed 's/ /\\ /g' | rev | awk -F \/ '{print $1}' | rev >> ~/.cache/dmenufile_cache_sort

sort -f ~/.cache/dmenufile_cache_sort > ~/.cache/dmenufile_cache
rm ~/.cache/dmenufile_cache_sort
