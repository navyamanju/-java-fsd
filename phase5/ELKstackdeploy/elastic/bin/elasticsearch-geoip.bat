@echo off

setlocal enabledelayedexpansion
setlocal enableextensions

set CLI_SCRIPT=%~0
set CLI_LIBS=lib/tools/geoip-cli
call "%~dp0elasticsearch-cli.bat" ^
  %%* ^
  || goto exit

endlocal
endlocal
:exit
exit /b %ERRORLEVEL%
