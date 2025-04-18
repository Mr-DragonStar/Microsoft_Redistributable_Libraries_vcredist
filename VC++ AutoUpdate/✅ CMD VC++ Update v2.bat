@echo off
:: Habilitar delayed expansion
setlocal enabledelayedexpansion

:: Configuración inicial
mode con: cols=150 lines=50
title Mr-DragonStar VC++Update
cls

:: Variables globales
set "chrome_path=%ProgramFiles%\Google\Chrome\Application\chrome.exe"
set "edge_path=%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe"
set "youtube_url=https://www.youtube.com/@Mr.DragonStar"

:: Mensaje de inicio
echo Iniciando la instalacion de Microsoft Visual C++ Redistributable...
echo.

:: Instalar Visual C++ Redistributable
call :InstallVCRedist "2005" "x86"
call :InstallVCRedist "2005" "x64"
call :InstallVCRedist "2008" "x86"
call :InstallVCRedist "2008" "x64"
call :InstallVCRedist "2010" "x86"
call :InstallVCRedist "2010" "x64"
call :InstallVCRedist "2012" "x86"
call :InstallVCRedist "2012" "x64"
call :InstallVCRedist "2013" "x86"
call :InstallVCRedist "2013" "x64"
call :InstallVCRedist "2015+" "x86"
call :InstallVCRedist "2015+" "x64"

:: Mensaje final
echo.
echo La instalacion de Microsoft Visual C++ Redistributable ha finalizado.
pause

:: Abrir canal de YouTube
echo Abriendo tu canal de YouTube...
if exist "!chrome_path!" (
    echo [✓] Abriendo con Google Chrome...
    start "" "!chrome_path!" "!youtube_url!"
) else (
    if exist "!edge_path!" (
        echo [⚠] Chrome no encontrado. Abriendo con Microsoft Edge...
        start "" "!edge_path!" "!youtube_url!"
    ) else (
        echo [X] ERROR: No se encontro Chrome ni Edge.
        echo    Intentando abrir con el navegador predeterminado...
        start "" "!youtube_url!"
    )
)

echo.
echo Si el navegador no se abrio, copia manualmente esta URL:
echo !youtube_url!
echo.


:: Función para instalar VC++ Redistributable
:InstallVCRedist
setlocal
set "version=%~1"
set "arch=%~2"
echo Instalando Microsoft Visual C++ %version% %arch%...
winget install --id=Microsoft.VCRedist.%version%.%arch% -e
if %errorlevel% neq 0 (
    echo Error al instalar Microsoft Visual C++ %version% %arch%.
)
endlocal
goto :eof