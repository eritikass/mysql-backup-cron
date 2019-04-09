#!/bin/sh

date

touch /tmp/xx123

DATE_STR=$(date +'%Y-%m-%d_%H-%M-%S')

FILENAME1="$BACKUP_DIR/$DATE_STR.sql"
FILENAME2="$BACKUP_DIR/_dump.sql"

echo $FILENAME1
echo $FILENAME2

mysqldump -h $MYSQL_HOST -u $MYSQL_USER -p"$MYSQL_PASSWORD" $MYSQL_DATABASE > "$FILENAME1"

cp "$FILENAME1" "$FILENAME2"
