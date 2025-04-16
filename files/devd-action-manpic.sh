#!/bin/sh
# Create an alias for NICs based on their MAC address
# https://forums.FreeBSD.org/threads/how-to-associate-an-interface-name-with-its-mac.89337/post-613188
PATH=/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/sbin:/usr/sbin
export PATH
IFMAP=/usr/local/etc/ifmap
DEBUG=YES
dev=$1
mac=$(ifconfig "$dev" | grep ether | awk '{print $2;}')
name=$(grep -i "^$mac" $IFMAP | awk '{print $2;}')
if [ $DEBUG = "YES" ]
then
    (
        echo "$0: $(date)"
        echo "    dev=$1"
        echo "    mac=$mac"
        echo "    name=$name"
        echo "    ifconfig \"$dev\" name \"$name\""
        echo "======"
    ) >>/tmp/ifmap.log
else
    [ -n "$name" ] && ifconfig "$dev" name "$name"
fi
