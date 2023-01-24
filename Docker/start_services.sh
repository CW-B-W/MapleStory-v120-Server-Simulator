#!/bin/bash

service mysql restart

mysql -u root -e "use MapleStory" 1> /dev/null 2>& 1
if [ "$?" = "1" ]
then
    mysql -u root -e "create database MapleStory"
    # mysql -u root MapleStory < /root/sql/maplestory.sql
    mysql -u root MapleStory < /root/sql/tms.sql
    service mysql restart
fi

echo "OK"

tail -f /dev/null # prevent container from exiting