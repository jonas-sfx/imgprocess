#!/bin/bash

## filename      create-webp-pendants.sh
##
## description:  run through a directory and
##               create webp-pendant-files for each jpg/png-file
##
## requirements: cwebp-library. see build-cwebp.sh
##
## author:       jonas@sfxonline.de
## =======================================================================

command -v cwebp >/dev/null 2>&1 || { echo >&2 "cwebp not available, please install first."; exit 1; }

path="$HOME/Pictures/uhu"

for D in `find "$path" -type d`; do
  for i in $D/*.{jpg,jpeg,png,JPG,JPEG,PNG} ;do
    if [ ! -f "${i%.*}.webp" ] && [ -f "$i" ]; then
        cwebp "$i" -o "${i%.*}.webp";
    fi
  done;
done;
