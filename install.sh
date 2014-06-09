#!/bin/bash

set -e

sudo cp 20-intel.conf /usr/share/X11/xorg.conf.d/20-intel.conf
sudo cp touchpad.sh /usr/bin/touchpad
sudo cp screen-rotate.sh /usr/bin/screen-rotate

cd lenovoYoga13BluetoothDriver
make && sudo make install

cd ..
cd lenovoYoga13WifiDriver
make && sudo make install
