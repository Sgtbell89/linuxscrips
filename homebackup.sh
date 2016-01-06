#!/bin/bash
# for backup
cd /home

tar -cvf /var/tmp/homebackup.tar $USER

rm /var/tmp/homebackup.tar.gz > /dev/null

gzip /var/tmp/homebackup.tar

scp /var/tmp/homebackup.tar.gz administrator@10.1.10.71:~

