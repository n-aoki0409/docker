FROM confluentinc/cp-kafka-connect:7.0.1

RUN wget -q -O - http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-8.0.22.tar.gz | tar zxf -
RUN mv mysql-connector-java-8.0.22/mysql-connector-java-8.0.22.jar /etc/kafka-connect/jars
RUN rm -rf mysql-connector-java-8.0.22

RUN confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-mqtt:latest
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-avro-converter:latest