#!/bin/bash

apt-get update -y
apt-get install -y docker.io

systemctl enable docker
systemctl start docker

usermod -aG docker ubuntu

DEVICE="/dev/xvdf"
MOUNT_POINT="/app/data"

mkdir -p $MOUNT_POINT

if [ -b $DEVICE ]; then
    mkfs.ext4 -F $DEVICE
    mount $DEVICE $MOUNT_POINT
    echo "$DEVICE $MOUNT_POINT ext4 defaults,nofail 0 2" >> /etc/fstab
fi

docker pull mtarunkumar/taskflow:latest

docker run -d \
  --restart unless-stopped \
  --name taskflow \
  -p 5000:5000 \
  -v /app/data:/app/data \
  mtarunkumar/taskflow:latest