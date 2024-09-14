#!/bin/bash

#
# varables
#

virt="0" # if 0 system is runnind on a phisical machine, if 1 it is virtualized
sysd="0" # if 0 system is not using systemd

#
# checking for root privileges
#

if [ $UID -ne "0" ]; then
	echo "Need root privileges"
	exit 1
fi

#
# checking and printing environment
#

if [ "$(ps -p 1 -o comm=)" = "systemd" ]; then
	sysd="1"
	if [ "$(systemd-detect-virt)" != "none" ]; then
		virt="1"
		echo "The sistem uses Systemd and it is virtualized"
	else
		echo "The sistem uses Systemd and it is not virtualized"
	fi
fi
