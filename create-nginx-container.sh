#!/bin/bash

# This script pulls the Nginx image from Docker hub and runs the nginx container
# Simply give this script the execution permission "chmod +x script-name.sh"
# and run the script "./script-name.sh"


# Pull Nginx image
echo "Pulling Nginx image"
docker pull nginx

# Check if pull was successful
if [ $? -eq 0 ];
then
	echo "Nginx image pull successful"
else
	echo "Nginx image pull failed"
	exit 1
fi

# Run Docker container
echo "Running Docker container"
docker run -d -p 8080:80 --name my-nginx nginx

# Check if container is running
if docker ps | grep -q my-nginx; then
	echo "Nginx container is running and can be accessed at http://localhost:8080"
else
	echo "Failed to start Nginx container."
	exit 1
fi


