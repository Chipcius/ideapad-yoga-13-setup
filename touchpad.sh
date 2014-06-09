#!/bin/bash

if [ $# -eq 1 ]; then			   # Any arguments?
	arg1=$(echo $1 | tr [:upper:] [:lower:])	# Yes, convert to lower case
	cliArg=1					# Set flag that we have one
else						# There is no argument.
	cliArg=0					# Clear flag
fi

DNAME="SynPS/2 Synaptics TouchPad"
touchpadID=`xinput --list | grep "$DNAME"|cut -d= -f2|cut -c1,2`
touchpadEnabled=$(xinput list-props $touchpadID | grep "Device Enabled" | awk -F ":" '{print $2}')


if [ $cliArg -eq 1 ]; then		  # Did we get an argument?
	if [ $arg1 = 'on' ]; then		   # Yes, was it "on"?
		xinput --set-prop $touchpadID "Device Enabled" 1
		echo "Touchpad On"
		# Yes, enable the touchpad
	elif [ $arg1 = 'off' ]; then		# No, was it "off"?
		xinput --set-prop $touchpadID "Device Enabled" 0
		echo "Touchpad Off"
			   # Yes, disable the touchpad
	else	   # None of the above, so...
		echo "Unknown command"
	fi

else	# No argument, toggle state
	if [[ $touchpadEnabled -eq 1 ]]; then	 # Enabled now?
		xinput --set-prop $touchpadID "Device Enabled" 0
		echo "Touchpad Off"
		# Yes, so disable it
	else # Must be disabled, so...
		xinput --set-prop $touchpadID "Device Enabled" 1
		echo "Touchpad On"
	fi
fi
