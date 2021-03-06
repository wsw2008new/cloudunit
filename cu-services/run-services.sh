#!/bin/bash

CONT_NAME=(java tomcat-6 tomcat-7 tomcat-8)
IMAGE_NAME=(cloudunit/java cloudunit/tomcat-6 cloudunit/tomcat-7 cloudunit/tomcat-8)
GIT_TAG=latest


for i in 0 1 2 3
do
	docker ps -a | grep ${CONT_NAME[$i]} | grep -q ${IMAGE_NAME[$i]}
	return=$?
	if [ "$return" -eq "0" ]; then
		echo -e "\nThe docker container ${CONT_NAME[$i]} has already been launched.\n"
	else
		echo -e "\nLaunching the docker container ${CONT_NAME[$i]}.\n"
		docker run --name ${CONT_NAME[$i]} ${IMAGE_NAME[$i]}:$GIT_TAG
	fi
done
