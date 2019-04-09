```yaml
version: "3.3"

services:

  db_backup:
    build: .
    image: eritikass/mysql-backup-cron
    volumes:
      - "./dump:/dump"
    environment:
      # database info
      MYSQL_USER: "user"
      MYSQL_PASSWORD: "pass"
      MYSQL_DATABASE: "database"
      MYSQL_HOST: "mysql"
      # backup config
      BACKUP_DIR: "/dump"


  mysql:
    image: mysql:5.7
    environment:
      MYSQL_ROOT_PASSWORD: "yes"
      MYSQL_USER: "user"
      MYSQL_PASSWORD: "pass"
      MYSQL_DATABASE: "database"
```
