#!/bin/sh

source .env

json=$(/usr/bin/curl -s -X GET "https://api.switch-bot.com/v1.0/devices/${DEVICE_ID}/status" -H "Authorization: ${TOKEN}")
humid=$(echo $json | jq '.body.humidity')
temp=$(echo $json | jq '.body.temperature')
date=$(date "+%Y/%m/%d %H:%M:%S")

content="気温: ${temp} ℃, 湿度: ${humid} %"
curl -H "Content-Type: application/json" -X POST -d '{"username": "'"$date"'", "content": "'"$content"'"}' $WEBHOOK_URL
