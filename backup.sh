#!/bin/sh

set -e

DEST=mongo-backup-`date +%Y-%m-%d-%H:%M`.gz.enc
echo $BUCKET/$BUCKET_DIR/$DEST

mongodump --host $MONGO_HOST --port $MONGO_PORT --archive \
    | gzip \
    | openssl enc -aes-256-cbc -salt -k $ENC_KEY \
    | aws s3 cp - $BUCKET/$BUCKET_DIR/$DEST
