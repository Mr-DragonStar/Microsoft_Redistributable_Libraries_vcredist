@echo off
rem Mr. Dragon Star derechos reservados
setlocal enabledelayedexpansion

:: Configurar color verde (0= fondo negro, A= texto verde)
color 0A

:: Configuración de consola
mode con: cols=150 lines=50
:: Título de la ventana de comandos:
title Mr. DragonStar VC++ Version
cls

:: Instalar los Visual C++ Redistributables
winget install --id=Microsoft.VCRedist.2005.x86 -e
winget install --id=Microsoft.VCRedist.2005.x64 -e
winget install --id=Microsoft.VCRedist.2008.x86 -e
winget install --id=Microsoft.VCRedist.2008.x64 -e
winget install --id=Microsoft.VCRedist.2010.x86 -e
winget install --id=Microsoft.VCRedist.2010.x64 -e
winget install --id=Microsoft.VCRedist.2012.x86 -e
winget install --id=Microsoft.VCRedist.2012.x64 -e
winget install --id=Microsoft.VCRedist.2013.x86 -e
winget install --id=Microsoft.VCRedist.2013.x64 -e
winget install --id=Microsoft.VCRedist.2015+.x86 -e
winget install --id=Microsoft.VCRedist.2015+.x64 -e

:: Intentar abrir en Chrome, si no, usar Edge
set "youtubeURL=https://www.youtube.com/@Mr.DragonStar"

where chrome >nul 2>&1
if %errorlevel% equ 0 (
    start chrome "%youtubeURL%"
) else (
    start msedge "%youtubeURL%"
)
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

if exist "!chrome_path!" (
    echo [✓] Abriendo con Google Chrome...
    start "" "!chrome_path!" "!youtube_url!"
) else (
    if exist "!edge_path!" (
        echo [⚠] Chrome no encontrado. Abriendo con Microsoft Edge...
        start "" "!edge_path!" "!youtube_url!"
    ) else (
        echo [X] ERROR: No se encontro Chrome ni Edge
        echo    Abriendo con el navegador predeterminado...
        start "" "!youtube_url!"
    )
)

echo.
echo Si el navegador no se abrio, copia manualmente esta URL:
echo !youtube_url!
