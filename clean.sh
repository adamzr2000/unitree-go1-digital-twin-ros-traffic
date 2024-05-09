#!/bin/bash

# Clean all .pcap files from the pcaps directory
echo "Cleaning all .pcap files from pcaps directory..."
rm -fv ./pcaps/*.pcap

# Clean all .bag files from the ros_bags directory
echo "Cleaning all .bag files from ros_bags directory..."
rm -fv ./ros_bags/*.bag

echo "Clean up completed."
