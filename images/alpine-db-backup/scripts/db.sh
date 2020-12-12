#!/bin/bash

databases=`mysql -u $DB_USER -h $DB_HOST -e "SHOW DATABASES;" | tr -d "| " | grep -v Database`

for db in $databases; do
    if [[ "$db" != "information_schema" ]] && [[ "$db" != "performance_schema" ]] && [[ "$db" != "mysql" ]] && [[ "$db" != _* ]] ; then
        echo "Dumping database: $db"
        mysqldump -u $DB_USER -h $DB_HOST --databases $db > $db.sql
    fi
done
