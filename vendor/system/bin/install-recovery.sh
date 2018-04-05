#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 19156992 694b4ac8d6d913d55f95d535f993a324f33b20b9 13176832 f950853685306391b3ec4a51e0982be08f50f0d7
fi
if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:19156992:694b4ac8d6d913d55f95d535f993a324f33b20b9; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:13176832:f950853685306391b3ec4a51e0982be08f50f0d7 EMMC:/dev/block/bootdevice/by-name/recovery 694b4ac8d6d913d55f95d535f993a324f33b20b9 19156992 f950853685306391b3ec4a51e0982be08f50f0d7:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
