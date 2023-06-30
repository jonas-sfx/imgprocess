#!/bin/bash

## filename      pngcrush.sh
##
## description:  run through a directory and
##               compress png-files with pngcrush
##
## requirements: pngcrush
##
## author:       jonas@sfxonline.de
## =======================================================================

command -v pngcrush >/dev/null 2>&1 || { echo >&2 "pngcrush not available, please install first."; exit 1; }

path="$HOME/Pictures/uhu"

max_width=1920
max_height=1080

for D in `find "$path" -type d`; do
  for i in $D/*.{png,PNG} ;do
    if [ -f "$i" ]; then
        pngcrush "$i" "${i%.*}_scaled.${i##*.}"
        mv "${i%.*}_scaled.${i##*.}" "$i"
    fi
  done;
done;
