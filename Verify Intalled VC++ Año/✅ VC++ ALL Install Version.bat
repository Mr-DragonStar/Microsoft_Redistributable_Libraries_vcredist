
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

:: Barra de estado
rem scrip retraso de 1 segundo timeout 1 > nul, sin enter
echo Verificando sistema...
for /L %%i in (1,22.4,35) do (
    echo Bienvenido al sistema Mr-Dragonstar!
    echo Proceso en curso...
    echo Buscando versiones instaladas de Visual C++...
    echo %%i%%
    timeout 1 > nul
    cls
)

for /L %%i in (36,15.4,72) do (
    echo Microsoft visual 2005 x86 Redistributable – 8.0.61187
    echo Microsoft visual 2005 x64 Redistributable – 8.0.61186
@reg query "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "Microsoft Visual C++ 2005" | findstr /i "DisplayName DisplayVersion" & @reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "Microsoft Visual C++ 2005" | findstr /i "DisplayName DisplayVersion"
    echo Microsoft visual 2008 x86 Redistributable – 9.0.30729
    echo Microsoft visual 2008 x64 Redistributable – 9.0.30729
@reg query "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "Microsoft Visual C++ 2008" | findstr /i "DisplayName DisplayVersion" & @reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "Microsoft Visual C++ 2008" | findstr /i "DisplayName DisplayVersion"
    echo Microsoft visual 2010 x86 Redistributable – 10.0.40219
    echo Microsoft visual 2010 x64 Redistributable – 10.0.40219
@reg query "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "Microsoft Visual C++ 2010" | findstr /i "DisplayName DisplayVersion" & @reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "Microsoft Visual C++ 2010" | findstr /i "DisplayName DisplayVersion"
    echo Microsoft visual 2012 x86 Redistributable – 11.0.61135
    echo Microsoft visual 2012 x64 Redistributable – 11.0.61135
@reg query "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "Microsoft Visual C++ 2012" | findstr /i "DisplayName DisplayVersion" & @reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "Microsoft Visual C++ 2012" | findstr /i "DisplayName DisplayVersion"
    echo Microsoft visual 2013 x86 Redistributable – 12.0.40664
    echo Microsoft visual 2013 x64 Redistributable – 12.0.40664
@reg query "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "Microsoft Visual C++ 2013" | findstr /i "DisplayName DisplayVersion" & @reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "Microsoft Visual C++ 2013" | findstr /i "DisplayName DisplayVersion"
    echo Microsoft visual 2015 - 2022 x86 Redistributable – 14.44.35026
    echo Microsoft visual 2015 - 2022 x64 Redistributable – 14.44.35026
@reg query "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "Microsoft Visual C++ 2015" | findstr /i "DisplayName DisplayVersion" & @reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "Microsoft Visual C++ 2015" | findstr /i "DisplayName DisplayVersion"
@reg query "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "Microsoft Visual C++ 2022" | findstr /i "DisplayName DisplayVersion" & @reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "Microsoft Visual C++ 2022" | findstr /i "DisplayName DisplayVersion"
    echo Checking Microsoft visual Minimum version
    echo Checking Microsoft visual Additional version
    echo Checking Microsoft visual Studio 2010 Tools x86_x64 - 10.0.609.22
    echo. 
    echo %%i%%
    timeout 1 > nul
    cls
)

for /L %%i in (72,15.4,100) do (
    echo Bienvenido al sistema Mr-Dragonstar!
    echo Suscribete a Mi Canal!! 
    echo.
    echo %%i%%
    timeout 1 > nul
    cls
)
echo.

:: Mensaje inicial
echo Buscando versiones instaladas de Visual C++...
echo Por favor espere, esto puede tomar unos segundos...
echo.

:: Ejecutar PowerShell con salida en verde
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    "$Host.UI.RawUI.ForegroundColor = 'Green';" ^
    "$result = Get-ItemProperty 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*', 'HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*' |" ^
    "Where-Object { $_.DisplayName -match 'Visual C\+\+' } |" ^
    "Select-Object DisplayName, DisplayVersion, Publisher, InstallDate |" ^
    "Sort-Object DisplayName | Format-Table -AutoSize;" ^
    "if ($result) {" ^
    "    $result | Out-Host;" ^
    "    $result | Out-File '%USERPROFILE%\Desktop\VC++_Instalados.txt' -Encoding UTF8;" ^
    "    Write-Host 'Resultados guardados en %USERPROFILE%\Desktop\VC++_Instalados.txt' -ForegroundColor Green;" ^
    "} else {" ^
    "    Write-Host 'No se encontraron versiones instaladas de Visual C++.' -ForegroundColor Green;" ^
    "}" ^
    "Read-Host 'Presiona Enter para salir...'"

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
