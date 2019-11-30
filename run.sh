#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
cd ./backend/Web-develop-backend-7-semester/
/usr/bin/mvn package
cd ../../
docker-compose build
docker-compose up
