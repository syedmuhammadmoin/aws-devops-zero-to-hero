#!/bin/bash   
# Get the container IDs of all running containers
containerID=$(docker ps -q)

# Check if any containers are found
if [ -n "$containerID" ]; then
    echo "Removing the following containers:"
    echo "$containerID"
    # Remove all running containers
    docker rm -f $containerID
    echo "All running containers have been removed."
else
    echo "No running containers to remove."
fi

# Remove unused and dangling images
echo "Removing dangling Docker images..."
docker image prune -a -f
echo "Dangling Docker images have been removed."
