#!/bin/sh

i3status -c $HOME/.config/i3/i3status.conf | while :
do
    docker_running_containers=$(docker ps -q | wc -l)
    docker_version=$(docker --version | awk '{print $3}' | sed 's/,//g')
    docker_images=$(docker images -q | wc -l)

    read line
    echo "Docker 🐳 v$docker_version Running Containers: $docker_running_containers, Images: $docker_images | $line" || exit 1
done
