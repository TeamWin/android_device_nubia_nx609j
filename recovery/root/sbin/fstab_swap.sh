#!/sbin/sh

touch /thisworked
# Swap fstab on SAR setups
mv /etc/twrp.fstab.sar /etc/twrp.fstab

exit 0