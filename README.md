# Simple setup for Yoga 13

## Usage

```bash
~$ screen-rotate flip 
~$ screen-rotate normal
~$ screen-rotate right
~$ screen-rotate inverse
~$ screen-rotate left

//Toggle touchpad
~$ touchpad

~$ touchpad on
~$ touchpad off
```

##Install instructions

### Automatic

./install.sh

### Manual

```bash
sudo cp 20-intel.conf /usr/share/X11/xorg.conf.d/20-intel.conf
sudo cp touchpad.sh /usr/bin/touchpad
sudo cp screen-rotate.sh /usr/bin/screen-rotate
```

Then do "make && sudo make install" in the following folders

- lenovoYoga13BluetoothDriver/
- lenovoYoga13WifiDriver/
