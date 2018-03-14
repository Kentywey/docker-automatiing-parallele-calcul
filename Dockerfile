#.dockerignore Prevent from overwritting modules 
#Carbon is LTS version of node
FROM node:carbon 

#Create the app directory
WORKDIR /docker-automating-parallel-calcul/app

#Install application dependencies
COPY package*.json ./

#Install PROTOBUF
RUN npm install protobufjs
RUN npm install

COPY . .

#Define listening port
EXPOSE 8080

#Run the NODEJS server
CMD ["npm", "start"]
