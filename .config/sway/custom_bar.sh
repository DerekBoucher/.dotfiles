#!/bin/sh

while [ 1 ]
do
    docker_running_containers=$(docker ps -q | wc -l)
    docker_version=$(docker --version | awk '{print $3}' | sed 's/,//g')
    docker_images=$(docker images -q | wc -l)
    current_volume_sink=$(pacmd list-sinks | grep -A 50 '*' | grep 'alsa.card_name' | sed 's/.*alsa.card_name = "\(.*\)"/\1/')

    if [ -z "$current_volume_sink" ]; then
        current_volume_sink=$(pactl list sinks | grep -A 50 '*' | grep 'bluez.alias' | sed 's/.*bluez.alias = "\(.*\)"/\1/')
    fi

    display_protocol=$(echo $XDG_SESSION_TYPE)
    power_profile=$(asusctl profile -p | awk 'END {print $NF}')
    asus_profile=$(supergfxctl -g)

    echo "Graphics: $asus_profile | 🔌 $power_profile | 🎧 $current_volume_sink | 👋 $(whoami) | $display_protocol | Docker 🐳 v$docker_version 📦 Containers: $docker_running_containers, Images: $docker_images" || exit 1
done
