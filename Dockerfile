FROM dockerfile/java:oracle-java8

ENV ACTIVEMQ_VERSION 5.11.1
ENV ACTIVEMQ_HOME /opt/activemq

RUN curl http://archive.apache.org/dist/activemq/$ACTIVEMQ_VERSION/apache-activemq-$ACTIVEMQ_VERSION-bin.tar.gz | tar -xz

RUN mv apache-activemq-$ACTIVEMQ_VERSION $ACTIVEMQ_HOME

EXPOSE 61612 61613 61616 8161

CMD $ACTIVEMQ_HOME/bin/activemq console
