#!bin/bash


BROKER_ID=${BROKER_ID}
sed -i "s/XXX/$BROKER_ID/g" /opt/kafka/config/server.properties
cd /opt/kafka && bin/kafka-server-start.sh config/server.properties
