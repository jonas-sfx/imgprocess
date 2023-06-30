#!/bin/bash

## filename      scale2limit.sh
##
## description:  run through a directory and
##               scale jpg/png-files to maximum dimensions
##
## requirements: convert
##
## author:       jonas@sfxonline.de
## =======================================================================

command -v convert >/dev/null 2>&1 || { echo >&2 "convert not available, please install first."; exit 1; }

path="$HOME/Pictures/uhu"

max_width=1920
max_height=1080

for D in `find "$path" -type d`; do
  for i in $D/*.{jpg,jpeg,png,JPG,JPEG,PNG} ;do
    if [ ! -f "${i%.*}_scaled.${i##*.}" ] && [ -f "$i" ] && { [ $(identify -format "%w" "$i") -gt $max_width ] || [ $(identify -format "%h" "$i") -gt $max_height ]; }; then
        convert "$i" -resize "${max_width}x${max_height}>" "${i%.*}_scaled.${i##*.}"
    fi
  done;
done;