#!/bin/bash

set -e
echo 'Starting backup of MTNA data...'

TIMESTAMP=`date +%b-%d-%y`
FILENAME="backup-$TIMESTAMP$1.tar.gz"
SRC='/var/archives/data/.db.json'
BACKUPS_DIR='/var/archives/backups'

tar -cpzf $BACKUPS_DIR/$FILENAME $SRC

echo "Created new backup in $BACKUPS_DIR/$FILENAME"
