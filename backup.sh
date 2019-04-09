#!/bin/sh

date

touch /tmp/xx123

DATE_STR=$(date +'%Y-%m-%d_%H-%M-%S')

FILENAME1="$BACKUP_DIR/${BACKUP_PREFIX}_$DATE_STR.sql"
FILENAME2="$BACKUP_DIR/${BACKUP_PREFIX}_dump.sql"

echo $FILENAME1
echo $FILENAME2

mysqldump -h $MYSQL_HOST -u $MYSQL_USER -p"$MYSQL_PASSWORD" $MYSQL_DATABASE > "$FILENAME1"

cat "$FILENAME1" > "$FILENAME2"

# cleanup old files

cd $BACKUP_DIR
find . -type f \( ! -iname "*_dump.sql" \) -mmin +55 -delete
