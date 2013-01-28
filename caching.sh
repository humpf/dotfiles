#!/bin/bash

rm ~/.dmenufile_cache

directories="Documents dotfiles Desktop Downloads Music Pictures scripts stuff Videos"

for dir in $directories; do
    find ~/$dir -type f | sed 's/ /\\ /g' | grep -v "\.git/" | grep -v "\.aux" | grep -v "\.tex" | grep -v "\.log" | grep -v "\.toc" >> ~/.dmenufile_cache_sort
done
find ~ -maxdepth 1 -type f | sed 's/ /\\ /g' | rev | awk -F \/ '{print $1}' | rev >> ~/.dmenufile_cache_sort

sort -f ~/.dmenufile_cache_sort > ~/.dmenufile_cache
rm ~/.dmenufile_cache_sort
