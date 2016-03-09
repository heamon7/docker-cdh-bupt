#!/bin/bash

export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_40
# heamon7
echo "Start MySQL"
/etc/init.d/mysql restart 

echo "Start Zookeeper"
service zookeeper-server restart

echo "Start HDFS"
bash -c 'for x in `cd /etc/init.d ; ls hadoop-hdfs-*` ; do sudo service $x restart ; done'

echo "Start Yarn"
service hadoop-yarn-resourcemanager restart
service hadoop-yarn-nodemanager restart
chmod -R 777 /var/log/hadoop-mapreduce
service hadoop-mapreduce-historyserver restart

echo "Start Oozie"
export OOZIE_URL=http://localhost:11000/oozie
service oozie restart

echo "Start Spark"
service spark-master restart
service spark-worker restart

echo "Start Kafka"
KAFKA_HOME=/home/kafka
sudo -u kafka nohup ${KAFKA_HOME}/kafka/bin/kafka-server-start.sh ${KAFKA_HOME}/kafka/config/server.properties > ${KAFKA_HOME}/kafka/kafka.log 2>&1 &

echo "Start Components"
service hue restart

service solr-server restart

nohup hiveserver2 &

bash -c 'for x in `cd /etc/init.d ; ls impala-*` ; do sudo service $x restart ; done'

service hbase-master restart
#service hbase-regionserver start
service hbase-thrift restart

echo "Start KMS"
service hadoop-kms-server restart

echo "Press Ctrl+P and Ctrl+Q to background this process."
echo 'Use exec command to open a new bash instance for this instance (Eg. "docker exec -i -t CONTAINER_ID bash"). Container ID can be obtained using "docker ps" command.'
echo "Start Terminal"
bash
echo "Press Ctrl+C to stop instance."
sleep infinity
