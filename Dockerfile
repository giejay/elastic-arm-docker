FROM debian:10

#WORKDIR /tmp

RUN apt-get update && apt-get install openjdk-11-jdk -y && \
apt-get install apt-transport-https jruby -y && \
apt-get install texinfo build-essential ant git -y

RUN apt-get install wget -y
RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.10.1-no-jdk-amd64.deb

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-armhf

RUN echo $JAVA_HOME

RUN export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-armhf && echo $JAVA_HOME && dpkg -i --force-all --ignore-depends=libc6 elasticsearch-7.10.1-no-jdk-amd64.deb

CMD ["/usr/share/elasticsearch/bin/elasticsearch"]
#CMD ["/usr/share/logstash/bin/logstash -f /etc/logstash/conf.d -l /var/log/logstash --log.level=debug --path.settings=/etc/logstash"]