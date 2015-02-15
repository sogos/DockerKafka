# DockerKafka

docker run -d --link zookeeper:zookeeper --name kafka -v /docker_volumes/kafka:/tmp/kafka-logs sogos/kafka
