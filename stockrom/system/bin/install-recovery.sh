#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 9984000 c412704ff3bac8336ef8072d7778daa20214adcc 7460864 873ec50612a96fccb7bb5550fb89cede48affdc4
fi

if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:9984000:c412704ff3bac8336ef8072d7778daa20214adcc; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:7460864:873ec50612a96fccb7bb5550fb89cede48affdc4 EMMC:/dev/block/bootdevice/by-name/recovery c412704ff3bac8336ef8072d7778daa20214adcc 9984000 873ec50612a96fccb7bb5550fb89cede48affdc4:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
