#!/bin/bash

DEVICE="/dev/xvdf"

MOUNT_POINT="/app/data"


if [ ! -d "$MOUNT_POINT" ]; then

    mkdir -p $MOUNT_POINT

fi


if ! blkid $DEVICE; then

    mkfs -t ext4 $DEVICE

fi


mount $DEVICE $MOUNT_POINT


echo "$DEVICE $MOUNT_POINT ext4 defaults,nofail 0 2" >> /etc/fstab


chown -R ec2-user:ec2-user $MOUNT_POINT