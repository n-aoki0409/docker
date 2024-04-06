FROM openjdk:8

# pre-install
RUN apt-get update \
	&& apt-get install -y --no-install-recommends ssh psmisc \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

# hadoop user
RUN groupadd -r hadoop && useradd -r -g hadoop hadoop \
	&& mkdir -p /home/hadoop/.ssh

# sshd
RUN mkdir /run/sshd \
	&& ssh-keygen -t rsa -m PEM -P '' -f /home/hadoop/.ssh/id_rsa \
	&& cat /home/hadoop/.ssh/id_rsa.pub >> /home/hadoop/.ssh/authorized_keys \
	&& chmod 0600 /home/hadoop/.ssh/authorized_keys

# hadoop resources
COPY hadoop-3.3.6 /hadoop
COPY config/core-site.xml /hadoop/etc/hadoop/core-site.xml
COPY config/hadoop-env.sh /hadoop/etc/hadoop/hadoop-env.sh
COPY config/hdfs-site.xml /hadoop/etc/hadoop/hdfs-site.xml
COPY config/mapred-site.xml /hadoop/etc/hadoop/mapred-site.xml
COPY config/workers /hadoop/etc/hadoop/workers
COPY config/yarn-site.xml /hadoop/etc/hadoop/yarn-site.xml
COPY docker-entrypoint.sh /

# hadoop user authorization
RUN chown -R hadoop:hadoop /home/hadoop \
	&& chown -R hadoop:hadoop /run/sshd \
	&& chown -R hadoop:hadoop /etc/ssh \
	&& chown -R hadoop:hadoop /usr/sbin/sshd \
	&& chown -R hadoop:hadoop /hadoop \
	&& chown -R hadoop:hadoop /docker-entrypoint.sh \
	&& chmod 700 /docker-entrypoint.sh

ENV PATH=/hadoop/bin:/hadoop/sbin:$PATH

USER hadoop

ENTRYPOINT ["/docker-entrypoint.sh"]
