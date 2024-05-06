#!/bin/bash

# Decompress the zip file
unzip files.zip

# Move PCAP files to pcaps directory
mv files/*.pcap pcaps/

# Move ROS bag files to ros_bags directory
mv files/*.bag ros_bags/

# Remove the files directory
rm -r files/

echo "Files extracted and moved successfully."
