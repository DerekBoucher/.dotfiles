#!/bin/sh

while [ 1 ]
do
    docker_running_containers=$(docker ps -q | wc -l)
    docker_version=$(docker --version | awk '{print $3}' | sed 's/,//g')
    docker_images=$(docker images -q | wc -l)
    default_sink=$(pactl info | grep 'Default Sink' | sed 's/Default\ Sink:\ //')
    sink_name=$(pactl list sinks | grep -A 1 $default_sink | grep "Description" | sed 's/Description:\ //g' | sed 's/\t//g')

    default_source=$(pactl info | grep 'Default Source' | sed 's/Default\ Source:\ //')
    source_name=$(pactl list sources | grep -A 1 $default_source | grep "Description" | sed 's/Description:\ //g' | sed 's/\t//g')

    display_protocol=$(echo $XDG_SESSION_TYPE)
    if [[ "$display_protocol" == "wayland" ]]; then
        display_protocol+=' '
    fi

    brightness=""
    if ! [[ $(which brightnessctl) =~ "not found"  ]]; then
        brightness="| $(brightnessctl --device=amdgpu_bl0 | grep -i current | sed 's/\t//')"  
    fi

    power_profile=$(asusctl profile -p | awk 'END {print $NF}')
    asus_profile=$(supergfxctl -g)

    echo "Graphics: $asus_profile | 🔌 $power_profile | 🎧 $sink_name | 🎤 $source_name | 👋 $(whoami) | $display_protocol | Docker 🐳 v$docker_version 📦 Containers: $docker_running_containers, Images: $docker_images $brightness" || exit 1

done
