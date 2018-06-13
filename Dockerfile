#.dockerignore Prevent from overwritting modules 
#Carbon is LTS version of node
FROM node:latest
#FROM debian:latest

#Create the app directory
WORKDIR /docker-automating-parallel-calcul/app


#RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
# update repos RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
#RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
#RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
#RUN apt-get update
# install java RUN apt-get install oracle-java8-installer -y
#RUN apt-get clean
#ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

#Install application dependencies
COPY package*.json ./

#Install PROTOBUF
RUN npm install protobufjs
RUN npm install java
RUN npm install

COPY . .

#Define listening port
EXPOSE 8080

#Run the NODEJS server
CMD ["npm", "start"]
