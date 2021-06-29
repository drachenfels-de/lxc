#!/bin/sh -eu

rm -rf /tmp/test-mount-propagation /home/test-mount-propagation
mkdir -p /tmp/test-mount-propagation/mount
mkdir -p /home/test-mount-propagation/mount

n="test-mount-propagation"
lxc-create -n $n -t busybox
cat >>/usr/local/var/lib/lxc/$n/config <<EOF
lxc.rootfs.options = rshared
lxc.ephemeral = 1
lxc.init.cmd = cat /dev/zero
lxc.console.path = none
lxc.mount.entry = /home/test-mount-propagation mnt/home none bind,shared,create=dir 0 0
lxc.mount.entry = /tmp/test-mount-propagation mnt/tmp none bind,shared,create=dir 0 0
EOF
mkdir -vp /usr/local/var/lib/lxc/$n/rootfs/mnt/pod

lxc-start -F -n $n -l DEBUG -o /dev/stdout
