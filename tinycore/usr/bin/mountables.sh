#!/bin/sh
TEMP=/tmp/mountables$$
LIST=/tmp/mountables
sudo /usr/sbin/rebuildfstab
[ -f "$LIST" ] && rm -f "$LIST"
cat /etc/fstab | awk -F '/' '/\/mnt\// {print $3}' | awk '{ sub(/[ \t]+$/, ""); print }' | sort -r | awk 'a != $0; { a = $0 }' | sort > "$TEMP"
while read DEVICE; do

  # Exclude devices in this list
  if grep $DEVICE /opt/.xmnttool.lst; then
    # echo "EXCLUDED $DEVICE" >> /tmp/mounttable.log # DEBUG
    continue
  fi

  LABEL=""
  [ ${DEVICE:0:2} != "fd" ] && LABEL="$(getdisklabel "/dev/$DEVICE")"
  echo "$DEVICE"~"$LABEL" >> "$LIST"
  
done < "$TEMP"
rm "$TEMP"
