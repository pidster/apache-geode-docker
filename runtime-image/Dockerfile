FROM aeonproject/java-jdk
MAINTAINER "Pid Builds <builds+docker@pidster.com>"

ENV DOWNLOAD_PATH http://mirror.catn.com/pub/apache/incubator/geode/1.0.0-incubating.M1
ENV GEODE_VERSION 1.0.0-incubating.M1

#####################################################################
# we need to download and install bash for the gfsh script
RUN apk update \
 && apk add --update \
    bash \
 && rm -rf /var/cache/apk/*

#####################################################################
# download, unpack, move to a sensible name and remove tarball
RUN curl -L $DOWNLOAD_PATH/apache-geode-$GEODE_VERSION.tar.gz -o apache-geode-$GEODE_VERSION.tar.gz \
 && tar -zxvf apache-geode-$GEODE_VERSION.tar.gz \
 && mv apache-geode-$GEODE_VERSION apache-geode \
 && rm apache-geode-$GEODE_VERSION.tar.gz

#####################################################################
# replace the tput command with a dubious empty alternative
RUN touch /apache-geode/bin/tput \
# && echo "#!/bin/sh -c echo 217" > /apache-geode/bin/tput \
 && chmod 755 /apache-geode/bin/tput

#####################################################################
# Set up env variables for Geode
ENV GEODE_HOME /apache-geode
ENV GEMFIRE ${GEODE_HOME}
ENV PATH ${PATH}:${GEODE_HOME}/bin

EXPOSE 8080 10334 40404 1099 7070

ENTRYPOINT [ "sh", "-c" ]
CMD [ "gfsh" ]
