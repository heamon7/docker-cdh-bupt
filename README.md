docker-cloudera-quickstart
==========================

Docker Cloudera Quick Start Image

Cloudera Hadoop 5 (CDH5)


Now you can run the Cloudera Quick Start image without all the overhead of a Virtual Machine. Just use docker-cloudera-quickstart Image.


Based on Ubuntu 14.04 (Trusty LTS) 

Works with Cloudera CDH 5

* UPDATED FOR LATEST VERSION - CDH5.4.8


* Under development. 


# Instructions
## Install Docker in Ubuntu Wheezy
To install Docker in your Ubuntu Wheezy, simply use the following command:

```
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo mkdir /etc/apt/sources.list.d/ && sudo sh -c  "echo \"deb https://apt.dockerproject.org/repo debian-wheezy main\" >> /etc/apt/sources.list.d/docker.list"
sudo apt-get install apt-transport-https && sudo apt-get update && sudo apt-get install docker-engine  
sudo service docker start  
sudo docker run hello-world
sudo gpasswd -a ${USER} docker
sudo service docker restart && newgrp docker
```

## Install CDH 
To install the docker-cloudera-quickstart from docker-hub, simply use the following command:
「AWS 开发环境」

```
docker pull registry-aws.in.zhihu.com/teamdata/cdh:v3
```

「AWS 生产环境」

```
docker pull registry.in.zhihu.com/teamdata/cdh:v3
```

## Use
To start an instance in BACKGROUND (as daemon):

```
docker run -it -d -P --name cdh registry-aws.in.zhihu.com/teamdata/cdh:v3
```

To open more terminal instances for the running instance:

```
docker ps
docker exec -it cdh bash 
```

# Links

[Pull the image on Docker Hub](https://registry.hub.docker.com/u/caioquirino/docker-cloudera-quickstart/)

[Github page](https://github.com/caioquirino/docker-cloudera-quickstart)


# Checklist of components:

Apache Hadoop (Common, HDFS, MapReduce, YARN)

Apache HBase

Apache ZooKeeper

Apache Oozie

Apache Hive

Hue (Apache licensed)

Apache Flume

Cloudera Impala (Apache licensed)

Apache Sentry

Apache Sqoop

Cloudera Search (Apache licensed)

Apache Spark

[Cloudera Documentation](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/)

# Debugging In Docker

## Changing Debug Delay
If a samza job dies, its log files get deleted immediately.  To allow them to hang around
for ten minutes, add the following to /etc/hadoop/conf/yarn-site.xml :
 
	  <property>
	    <description>seconds after app finishes before app's files and logs deleted</description>
	    <name>yarn.nodemanager.delete.debug-delay-sec</name>
	    <value>600</value>
	  </property>

Then you can find the logs, e.g.: `sudo -E ./yarnlogs.bash Matcher`
# Please report any issue or feedback if possible.
