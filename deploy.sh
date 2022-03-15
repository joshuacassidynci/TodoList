#!/usr/bin/env bash
# Check if there is instance running with the image name we are deploying
CURRENT_INSTANCE=$(docker ps -a -q --filter ancestor="$IMAGE_NAME" --format="{{.ID}}")

# If an instance does exist stop the instance
if [ "$CURRENT_INSTANCE" ]
then
  docker rm $(docker stop $CURRENT_INSTANCE)
fi

# Pull down the instance from dockerhub
docker pull $IMAGE_NAME

# Check if a docker container exists with the name of $CONTAINER_NAME if it does remove the container
CONTAINER_EXISTS=$(docker ps -a | grep $CONTAINER_NAME)
if [ "$CONTAINER_EXISTS" ]
then
  docker rm $CONTAINER_NAME
fi

docker run -p 3000:3000 -d --name $CONTAINER_NAME $IMAGE_NAME
