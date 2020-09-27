FROM ubuntu:latest

RUN apt-get update --fix-missing
RUN apt-get install wget -y
RUN apt-get install default-jdk -y 
RUN apt-get install maven -y
RUN apt-get install gradle -y
RUN apt-get install git -y

# RUN wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | apt-key add -
# RUN sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

RUN useradd -ms /bin/bash jenkins
USER jenkins
WORKDIR /home/jenkins

RUN wget https://get.jenkins.io/war-stable/2.249.1/jenkins.war

EXPOSE 8080
CMD java -jar jenkins.war