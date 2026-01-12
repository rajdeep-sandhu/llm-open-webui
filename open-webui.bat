@echo off

set "DATA_DIR=%USERPROFILE%\open-webui\data"
set /p WEBUI_SECRET_KEY=<"%USERPROFILE%\open-webui\.webui_secret_key"

echo This will run Open WebUI
echo .webui_secret_key should be in %USERPROFILE%\open-webui\
echo Otherwise, Open WebUI will generate a new key, which may limit access to data.

uv run open-webui serve
