#!/bin/bash
ecs-cli compose --project-name tutorial service down \
--cluster-config tutorial --ecs-profile tutorial-profile

ecs-cli down --force --cluster-config tutorial \
--ecs-profile tutorial-profile

aws ecr delete-repository \
    --repository-name image_name \
    --force