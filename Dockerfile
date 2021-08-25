FROM centos:7.9.2009

ARG BUILD_DATE
ARG VCS_REF

ENV JAVA_JDK="jdk-11.0.12"
ENV TOMCAT="apache-tomcat-9.0.52"

COPY ${JAVA_JDK}_linux-x64_bin.tar.gz /opt/

RUN \
  yum install wget tar glibc glibc-devel -y && \
  cd /opt && \
  tar xzf ${JAVA_JDK}_linux-x64_bin.tar.gz

ENV JAVA_HOME=/opt/${JAVA_JDK}
ENV PATH $PATH:$JAVA_HOME/bin

COPY ${TOMCAT}.tar.gz /opt/
RUN \
  cd /opt && \
  tar xzf ${TOMCAT}.tar.gz

EXPOSE 8080

WORKDIR  /opt/${TOMCAT}/bin/

CMD ["run"]

ENTRYPOINT ["./catalina.sh"]

