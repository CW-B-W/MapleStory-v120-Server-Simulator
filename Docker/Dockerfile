FROM ubuntu:18.04
MAINTAINER CW-B-W

EXPOSE 8585
EXPOSE 8484

RUN apt update && \
    apt install -y openjdk-8-jdk && \
    apt install -y maven && \
    apt install -y git

RUN git clone --depth 1 https://github.com/CW-B-W/MapleStory-v120-Server-Simulator.git && \
    cd MapleStory-v120-Server-Simulator && \
    mvn package && \
    cp target/tms120-1.0.0.jar dist/TMS120.jar

ADD wz.tar /MapleStory-v120-Server-Simulator


RUN apt update && \
    apt install -y libaio1 libaio-dev && \
    apt install -y mysql-server

# set MySQL encoding to UTF-8
RUN echo "default-character-set=utf8" >> /etc/mysql/conf.d/mysql.cnf && \
    echo "character-set-server=utf8" >> /etc/mysql/mysql.conf.d/mysqld.cnf

ADD sql /root/sql


# Change MySQL account to maplestory
RUN service mysql restart && \
    mysql -u root -e "CREATE USER 'maplestory'@'localhost' IDENTIFIED BY 'maplestory';" && \
    mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'maplestory'@'localhost';" && \
    service mysql stop && \
    sed -i 's/tms\.User          \= root/tms\.User          \= maplestory/g' MapleStory-v120-Server-Simulator/Settings.ini && \
    sed -i 's/tms.Pass          = /tms.Pass          = maplestory/g' MapleStory-v120-Server-Simulator/Settings.ini


VOLUME /var/lib/mysql

ADD start_services.sh /root/start_services.sh
CMD ["sh", "/root/start_services.sh"]