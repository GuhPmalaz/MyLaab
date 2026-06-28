#!bin/bash
#disk-monitor.sh - untuk cek penggunaan disk dan alert jika >80%
THRESHOLD=80
LOG=/var/log/disk-monitor.log
DATE=$(date '+%Y-%m-%d $H:%M')

df -h |grep '^/dev' | while read line; do
 USAGE=$(echo $line |awk '{print $5}' tr -d '%')
 MOUNT=$(echo $line |awk '{print $6}') 
 if ($USAGE -ge $THRESHOLD); then 
  echo "$DATE WARNINGG: $MOUNT usage ${USAGE}%" >> $LOG
else
  echo "$DATE OK: $MOUNT usage ${USAGE}" >> LOG
 fi
