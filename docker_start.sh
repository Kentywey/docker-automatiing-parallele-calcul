#!/bin/bash
#Build and create as many node server as you wish
docker build -t node_calcul .;
read -r -p "Voulez-vous un portainer ?[Y/n]" response
 response=${response,,} # tolower
 if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then
    docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v /opt/portainer:/data portainer/portainer
fi
echo "How many Node server do you wish ?"
read number
i=1
while((i <= number))
do
    docker run -p 4916$i:8080 --name node_calcul$i --volume /var/lib/docker/volumes/node$i/_data -d node_calcul | 
        echo "Node server "$i " : state = operating"
    i=`expr $i + 1`
done
#Display all docker images running
docker ps
echo "Congrats, you have created "$number " node server"
