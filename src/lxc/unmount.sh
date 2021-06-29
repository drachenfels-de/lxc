#!/bin/sh
umount /usr/local/var/lib/lxc/lxc-api-reboot/rootfs/dev
umount /usr/local/var/lib/lxc/lxc-api-reboot/rootfs/proc/sys
umount /usr/local/var/lib/lxc/lxc-api-reboot/rootfs/proc/tty
umount /usr/local/var/lib/lxc/lxc-api-reboot/rootfs/proc/
umount /usr/local/var/lib/lxc/lxc-api-reboot/rootfs
umount /usr/local/lib/lxc/rootfs
rm -vrf /usr/local/var/lib/lxc/lxc-api-reboot/
