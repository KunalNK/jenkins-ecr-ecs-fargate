#!/bin/bash
aws ecr delete-repository \
    --repository-name jenkins-cicd \
    --force
    
aws iam --region ap-south-1 create-role --role-name ecsTaskExecutionRole \
--assume-role-policy-document file://task-execution-assume-role.json

aws iam --region ap-south-1 attach-role-policy --role-name ecsTaskExecutionRole \
--policy-arn arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy

ecs-cli configure --cluster tutorial --default-launch-type FARGATE \
--config-name tutorial --region ap-south-1

ecs-cli configure profile --access-key $AWS_ACCESS_KEY_ID \
--secret-key $AWS_SECRET_ACCESS_KEY \
--profile-name tutorial-profile

ecs-cli up --cluster-config tutorial --ecs-profile tutorial-profile

ecs-cli compose --project-name tutorial service up \
--create-log-groups --cluster-config tutorial \
--ecs-profile tutorial-profile

ecs-cli compose --project-name tutorial service ps \
--cluster-config tutorial --ecs-profile tutorial-profile