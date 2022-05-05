export JAVA_HOME=/usr/local/openjdk-8
export HADOOP_OS_TYPE=${HADOOP_OS_TYPE:-$(uname -s)}
export HADOOP_HOME=/hadoop
export HADOOP_CONF_DIR=${HADOOP_HOME}/etc/hadoop
export YARN_NODEMANAGER_USER="root"
export YARN_RESOURCEMANAGER_USER="root"
export HDFS_NAMENODE_USER="root"
export HDFS_DATANODE_USER="root"
export HDFS_SECONDARYNAMENODE_USER="root"
export HDFS_JOURNALNODE_USER="root"
export HDFS_ZKFC_USER="root"
