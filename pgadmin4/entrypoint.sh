#!/bin/bash
set -e

if [ "$1" == "/usr/local/bin/python" ]; then
    if [ ! -s "/root/.pgadmin/pgadmin4.db" ]; then
        expect -c "spawn /usr/local/bin/python /usr/local/lib/python3.5/site-packages/pgadmin4/setup.py;expect \"Email address:\";send \"$PGADMIN_USER\n\";expect \"Password:\";send \"$PGADMIN_PASSWORD\n\";expect \"Retype password:\";send \"$PGADMIN_PASSWORD\n\";expect eof;exit"
    fi
    exec /usr/local/bin/python /usr/local/lib/python3.5/site-packages/pgadmin4/pgAdmin4.py "$@"
fi

exec "$@"
