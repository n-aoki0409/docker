FROM openjdk:8

RUN apt-get update \
  && apt-get install -y --no-install-recommends vim ssh \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /run/sshd \
  && ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa \
  && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys \
  && chmod 0600 ~/.ssh/authorized_keys

RUN wget -q -O - https://archive.apache.org/dist/hadoop/core/hadoop-3.3.1/hadoop-3.3.1.tar.gz | tar zxf -
RUN mv /hadoop-3.3.1 /hadoop
ENV PATH=/hadoop/bin:/hadoop/sbin:$PATH

RUN wget -q -O - https://dlcdn.apache.org/flink/flink-1.13.3/flink-1.13.3-bin-scala_2.12.tgz | tar zxf -
RUN mv /flink-1.13.3 /flink
RUN wget -P /flink/lib https://repo.maven.apache.org/maven2/org/apache/flink/flink-shaded-hadoop-2-uber/2.8.3-9.0/flink-shaded-hadoop-2-uber-2.8.3-9.0.jar

COPY config /hadoop/etc/hadoop/

RUN hdfs namenode -format

COPY start /hadoop
RUN chmod 700 /hadoop/start

CMD ["/hadoop/start"]
