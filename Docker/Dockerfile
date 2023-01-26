FROM ubuntu:18.04
MAINTAINER CW-B-W

EXPOSE 8585
EXPOSE 8484

RUN apt update && \
    apt install -y openjdk-8-jdk && \
    apt install -y maven && \
    apt install -y git && \
    apt install -y mysql-client && \
    apt install -y wget && \
    rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 https://github.com/CW-B-W/MapleStory-v120-Server-Simulator.git && \
    cd MapleStory-v120-Server-Simulator && \
    mvn package && \
    cp target/tms120-1.0.0.jar dist/TMS120.jar && \
    mvn clean

RUN cd /MapleStory-v120-Server-Simulator && \
    wget https://github.com/CW-B-W/MapleStory-v120-Server-Simulator/raw/wz/wz.tar && \
    tar -xf wz.tar && \
    rm /MapleStory-v120-Server-Simulator/wz.tar

ADD start_services.sh /start_services.sh
CMD ["sh", "/start_services.sh"]