FROM openjdk:8

RUN apt-get update \
  && apt-get install -y --no-install-recommends vim ssh \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# sshd
RUN mkdir /run/sshd \
  && ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa \
  && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys \
  && chmod 0600 ~/.ssh/authorized_keys

# Hadoop
RUN wget -q -O - https://archive.apache.org/dist/hadoop/core/hadoop-3.3.2/hadoop-3.3.2.tar.gz | tar zxf -
RUN mv /hadoop-3.3.2 /hadoop
#RUN mkdir /hadoop/script
ENV PATH=/hadoop/bin:/hadoop/sbin:$PATH

# Pig
RUN wget -q -O - https://downloads.apache.org/pig/pig-0.17.0/pig-0.17.0.tar.gz | tar zxf -
RUN mv /pig-0.17.0 /pig
#RUN mkdir /pig/script
ENV PATH=/pig/bin:$PATH

# Hive
RUN wget -q -O - http://archive.apache.org/dist/hive/hive-3.1.3/apache-hive-3.1.3-bin.tar.gz | tar zxf -
RUN mv /apache-hive-3.1.3-bin /hive
#RUN mkdir /hive/script
ENV PATH=/hive/bin:$PATH

COPY docker-entrypoint.sh /hadoop
RUN chmod 700 /hadoop/docker-entrypoint.sh

ENTRYPOINT ["/hadoop/docker-entrypoint.sh"]
