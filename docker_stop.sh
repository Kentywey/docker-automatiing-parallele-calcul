#!/bin/bash
#Clean docker node_calcul
echo "How many node server did you create?"
read number
i=1
while((i < number))
do
    docker stop node_calcul$i | echo "Node server " $node_calcul$i" : Stopped"
    docker rm node_calcul$i | echo "Node server "$node_calcul$i" : Deleted"
    i=`expr $i + 1`
done

docker ps
echo "Congrats, you have no more Node docker images running"
