#!/usr/bin/env bash

# Copyright 2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0

cd "$(dirname "$0")"
cp config.json /tmp
sudo apt-get update
sudo apt-get install unzip
cd /tmp
wget https://s3.amazonaws.com/amazoncloudwatch-agent/linux/amd64/latest/AmazonCloudWatchAgent.zip -O AmazonCloudWatchAgent.zip
unzip -o AmazonCloudWatchAgent.zip
sudo ./install.sh
sudo cp -r config.json /opt/aws/amazon-cloudwatch-agent/bin
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/tmp/config.json -s
