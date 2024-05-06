#!/bin/bash

# Start roscore in the background using screen
screen -dmS roscore roscore

# Wait for roscore to start
sleep 3

# Check if the filename parameter is provided
if [ -z "$1" ]; then
    echo "Error: Please provide the rosbag file name."
    exit 1
fi

rosbag play -l "/home/go1/ros_bags/$1"
