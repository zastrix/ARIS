#!/bin/sh
# PRS Upstart start/stop utility.
# Created to provide an easy method to start/stop/restart all PRS upstart jobs.

### Pre-check
if [ $# -eq 0 ]; then
	echo "[ERROR]: No input arguments found - need to use 'start/stop' command"
	echo "[USEAGE]: $0 'start/restart/stop'"
	exit 1
fi

### Variables
UPSTART_CMD=$1

## Functions
## Toggle Upstart
## Input: arg1 --> "start", "stop"
## starts or stops all upstart scripts from running
toggleUpstart()
{
	if [ -z $1 ]; then
		echo "No input argument found for $0"
		exit -1
	fi

	find /etc/init -type f -name "*_upstart.conf" | while read line; do
		upstartname=$(basename $line)
		upstartname="${upstartname%.*}"

		if [ $1 = "start" ]; then
			echo "Starting $upstartname process"
			sudo start $upstartname
		elif [ $1 = "stop" ]; then
			echo "Stopping $upstartname process"
			sudo stop $upstartname
		fi
	done
}

## Main Script
if [ $UPSTART_CMD = "start" -o $UPSTART_CMD = "stop" ]; then
	toggleUpstart $UPSTART_CMD
elif [ $UPSTART_CMD = "restart" ]; then
	toggleUpstart "stop"
	sleep 1
	toggleUpstart "start"
else
	echo "[ERROR]: Execute script using '$0 start' to start processes; '$0 stop' to stop processes, or '$0 restart' to restart them"
fi

exit
