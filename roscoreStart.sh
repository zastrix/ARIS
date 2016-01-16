#!/bin/bash

export ROS_IP=192.168.0.20
export ROS_MASTER_URI=http://192.168.0.20:11311
source /opt/ros/hydro/setup.bash

roscore
