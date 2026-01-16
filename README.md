# Local installation of Open WebUI

- This repository is a brief instruction list for installing Open WebUI locally.

## Install as a project

- This is for illustration only and is not the recommended method. Ideally, use the tool or docker approach.
- `uv` is used to manage dependencies.
- If a `WEBUI_SECRET_KEY` environment variable is not provided, Open WebUI looks for `.webui_secret_key` in the current working directory. If not found, a new key file is created in this location.
- A new key file for an existing installation will limit access to data and settings. Therefore, the best place to locate `.webui_secret_key` is the data directory, which makes it easy for both the local and docker installations to use the same host directory.
- Set `DATA_DIR` to `$HOME\open-webui\data` or `%USERPROFILE%\open-webui\data`.
- Set `WEBUI_SECRET_KEY` to read the contents of `%DATA_DIR%\.webui_secret_key`. (NB `WEBUI_SECRET_KEY_FILE` is usable in Docker, but not a local install.)
- `open-webui-project.bat` sets these up and runs `uv run open-webui serve`.
- Ollama should be running to run local models.
- The server will be available at [http://localhost:8080](http://localhost:8080)
