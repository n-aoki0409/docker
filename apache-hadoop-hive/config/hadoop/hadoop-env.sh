export JAVA_HOME=/usr/local/openjdk-8
export HADOOP_OPTS="${HADOOP_OPTS} -XX:-PrintWarnings -Djava.net.preferIPv4Stack=true"
export HADOOP_OS_TYPE=${HADOOP_OS_TYPE:-$(uname -s)}
export HADOOP_SSH_OPTS="-o StrictHostKeyChecking=no"
export HDFS_NAMENODE_USER="root"
export HDFS_DATANODE_USER="root"
export HDFS_SECONDARYNAMENODE_USER="root"