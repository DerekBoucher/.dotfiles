#!/bin/sh

while [ 1 ]
do
    docker_running_containers=$(docker ps -q | wc -l)
    docker_version=$(docker --version | awk '{print $3}' | sed 's/,//g')
    docker_images=$(docker images -q | wc -l)

    display_protocol=$(echo $XDG_SESSION_TYPE)

    echo "$(whoami) | $display_protocol | Docker 🐳 v$docker_version Running Containers: $docker_running_containers, Images: $docker_images" || exit 1
done
