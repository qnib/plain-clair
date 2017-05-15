#!/bin/bash


mkdir -p /etc/clair
cat /opt/qnib/clair/etc/config.yaml | sed \
     -e "s/CLAIR_DB_HOST/${CLAIR_DB_HOST}/" \
 > /etc/clair/config.yaml
