#!/bin/bash

# Tag, Push and Deploy only if it's not a pull request

source ./bin/env.sh

if [ "$TRAVIS_BRANCH" == "master" ]; then
  echo "docker login..."
  docker login --username "$DOCKER_USERNAME" --password "$DOCKER_PASSWORD"
  echo "docker push..."
  docker push "$DOCKER_REPO"/"$DOCKER_WEB_IMAGE":latest
  echo "ecs-cli compose..."
  ./bin/ecs-cli compose --project-name "$ECS_PROJECT" --file ecs-deploy.yml service up;
fi
