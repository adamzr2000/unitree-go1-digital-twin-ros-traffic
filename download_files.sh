#!/bin/bash

# Download PCAP files
echo "Downloading PCAP files..."
wget -O pcaps/dt_service_traffic.pcap "https://drive.google.com/file/d/173v1od5onGkgTHWhcEMcZ7Gp6w2W0vMZ/view?usp=sharing"
# Add more wget commands for additional PCAP files if needed

# Download ROS bag files
echo "Downloading ROS bag files..."
wget -O ros_bags/dt_service_traffic.bag "https://drive.google.com/file/d/1q6VqdulorG23VJ4haN9c8LoOryyjZsnL/view?usp=sharing"

echo "Download complete."

