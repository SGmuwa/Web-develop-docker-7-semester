#!/bin/bash
git submodule update --recursive --init
/usr/bin/mvn --version
if [[ $? -ne 0 ]]; then
  echo Maven problem.
  echo Install apt: sudo apt install maven
  echo or visit https://maven.apache.org/download.cgi
  exit
fi
cd ./backend/Web-develop-backend-7-semester/
/usr/bin/mvn package
cd ../../
docker-compose --version
if [[ $? -ne 0 ]]; then
  echo docker-compose problem.
  echo Install apt: sudo apt install docker-compose
  echo or visit https://docs.docker.com/compose/install/
  exit
fi
sudo docker-compose build
sudo docker-compose up
echo good bye.
