#!/bin/bash


# command to run sonarqube in detach mode in docker 

docker run -d --name sonarqube -p 9000:9000 -p 9092:9092 sonarqube

