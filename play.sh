!#/bin/bash

#Kills all previous docker containers

#containers=$(docker ps -q) &&
#docker kill $containers &&

cargo build --release &&
docker build -t whaleshelled . && 
docker run -it --rm whaleshelled /bin/bash 
