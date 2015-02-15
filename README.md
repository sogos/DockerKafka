# DockerKafka

docker run -d --link zookeeper:zookeeper --name kafkab -e BROKER_ID=1 -v /docker_volumes/kafka:/tmp/kafka-logs sogos/kafka

