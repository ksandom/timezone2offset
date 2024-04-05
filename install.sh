#!/bin/bash
# Install the timezone2offset utilities.

cd bin
if [ "$(whoami)" == "root" ]; then
    echo "Installing system-wide."
    cp -Rv * /usr/bin
else
    echo "Installing locally using symlinks to the repo dir."
    mkdir -p ~/bin
    originalDirectory="$(pwd)"
    cd ~/bin
    ln -sv "$originalDirectory"/* .
fi
