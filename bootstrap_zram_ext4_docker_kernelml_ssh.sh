#!/bin/bash

# - enable zram
# - convert ext3 to ext4
# - install git,elrepo,kernel-ml,htop,docker
# - disable ssh password logins
# - reboot

# base packages
yum install -y git

# enable zram
mkdir ~/git
git clone https://github.com/vaeth/zram-init.git ~/git/zram-init
cp ~/git/zram-init/sbin/zram-init /usr/sbin/zram-init
chmod +x  /usr/sbin/zram-init
cp -a ~/git/zram-init/systemd/system/* /usr/lib/systemd/system/
systemctl enable zram_swap
systemctl start zram_swap

# convert ext3 to ext4
sed -iE 's/ext3/ext4/g' /etc/fstab
sed -iE 's/defaults/noatime,defaults/g' /etc/fstab
tune2fs -O extents,uninit_bg,dir_index /dev/vda1
touch /forcefsck

# install elrepo repo
yum install -y yum-utils
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm
yum-config-manager --enable elrepo-kernel
yum-config-manager --enable elrepo-extras

# install packages
yum install -y kernel-ml htop docker
grub2-mkconfig -o /boot/grub2/grub.cfg

# setup sshd
echo "PermitRootLogin without-password" >> /etc/ssh/sshd_config
systemctl sshd restart

reboot
