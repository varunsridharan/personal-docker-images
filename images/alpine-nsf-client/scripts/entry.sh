#!/bin/sh

set -e

touch /root/log.log
echo "$(bash /scripts/nfs-mount.sh)" >> /root/log.log
