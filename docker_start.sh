#!/bin/bash
#Build and create as many node server as you wish
docker build -t node_calcul .;
echo "How many Node server do you wish ?"
read number
i=1
while((i <= number))
do
    docker run -p 4916$i:8080 --name node_calcul$i --volume /var/lib/docker/volumes/node/_data -d node_calcul |
        echo "Node server "$i " : state = operating"
    i=`expr $i + 1`
done

#Display all docker images running
docker ps
echo "Congrats, you have created "$number " node server"
