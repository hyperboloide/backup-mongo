#!/bin/sh

set -e

aws s3 ls $BUCKET/$BUCKET_DIR/

echo "Select a backup:"

read DEST

aws s3 cp "$BUCKET/$BUCKET_DIR/$DEST" - | \
    openssl enc -aes-256-cbc -d -k $ENC_KEY | \
    gunzip | \
    mongorestore --host $MONGO_HOST --port $MONGO_PORT --archive
