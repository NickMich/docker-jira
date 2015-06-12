FROM ubuntu:14.04
MAINTAINER nickmich

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install wget
RUN apt-get -y install unzip
RUN apt-get -y install default-jre

RUN wget https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-6.4.5.zip
RUN unzip atlassian-jira-6.4.5.zip -d /opt
WORKDIR /opt/atlassian-jira-6.4.5-standalone/bin
RUN mkdir /opt/jira
ENV JIRA_HOME /opt/jira
RUN echo "$PWD/start-jira.sh && tail -f /opt/atlassian-jira-6.4.5-standalone/logs/catalina.out" > start.sh

EXPOSE 8080
EXPOSE 8005

CMD ["/bin/bash", "start.sh"]
