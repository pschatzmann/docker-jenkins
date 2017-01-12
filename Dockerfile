FROM       jenkins:alpine
MAINTAINER Phil Schatzmann <pschatzmann@gmail.com>
USER		   root
RUN        apk add --update docker 
RUN 		   MAVEN_VERSION=3.3.3 \
 			&& cd /usr/share \
 			&& wget -q http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz -O - | tar xzf - \
 			&& mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
 			&& ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV 		   MAVEN_HOME /usr/share/maven
