#!/bin/bash
# Uninstall the timezone2offset utilities.

cd bin

if [ "$(whoami)" == "root" ]; then
    echo "Removing system-wide."
    prefix="/usr/bin"
else
    echo "Removing locally."
    prefix=~/bin
fi

for file in *; do
    rm -v "$prefix/$file"
done
