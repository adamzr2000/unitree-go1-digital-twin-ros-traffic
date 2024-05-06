#!/bin/bash

# Directory on host to map to the container's ros_bags directory
host_ros_bags_dir="$(pwd)/ros_bags"

docker run \
    -it \
    --name ros-traffic-replay-go1 \
    --rm \
    --net host \
    --privileged \
    -v ${host_ros_bags_dir}:/home/go1/ros_bags \
    ros-traffic-replay-go1:latest \
    ./entrypoint.sh dt_service_traffic.bag

