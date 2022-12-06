#!/usr/bin/env bash

# USAGE: ./xsarm_amd64_install.sh [-h][-d DISTRO][-p PATH][-n]
#
# Install the Interbotix X-Series Arms packages and their dependencies.

# Install esential packages

sudo apt update && sudo apt -y upgrade
sudo apt -y autoremove

sudo apt -y install openssh-server curl
sudo apt -y install python3-pip
python3 -m pip install modern_robotics


cd $ROB_FOLDERS_BASE_DIR
cd checkout
cd $ROB_FOLDERS_ACTIVE_ENV

# udev riles
cd catkin_ws/src/interbotix_ros_core/interbotix_ros_xseries/interbotix_xs_sdk
sudo cp 99-interbotix-udev.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules && sudo udevadm trigger

cd $ROB_FOLDERS_BASE_DIR
cd checkout
cd $ROB_FOLDERS_ACTIVE_ENV
cd catkin_ws

rosdep install --from-paths src --ignore-src -r -y



