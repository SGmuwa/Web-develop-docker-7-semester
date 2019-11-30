#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo Please run as root
  exit
fi
git submodule update --recursive
if [[ $? -ne 0 ]]; then
  echo Failed to update submodules. Try fix...
  git reset --hard HEAD
  echo [submodule "frontend/Web-develop-frontend-7-semester"] > .gitmodules
  echo 	path = frontend/Web-develop-frontend-7-semester >> .gitmodules
  echo 	url = https://github.com/SGmuwa/Web-develop-frontend-7-semester.git >> .gitmodules
  echo [submodule "backend/Web-develop-backend-7-semester"] >> .gitmodules
  echo 	path = backend/Web-develop-backend-7-semester >> .gitmodules
  echo 	url = https://github.com/SGmuwa/Web-develop-backend-7-semester.git >> .gitmodules
  git submodule update --recursive
  git reset --hard HEAD
fi
cd ./backend/Web-develop-backend-7-semester/
/usr/bin/mvn --version
if [[ $? -ne 0 ]]; then
  echo Maven problem.
  echo Install apt: sudo apt install maven
  echo or visit https://maven.apache.org/download.cgi
else
  #/usr/bin/mvn package
fi
cd ../../
#docker-compose build
#docker-compose up
echo good bye.
