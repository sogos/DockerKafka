# Dockerfile for rundeck
# https://github.com/jjethwa/rundeck
# Bump to 2.4.0

FROM debian:wheezy

MAINTAINER Thibault Cordier

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update && apt-get -qqy upgrade && apt-get -qqy install --no-install-recommends curl bash supervisor procps sudo ca-certificates openjdk-7-jre-headless openssh-client mysql-client pwgen && apt-get clean

ADD http://mir2.ovh.net/ftp.apache.org/dist/kafka/0.8.2.0/kafka_2.9.1-0.8.2.0.tgz /tmp/kafka_2.9.1-0.8.2.0.tgz
RUN mkdir -p /opt/kafka
RUN cd /opt/kafka && tar -xvf /tmp/kafka_2.9.1-0.8.2.0.tgz --strip 1
RUN rm -f /tmp/kafka_2.9.1-0.8.2.0.tgz
ADD server.properties /opt/kafka/config/server.properties
ADD run.sh /bin/run
RUN chmod +x /bin/run
#VOLUME  []

# Start Supervisor
ENTRYPOINT ["/bin/run"]
EXPOSE 9092
