# backup-mongo
A simple Docker container to create an encrypted backup of mongodb, and save it to S3.

### Backup MongoDB

```
docker run \
        --rm \
        -v ~/.aws:/aws \
        --link mongo:mongo \
        -e ENC_KEY=encryption_string \
        -e BUCKET=s3://bucket.example.com \
        hyperboloide/backup-mongo \
        backup
```

### Restore MongoDB

```
docker run \
        --rm -ti \
        -v ~/.aws:/aws \
        --link mongo:mongo \
        -e ENC_KEY=encryption_string \
        -e BUCKET=s3://bucket.example.com \
        hyperboloide/backup-mongo \
        restore
```
