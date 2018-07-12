#!/bin/bash

echo ECS_CLUSTER=fargate-demo >> /etc/ecs/ecs.config
sudo rm -rf /var/lib/ecs/data/*
sudo start ecs