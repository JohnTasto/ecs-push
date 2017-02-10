#!/bin/bash

source ./bin/env.sh

# Stand up your cluster
./bin/ecs-cli up \
  --keypair "$AWS_KEY_PAIR" \
  --capability-iam \
  --size "$ECS_CLUSTER_SIZE" \
  --instance-type "$ECS_INSTANCE_TYPE"  \
  --port "$ECS_PORT"
