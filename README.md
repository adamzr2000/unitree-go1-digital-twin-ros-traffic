# ROS Traffic Replay for Unitree Go1 Digital Twin

This repository enables replaying the ROS (Robot Operating System) application traffic of the [Unitree Go1 Digital Twin](https://github.com/adamzr2000/unitree-go1-digital-twin/tree/main) using a Docker container and [ROS bags](http://wiki.ros.org/rosbag). 

Additionally, it provides a PCAP file that can be replayed using tools such as tcpreplay.

> Note: ROS bags are files used in ROS to store messages exchanged between nodes, enabling the capture and playback of ROS topics, messages, and other communication within a ROS system.

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






