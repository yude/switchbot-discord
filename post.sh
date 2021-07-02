#!/bin/bash

json=$(/usr/bin/curl -s -X GET "https://api.switch-bot.com/v1.0/devices/${secrets.DEVICE_ID}/status" -H "Authorization: ${secrets.TOKEN}")
humid=$(echo $json | jq '.body.humidity')
temp=$(echo $json | jq '.body.temperature')

content="[$(date "+%Y/%m/%d %H:%M:%S")] 気温: ${temp}, 湿度: ${humid}"
curl -H "Content-Type: application/json" -X POST -d '{"username": "Switchbot", "content": "'"$content"'"}' ${secrets.URL}