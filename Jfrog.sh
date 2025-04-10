#!/bin/bash



# 1. Add current user to the Docker group
# Adds your current user to the docker group so you can run Docker commands without needing sudo every time.
# You need to log out and log back in/run "newgrp docker" command for the group change to take effect.


sudo usermod -aG docker $USER
newgrp docker


# 2. Pull the Artifactory Docker image
# Downloads the latest Artifactory OSS Docker image from JFrog’s (legacy) registry.

docker pull docker.bintray.io/jfrog/artifactory-oss:latest


# 3. Create a directory for Artifactory data
# Creates a host directory where Artifactory will store its persistent data (configuration, repositories, metadata, etc.).

sudo mkdir -p /jfrog/artifactory


# 4. Change ownership of the data directory
#  Changes the ownership of /jfrog/ to the user ID 1030, which corresponds to the artifactory user inside the Docker container.

sudo chown -R 1030 /jfrog/


#  5. Run the Artifactory container

docker run --name artifactory -d \
  -p 8081:8081 -p 8082:8082 \
  -v /jfrog/artifactory:/var/opt/jfrog/artifactory \
  docker.bintray.io/jfrog/artifactory-oss:latest

