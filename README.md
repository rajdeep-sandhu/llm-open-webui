# Local installation of Open WebUI

- This repository is a brief instruction list for installing Open WebUI locally.
- Version 0.7.2 (at the time of writing) requires Python 3.11.

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
- Shut down the server using `ctrl`  `c` in the terminal.

## Install as a tool

- This is the preferred way to run a local install.
- The same principles apply for `WEBUI_SECRET_KEY`.
- - `open-webui-tool.bat` sets the environment variables up and runs `uvx --python 3.11 open-webui@latest serve`.
- The server will be available at [http://localhost:8080](http://localhost:8080)
- Shut down the server using `ctrl`  `c` in the terminal.

## Install as a Docker container

- This is also the preferred way, as it keeps the app and its dependencies isolated from the host.
- `DATA_DIR` is set to `/app/backend/data` within the container, which uses `$HOME\open-webui\data` as a bind mount.
- `WEBUI_SECRET_KEY_FILE` is available to the startup script within the container and is set to `/app/backend/data/.webui_secret_key`. (NB The docker command cannot interpolate variables supplied by `-e`, so the full path needs to be specified instead of using `DATA_DIR`)
- `open-webui-docker-run.ps1` sets up the container and runs it.
- The server will be available at [http://localhost:3000](http://localhost:3000)
- To stop the server and container, use `docker container stop open-webui`
- To run the container again, use `docker container restart open-webui`
