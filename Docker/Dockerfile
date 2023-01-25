FROM ubuntu:18.04
MAINTAINER CW-B-W

EXPOSE 8585
EXPOSE 8484

RUN apt update && \
    apt install -y openjdk-8-jdk && \
    apt install -y maven && \
    apt install -y git && \
    apt install -y mysql-client && \
    rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 https://github.com/CW-B-W/MapleStory-v120-Server-Simulator.git && \
    cd MapleStory-v120-Server-Simulator && \
    mvn package && \
    cp target/tms120-1.0.0.jar dist/TMS120.jar && \
    mvn clean

ADD wz.tar /MapleStory-v120-Server-Simulator
RUN rm /MapleStory-v120-Server-Simulator/wz.tar

RUN sed -i 's/localhost/172\.22\.0\.3/g' /MapleStory-v120-Server-Simulator/Settings.ini

ADD start_services.sh /start_services.sh
CMD ["sh", "/start_services.sh"]