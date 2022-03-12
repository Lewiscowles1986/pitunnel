#!/bin/bash

# Check required permissions
if [ "$EUID" -ne 0 ]
	then echo "Must be root"
	exit
fi

# Take note of important execution state
wd=`pwd`

# File-System changes
ln -s ${wd}/tunnel.service /etc/systemd/system/tunnel.service
ln -s ${wd}/tunnel.sh /root/tunnel.sh

# SystemD
systemctl enable tunnel
systemctl start tunnel
systemctl status tunnel
