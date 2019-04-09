#!/bin/sh

date

DATE_STR=$(date +'%Y-%m-%d_%H-%M-%S')

FILENAME1="$BACKUP_DIR/$DATE_STR.sql"
FILENAME2="$BACKUP_DIR/_dump.sql"

mysqldump -h $MYSQL_HOST -u $MYSQL_USER -p"$MYSQL_PASSWORD" $MYSQL_DATABASE > "$FILENAME1"

cp "$FILENAME1" "$FILENAME2"
