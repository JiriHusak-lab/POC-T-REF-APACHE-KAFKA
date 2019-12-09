FROM centos
RUN mkdir -p /opt/kafka \
  && cd /opt/kafka \
  && yum -y install java-1.8.0-openjdk-headless tar \
  && curl -s https://www.mirrorservice.org/sites/ftp.apache.org/kafka/2.3.0/kafka_2.12-2.3.0.tgz  | tar -xz --strip-components=1 \
  && yum clean all
  
COPY kafka-liveness-chk.sh /opt/kafka/kafka-liveness-chk.sh

RUN chmod -R a=u /opt/kafka \
  && chmod 755 /opt/kafka/kafka-liveness-chk.sh

WORKDIR /opt/kafka/

VOLUME /tmp/kafka-logs /tmp/zookeeper

EXPOSE 2181 2888 3888 9092
