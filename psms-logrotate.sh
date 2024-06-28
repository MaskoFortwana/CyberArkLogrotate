#!/bin/bash
# This script deletes files older than 10 days from cyberark log folders
# Change mtime as needed
# create cronjob like this
# 0 23 * * * /home/scripts/psms-logrotate.sh
find /var/opt/CARKpsmp/logs/ -name "*.log" -mtime +10 -exec rm {} \;> /dev/null
find /var/opt/CARKpsmp/logs/old/ -name "*.log" -mtime +10 -exec rm {} \;> /dev/null
find /var/opt/CARKpsmp/logs/components/ -name "*.log" -mtime +10 -exec rm {} \;> /dev/null
find /var/opt/CARKpsmp/logs/components/old/ -name "*.log" -mtime +10 -exec rm {} \;> /dev/null
