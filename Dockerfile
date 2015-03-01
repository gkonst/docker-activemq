FROM ubuntu:14.04

RUN rm /etc/apt/sources.list
RUN echo deb http://archive.ubuntu.com/ubuntu trusty main universe multiverse > /etc/apt/sources.list

RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
RUN apt-get update
RUN apt-get install oracle-java8-installer curl -y
RUN update-java-alternatives -s java-8-oracle
RUN apt-get install oracle-java8-set-default

RUN curl http://archive.apache.org/dist/activemq/5.11.1/apache-activemq-5.11.1-bin.tar.gz | tar -xz

EXPOSE 61612 61613 61616 8161

CMD apache-activemq-5.11.1/bin/activemq start
