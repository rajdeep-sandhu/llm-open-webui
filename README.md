# Local installation of Open WebUI

- This repository is a brief instruction list for installing Open WebUI locally.
- Version 0.7.2 (at the time of writing) requires Python 3.11.
- First install and run will take long due to images/files being downloaded and environments being set up.
- Subsequent runs are quicker, but the server might still take up to 2-4 minutes to start.

- For all modes of installation, ensure the following:
  - The directory `%USERPROFILE%\open-webui\data` has already been created on the host.
  - To use Ollama, it needs to be installed separately. ALternatively, a combined image may be used to build the container.

## Install as a project

- This is for illustration only and is not the recommended method. Ideally, use the tool or docker approach. However, the project install has the advantage of not having to create an ephemeral environment on each tool run.
- Clone the repository.
- In the project root, run `uv sync` to set up the environment.
- `uv` is used to manage dependencies.
- If a `WEBUI_SECRET_KEY` environment variable is not provided, Open WebUI looks for `.webui_secret_key` in the current working directory. If not found, a new key file is created in this location.
- A new key file for an existing installation will limit access to data and settings. Therefore, the best place to locate `.webui_secret_key` is the data directory, which makes it easy for both the local and docker installations to use the same host directory.
- Set `DATA_DIR` to `$HOME\open-webui\data` or `%USERPROFILE%\open-webui\data`. Otherwise, data will be stored in the virtual environment and will be lost if the environment is deleted.
- Set `WEBUI_SECRET_KEY` to read the contents of `%DATA_DIR%\.webui_secret_key`. (NB `WEBUI_SECRET_KEY_FILE` is usable in Docker, but not a local install.)
- `open-webui-project.bat` sets these up and runs `uv run open-webui serve`.
- Ollama should be running to run local models.
- The server will be available at [http://localhost:8080](http://localhost:8080)
- Shut down the server using `ctrl`  `c` in the terminal.

## Run as a `uvx` tool

- This is the preferred way to run a local install compared with a project. It creates an isolated ephemeral environment. However, the disadvantage is the prolonged delay because the environment is created on each run as a tool.
- The same principles apply for `WEBUI_SECRET_KEY`.
- `open-webui-uvx.bat` sets the environment variables up and runs `uvx --python 3.11 open-webui@latest serve`.
- The server will be available at [http://localhost:8080](http://localhost:8080)
- Shut down the server using `ctrl`  `c` in the terminal.

## Install as a Docker container

- This is perhaps better than installing as a project or as a tool, as it keeps the app and its dependencies isolated from the host. The disadvantage is the overhead of running Docker to run the container.
- `DATA_DIR` is set to `/app/backend/data` within the container, which uses `$HOME\open-webui\data` as a bind mount.
- `WEBUI_SECRET_KEY_FILE` is available to the startup script within the container and is set to `/app/backend/data/.webui_secret_key`. (NB The docker command cannot interpolate variables supplied by `-e`, so the full path needs to be specified instead of using `DATA_DIR`)
- `open-webui-docker-run.ps1` sets up the container and runs it.
- The server will be available at [http://localhost:3000](http://localhost:3000)
- To stop the server and container, use `docker container stop open-webui`
- To run the container again, use `docker container restart open-webui`

## Install using Docker Compose

- Start the service in detached mode using `docker compose up -d`
- The server will be available at [http://localhost:3000](http://localhost:3000)
- Stop the service using `docker compose down`
