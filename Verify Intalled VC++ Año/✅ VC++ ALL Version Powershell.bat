@echo off
:: Habilitar la expansión retardada de variables
setlocal enabledelayedexpansion

:: Título de la ventana de comandos:
title Mr. DragonStar VC++ Version
cls

:: Ejecutar comando de PowerShell para obtener versiones de Visual C++
powershell.exe -Command "Get-Package -Name 'Microsoft Visual C++*' | Sort-Object Version"
pause

:: Abrir tu página de YouTube
:: Verificar y abrir con Chrome o Edge
echo Abriendo tu canal de YouTube...
echo.

:: Ruta de Chrome
set "chrome_path=%ProgramFiles%\Google\Chrome\Application\chrome.exe"

:: Ruta de Edge
set "edge_path=%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe"

:: URL de tu canal
set "youtube_url=https://www.youtube.com/@Mr.DragonStar"

:: Verificar si Chrome existe y abrir con él
if exist "%chrome_path%" (
    echo [✓] Abriendo con Google Chrome...
    start "" "%chrome_path%" "%youtube_url%"
) else (
    :: Si Chrome no existe, verificar si Edge existe
    if exist "%edge_path%" (
        echo [⚠] Chrome no encontrado. Abriendo con Microsoft Edge...
        start "" "%edge_path%" "%youtube_url%"
    ) else (
        :: Si ni Chrome ni Edge existen, abrir con el navegador predeterminado
        echo [X] ERROR: No se encontró Chrome ni Edge.
        echo    Abriendo con el navegador predeterminado...
        start "" "%youtube_url%"
    )
)

echo.
echo Si el navegador no se abrió, copia manualmente esta URL:
echo %youtube_url%
pause