#!/bin/bash


json=$(/usr/bin/curl -s -X GET "https://api.switch-bot.com/v1.0/devices/${DEVICE_ID}/status" -H "Authorization: ${TOKEN}")
humid=$(echo $json | jq '.body.humidity')
temp=$(echo $json | jq '.body.temperature')
date=$(date "+%Y/%m/%d %H:%M:%S")

content="気温: ${temp} ℃, 湿度: ${humid} %"
embed="https://mackerel.io/embed/public/embed/4mVIU29WCRVZgHUxQPzWsfXo953uxiAegbjDb83hTQ7szesCunwdpVkBIzhnLc9i.png?period=15m"
curl -H "Content-Type: application/json" -X POST -d '{"username": "'"$date"'", "content": "'"$content\r$embed"'"}' $URL
