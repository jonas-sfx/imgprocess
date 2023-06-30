#!/bin/bash

git clone https://chromium.googlesource.com/webm/libwebp libwebp

cd libwebp || exit
git fetch --tags

latest_tag=$(git tag -l | grep -E '^v[0-9]+\.[0-9]+\.[0-9]+$' | sort -V | tail -n 1)

if [[ -z "$latest_tag" ]]; then
    echo "Latest Tag not found."
    exit 1
fi

git checkout "$latest_tag"
if [[ $? -ne 0 ]]; then
    echo "Error on checkout for latest tag."
    exit 1
fi

make -f makefile.unix
mv examples/cwebp examples/dwebp "$HOME/bin/"

mkdir -p "$HOME/bin"
echo 'PATH=$HOME/bin:$PATH' >> "$HOME/.bash_profile"
source "$HOME/.bash_profile"