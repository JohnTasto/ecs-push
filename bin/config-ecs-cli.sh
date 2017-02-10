#!/bin/bash

# Download, Install and Configure ecs-cli

source ./bin/env.sh

rm -rf ~/.ecs/config

# Download correct CLI for your OS
if [ "$(uname)" == "Darwin" ]; then
  # Get the Mac binaries
  curl -o ./bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-darwin-amd64-latest
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  #Get the L binaries
  curl -o ./bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest
fi
chmod +x ./bin/ecs-cli

./bin/ecs-cli configure \
  --region $AWS_REGION \
  --access-key $AWS_ACCESS_KEY \
  --secret-key $AWS_SECRET_KEY  \
  --cluster $ECS_CLUSTER \
  --compose-project-name-prefix " " \
  --compose-service-name-prefix " " \
  --cfn-stack-name-prefix " "
