#!/bin/bash
 
function rotateLeft
{
	xrandr -o left
	xinput set-prop 'ELAN Touchscreen'  'Evdev Axis Inversion' 0, 0
	xinput set-prop 'ELAN Touchscreen' 'Evdev Axes Swap' 0
	xinput set-prop 'SynPS/2 Synaptics TouchPad' 'Coordinate Transformation Matrix' 0 -1 1 1 0 0 0 0 1
	xinput set-prop 'ELAN Touchscreen' 'Coordinate Transformation Matrix' 0 -1 1 1 0 0 0 0 1
}

function rotateRight
{
	xrandr -o right
	xinput set-prop 'ELAN Touchscreen'  'Evdev Axis Inversion' 0, 0
	xinput set-prop 'ELAN Touchscreen' 'Evdev Axes Swap' 0
	xinput set-prop 'SynPS/2 Synaptics TouchPad' 'Coordinate Transformation Matrix'  0 1 0 -1 0 1 0 0 1
	xinput set-prop 'ELAN Touchscreen' 'Coordinate Transformation Matrix'  0 1 0 -1 0 1 0 0 1
}

function rotateInverse
{
	xrandr -o inverted
	xinput set-prop 'ELAN Touchscreen'  'Evdev Axis Inversion' 1, 1
	xinput set-prop 'ELAN Touchscreen' 'Evdev Axes Swap' 0
	xinput set-prop 'ELAN Touchscreen' 'Coordinate Transformation Matrix' 1 0 0 0 1 0 0 0 1
	xinput set-prop 'SynPS/2 Synaptics TouchPad' 'Coordinate Transformation Matrix' -1 0 0 0 -1 0 0 0 1
}

function rotateNormal
{
	xrandr -o normal
	xinput set-prop 'ELAN Touchscreen'  'Evdev Axis Inversion' 0, 0
	xinput set-prop 'ELAN Touchscreen' 'Evdev Axes Swap' 0
	xinput set-prop 'ELAN Touchscreen' 'Coordinate Transformation Matrix' 1 0 0 0 1 0 0 0 1
	xinput set-prop 'SynPS/2 Synaptics TouchPad' 'Coordinate Transformation Matrix' 1 0 0 0 1 0 0 0 1
}

rotation=`xrandr -q --verbose |grep LVDS1 |cut -d ' ' -f6`


if [ $# -eq 1 ]; then			   # Any arguments?
	inputArgument1=$(echo $1 | tr [:upper:] [:lower:])	# Yes, convert to lower case
	cliArg=1					# Set flag that we have one
else						# There is no argument.
	cliArg=0					# Clear flag
fi


if [ $cliArg -eq 0 ]; then 
	if [ $rotation = "normal" ] ;
	then
		rotateLeft
		/usr/bin/touchpad off
	elif [ $rotation = "left" ] ;
	then
		rotateInverse
		/usr/bin/touchpad off
	elif [ $rotation = "inverted" ] ;
	then
		rotateRight
		/usr/bin/touchpad off
	else
		rotateNormal
		/usr/bin/touchpad on
	fi
else
	if [ $inputArgument1 = "left" ]; then
		rotateLeft
		/usr/bin/touchpad off
	elif [ $inputArgument1 = "right" ]; then
		rotateRight
		/usr/bin/touchpad off
	elif [ $inputArgument1 = "inverse" ]; then
		rotateInverse
		/usr/bin/touchpad off
	elif [ $inputArgument1 = "flip" ]; then
		if [ $rotation = "normal" ];then
			rotateInverse
			/usr/bin/touchpad off
		else
			rotateNormal
			/usr/bin/touchpad on
		fi
	else
		rotateNormal
		/usr/bin/touchpad on
	fi
fi