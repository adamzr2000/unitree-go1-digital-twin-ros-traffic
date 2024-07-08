# Digital Twin App Dataset

This project contains a dataset generated with the [Digital Twin App](https://github.com/adamzr2000/unitree-go1-digital-twin/tree/main) of the [Unitree Go1](https://unitree-docs.readthedocs.io/en/latest/get_started/Go1_Edu.html) robot using [Docker](https://www.docker.com/) and [ROS bags](http://wiki.ros.org/rosbag). 

ROS bags are files used in ROS to store messages exchanged between nodes, enabling the capture and playback of ROS topics, messages, and other communication within a ROS system. The benefit of using ROS bags is that they can be replayed offline, allowing for analysis, debugging, and experimentation without the need for a live robot.

The dataset includes a variety of ROS topics, each containing specific types of data necessary for different aspects of robotic control and navigation. Below are the available topics with their corresponding descriptions:

- [Joint States](https://docs.ros.org/en/melodic/api/sensor_msgs/html/msg/JointState.html) → `/joint_states`: Contains information about the robot's joint positions, velocities, and efforts.
- [Odometry](https://docs.ros.org/en/noetic/api/nav_msgs/html/msg/Odometry.html) → `/go1_controller/odom`: Provides data on the robot's position and orientation over time.
- [Laser Scans](https://docs.ros.org/en/melodic/api/sensor_msgs/html/msg/LaserScan.html) → `/scan`: Includes distance measurements from the robot's laser scanner, useful for obstacle detection and mapping.
- [Control Commands](https://docs.ros.org/en/noetic/api/geometry_msgs/html/msg/Twist.html) → `/go1_controller/cmd_vel`: Records the velocity commands sent to the robot.
- [Transforms](https://docs.ros.org/en/noetic/api/tf/html/msg/tfMessage.html) → `/tf`: Contains the necessary coordinate transforms for interpreting the robot's sensor data relative to different frames.
- [Mapping Data](https://docs.ros.org/en/melodic/api/nav_msgs/html/msg/OccupancyGrid.html) → `/map`: Provides data for building and visualizing the robot's map of its environment.

Additionally, this project includes a PCAP file capturing the network traffic generated during the robot's operation. This file can be replayed using tools like [tcpreplay](https://tcpreplay.appneta.com/).

## Usage

### Extract Files

To extract the downloaded files, run the following command:

```sh
./extract_files.sh
```

This script will extract the files from zip folder and move the PCAP files to the `pcaps` directory and the ROS bag files to the `ros_bags` directory.

### ROS Bag Replay

1. **Build the Docker container:**

```sh
./build.sh
```

2. **Run the container:**

```sh
./run_example.sh
```

This command runs the container in host network mode, replaying the ROS bag file on localhost.

3. **Visualize ROS messages:**

Enter the container's terminal using `./terminal.sh` script and use rostopic tools:
- `rostopic bw`: Display bandwidth used by a topic
- `rostopic delay`: Display delay for topics with headers
- `rostopic echo`: Print messages to the screen
- `rostopic find`: Find topics by type
- `rostopic hz`: Display publishing rate of a topic
- `rostopic info`: Print information about active topics
- `rostopic list`: Print information about active topics
- `rostopic pub`: Publish data to a topic
- `rostopic type`: Print topic type

### TCP Replay

1. **Replay TCP traffic:**

Navigate to the `pcaps` directory and run `tcpreplay` command with appropriate parameters:

```sh
cd pcaps
sudo tcpreplay-edit --mtu-trunc -i <interface> -l 0 <pcap-file>.pcap
```

Replace `<interface>` with the network interface through which you want to generate the traffic, and `<pcap-file>` with the filename of the pcap file you wish to replay.

If you don't have tcpreplay installed, you can install it using the following command:

```sh
sudo apt install tcpreplay
```

### Flannel-VXLAN-Wireshark-parser

Flannel is a Kubernetes network plugin that uses a VXLAN overlay network. 

This repository offers a Wireshark parser script for analyzing Flannel traffic.

Instructions to use this plugin (Ubuntu)
-----------------------------------------
1. Wireshark menu → Help → About Wireshark→ Folders
2. Save the [vxlan_flannel.lua](./vxlan_flannel.lua) script in the Global Plugins folder
3. Run Wireshark
4. Use “vxlan_flannel” as a filter







