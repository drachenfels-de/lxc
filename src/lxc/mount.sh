#!/bin/sh
{
cat <<EOF
mkdir /tmp/foo
echo $(date) blubberbla > /tmp/foo/hello.txt
mount --bind /tmp/foo/ /mnt/home/mount/
mount --bind /tmp/foo/ /mnt/tmp/mount/
EOF
} | lxc-attach -n test-mount-propagation /bin/sh


find /home/test-mount-propagation
find /tmp/test-mount-propagation
cat /tmp/test-mount-propagation/mount/hello.txt


{
cat <<EOF
umount /mnt/home/mount/
umount /mnt/tmp/mount/
EOF
} | lxc-attach -n test-mount-propagation /bin/sh

lxc-stop -k -n test-mount-propagation
