docker run -d `
  -p 3000:8080 `
  -e DATA_DIR=/app/backend/data `
  -e WEBUI_SECRET_KEY_FILE=/app/backend/data/.webui_secret_key `
  --add-host=host.docker.internal:host-gateway `
  -v "$HOME\open-webui\data:/app/backend/data" `
  --name open-webui `
  --restart always `
  ghcr.io/open-webui/open-webui:main