#!/bin/bash

# Assemble docker image. 
echo 'Building docker image.'
sudo docker build . -t ros-traffic-replay-go1
