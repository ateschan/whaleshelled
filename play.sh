!#/bin/bash

#Kills all previous docker containers

#containers=$(docker ps -q) &&
#docker kill $containers &&

cargo build --release &&
docker build -t whaleshell . && 
docker run -it --rm whaleshell /bin/bash 
