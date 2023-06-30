#!/bin/bash

## filename      jpegoptim.sh
##
## description:  run through a directory and
##               compress jpg-files with jpegoptim
##
## requirements: jpegoptim
##
## author:       jonas@sfxonline.de
## =======================================================================

command -v jpegoptim >/dev/null 2>&1 || { echo >&2 "jpegoptim not available, please install first."; exit 1; }

path="$HOME/Pictures/uhu"

max_width=1920
max_height=1080

for D in `find "$path" -type d`; do
  for i in $D/*.{jpg,jpeg,JPG,JPEG} ;do
    if [ -f "$i" ]; then
        jpegoptim "$i"
    fi
  done;
done;
