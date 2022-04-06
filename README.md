# switchbot-discord
🌅 Send the environment of my room to Discord Text Channel via Webhook periodically

## Setup
* This app runs with Docker Compose.
1. Copy files from this repository.
```
curl -o .env https://raw.githubusercontent.com/yude/switchbot-discord/main/.env.sample \
     -o https://raw.githubusercontent.com/yude/switchbot-discord/main/docker-compose.yml
```
2. Insert your credentials into `.env`.
3. Run the app.
```sh
docker-compose up -d
```

## License
MIT License