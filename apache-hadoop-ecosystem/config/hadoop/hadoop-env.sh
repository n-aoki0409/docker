export JAVA_HOME=/usr/local/openjdk-8
export HADOOP_OS_TYPE=${HADOOP_OS_TYPE:-$(uname -s)}
export HADOOP_HOME=/hadoop
export HADOOP_CONF_DIR=${HADOOP_HOME}/etc/hadoop
export HDFS_NAMENODE_USER="root"
export HDFS_DATANODE_USER="root"
export HDFS_SECONDARYNAMENODE_USER="root"