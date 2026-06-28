#!bin/bash
#backup.sh backup /data/ harian dengan rotasi 7 hari
SRC=/data/
DEST=/backup/$(date '+%Y-%M-%d')
LOG=/var/log/backup.log
DATE=$(date '+%Y-%m-%d %H:%M')
RETENTION=7

#buat folder baru
mkdir -p $DEST

#jalankan proses backup
rsync -av --delete $SRC $DST >> LOG 2>&1
echo "$DATE backup selesai: $DEST" >> $LOG

$hapus backup lebih dari 7 hari
find /backup/ -maxdepth 1 -type d -mtime +$RETENTION -exce rm -rf {} \;
echo "DATE ROTASI Selesai: backup > 7 hari dihapus" >> $LOG
 