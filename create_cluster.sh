#!/bin/bash
ecs-cli configure --cluster tutorial --default-launch-type FARGATE \
--config-name tutorial --region ap-south-1

ecs-cli configure profile --access-key $AWS_ACCESS_KEY_ID \
--secret-key $AWS_SECRET_ACCESS_KEY \
--profile-name tutorial-profile

ecs-cli up --cluster-config tutorial --ecs-profile tutorial-profile

sleep 60

ecs-cli compose --project-name tutorial service up \
--create-log-groups --cluster-config tutorial \
--ecs-profile tutorial-profile

ecs-cli compose --project-name tutorial service ps \
--cluster-config tutorial --ecs-profile tutorial-profile