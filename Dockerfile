FROM registry.access.redhat.com/jboss-webserver-3/webserver30-tomcat8-openshift:latest

LABEL io.k8s.description="base image for all  apps" \
      io.k8s.display-name="Tomcat7 STI" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,java,tomcat8" \
      io.openshift.s2i.scripts-url="image:///usr/local/s2i"

USER root

#ADD settings.xml /home/jboss/.m2/settings.xml
RUN curl  http://archive.apache.org/dist/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.zip  -o  /tmp/apache-maven-3.2.5-bin.zip
RUN mkdir -p /opt/poi
RUN unzip /tmp/apache-maven-3.2.5-bin.zip -d /opt/poi
RUN chmod -R 755 /opt/poi/apache-maven-3.2.5
RUN ln -sf /opt/poi/apache-maven-3.2.5/bin/mvn /usr/bin/mvn
USER jboss

