#!/bin/bash

count=`curl -u username:${GIT_AUTH_TOKEN} https://api.github.com/notifications | jq '. | length'`

echo '{"text":'$count',"tooltip":"$tooltip","class":"$class"}'
