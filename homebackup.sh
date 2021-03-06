#!/bin/bash
# for backup

echo "Available Home Folders"
ls /home
echo
echo "which home folder would you like to back up?"

read HOMEFOLDER

BACKUPDIR=/home
TIMESTAMP=$(date | awk '{ print $1"_"$2"_"$3"_"$6 }')
TARFILENAME="/var/tmp/$TIMESTAMP.$HOMEFOLDER.tar"
GZIPFILENAME="/var/tmp/$TARFILENAME.gz"
REMOTESERVER="10.1.10.71"
REMOTEUSER="administrator"
REMOTEDIR="~"
LOGFILE="/var/tmp/homebackuplog.txt"

cd $BACKUPDIR

tar -cf $TARFILENAME $HOMEFOLDER
gzip $TARFILENAME

rsync $GZIPFILENAME $REMOTEUSER@$REMOTESERVER:$REMOTEDIR
date >> $LOGFILE

echo "Backup complete"
