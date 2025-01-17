#!/bin/bash

nc -z "$NEXTCLOUD_HOST" 9000 || exit 0
nc -z localhost 8000 || exit 1
if [ "$APACHE_PORT" != '443' ]; then
    nc -z localhost "$APACHE_PORT" || exit 1
else
    nc -z "$NC_DOMAIN" "$APACHE_PORT" || exit 1
fi
