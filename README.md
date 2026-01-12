# Local installation of Open WebUI

- `uv` is used to manage dependencies.
- This installs Open WebUI as a project. However, ideally, it should be run as a tool.
- Running Open WebUI looks for the `.webui_secret_key` in the current working director. If not found, a new key file is created. However, this limits access to data and settings.
- Set the `.webui_secret_key` location to `$USER\open-webui\` or `%USERPROFILE%\open-webui\`.
- Set `DATA_DIR` to `$USER\open-webui\data` or `%USERPROFILE%\open-webui\data`
- For persistence, use the same data directory and provide it to Open WebUI. Example `open-webui.bat` file:

  ```text
  @echo off
  
  set "DATA_DIR=%USERPROFILE%\open-webui\data"
  set /p WEBUI_SECRET_KEY=<"%USERPROFILE%\open-webui\.webui_secret_key"
  
  echo This will run Open WebUI
  echo .webui_secret_key should be in %USERPROFILE%\open-webui\
  echo Otherwise, Open WebUI will generate a new key, which may limit access to data.
  
  uv run open-webui serve
  ```
 
- Start the Open WebUI Server: `uv run open-webui serve`.
- The server will be available at [http://localhost:8080](http://localhost:8080)
