#!/bin/bash

mysql -w -h 172.22.0.3 -u root -e "use MapleStory" 1> /dev/null 2>& 1
if [ "$?" = "1" ]
then
    mysql -h 172.22.0.3 -u root -e "create database MapleStory"
    # mysql -h 172.22.0.3 -u root MapleStory < /root/sql/maplestory.sql
    mysql -h 172.22.0.3 -u root MapleStory < /MapleStory-v120-Server-Simulator/sql/tms.sql
fi

cd /MapleStory-v120-Server-Simulator && ./Launcher.sh