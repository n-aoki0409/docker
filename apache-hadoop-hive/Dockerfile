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
RUN wget -q -O - https://archive.apache.org/dist/hadoop/core/hadoop-2.9.2/hadoop-2.9.2.tar.gz | tar zxf -
RUN mv /hadoop-2.9.2 /hadoop
COPY config/hadoop /hadoop/etc/hadoop/
ENV PATH=/hadoop/bin:/hadoop/sbin:$PATH
RUN hdfs namenode -format

# Hive
RUN wget -q -O - http://ftp.tsukuba.wide.ad.jp/software/apache/hive/hive-2.3.9/apache-hive-2.3.9-bin.tar.gz | tar zxf -
RUN mv /apache-hive-2.3.9-bin /apache-hive-bin
ENV HIVE_HOME=/apache-hive-bin PATH=/apache-hive-bin/bin:$PATH
COPY config/hive /apache-hive-bin/conf/

WORKDIR /root
COPY start /root/
RUN chmod 700 /root/start

CMD ["/root/start"]