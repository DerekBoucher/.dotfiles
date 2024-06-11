#!/bin/sh

while [ 1 ]
do
    docker_running_containers=$(docker ps -q | wc -l)
    docker_version=$(docker --version | awk '{print $3}' | sed 's/,//g')
    docker_images=$(docker images -q | wc -l)
    current_volume_sink=$(pacmd list-sinks | grep -A 40 '*' | grep 'alsa.card_name' | sed 's/.*alsa.card_name = "\(.*\)"/\1/')

    display_protocol=$(echo $XDG_SESSION_TYPE)

    echo "🎧 $(current_volume_sink) | $(whoami) | $display_protocol | Docker 🐳 v$docker_version Running Containers: $docker_running_containers, Images: $docker_images" || exit 1
done
