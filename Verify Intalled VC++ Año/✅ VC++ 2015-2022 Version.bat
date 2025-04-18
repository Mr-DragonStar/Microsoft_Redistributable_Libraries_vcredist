@echo off
rem Mr. Dragon Star - Detector VC++ 2015-2022 Completo
setlocal enabledelayedexpansion

:: Configurar color verde (0= fondo negro, A= texto verde)
color 0A

:: Configuración de consola
mode con: cols=150 lines=50

:: Título de la ventana de comandos
title Mr. DragonStar VC++ 15-22
cls

:: Mensaje al usuario
echo Suscribete y regalame tu like...
echo https://www.youtube.com/@Mr.DragonStar
echo.

:: Cabecera exacta como solicitaste
echo Nombre                                          Version       Tipo    Publisher              InstallDate      Instalador
echo ======================================================================================================================

:: Buscar todas las versiones (2015-2022)
set "versions=2015 2017 2019 2022"
set "total=0"

for %%Y in (%versions%) do (
    :: Para x86
    for /f "tokens=*" %%a in ('reg query "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "Microsoft Visual C++ %%Y" 2^>nul') do (
        set "key=%%a"
        
        :: Obtener todos los datos necesarios
        set "name=" & set "ver=" & set "pub=" & set "date=" & set "installer="
        
        for /f "tokens=1,2,*" %%b in ('reg query "!key!" /v DisplayName 2^>nul ^| find "REG_SZ"') do set "name=%%d"
        for /f "tokens=1,2,*" %%b in ('reg query "!key!" /v DisplayVersion 2^>nul ^| find "REG_SZ"') do set "ver=%%d"
        for /f "tokens=1,2,*" %%b in ('reg query "!key!" /v Publisher 2^>nul ^| find "REG_SZ"') do set "pub=%%d"
        for /f "tokens=1,2,*" %%b in ('reg query "!key!" /v InstallDate 2^>nul ^| find "REG_SZ"') do set "date=%%d"
        
        :: Determinar tipo de instalador
        reg query "!key!" /v WindowsInstaller 2>nul | find "0x1" >nul && set "installer=.msi" || (
            for /f "tokens=1,2,*" %%i in ('reg query "!key!" /v UninstallString 2^>nul ^| find "REG_SZ"') do (
                echo %%k | find ".exe" >nul && set "installer=.exe" || set "installer=Desconocido"
            )
        )
        
        if defined name if "!name!" neq "" (
            set /a "total+=1"
            echo !name:~0,40!         !ver:~0,10!    x86     !pub:~0,20!         !date!       !installer!
        )
    )

    :: Para x64 (solo en sistemas 64-bit)
    if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (
        for /f "tokens=*" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "Microsoft Visual C++ %%Y" 2^>nul') do (
            set "key=%%a"
            
            set "name=" & set "ver=" & set "pub=" & set "date=" & set "installer="
            
            for /f "tokens=1,2,*" %%b in ('reg query "!key!" /v DisplayName 2^>nul ^| find "REG_SZ"') do set "name=%%d"
            for /f "tokens=1,2,*" %%b in ('reg query "!key!" /v DisplayVersion 2^>nul ^| find "REG_SZ"') do set "ver=%%d"
            for /f "tokens=1,2,*" %%b in ('reg query "!key!" /v Publisher 2^>nul ^| find "REG_SZ"') do set "pub=%%d"
            for /f "tokens=1,2,*" %%b in ('reg query "!key!" /v InstallDate 2^>nul ^| find "REG_SZ"') do set "date=%%d"
            
            reg query "!key!" /v WindowsInstaller 2>nul | find "0x1" >nul && set "installer=.msi" || (
                for /f "tokens=1,2,*" %%i in ('reg query "!key!" /v UninstallString 2^>nul ^| find "REG_SZ"') do (
                    echo %%k | find ".exe" >nul && set "installer=.exe" || set "installer=Desconocido"
                )
            )
            
            if defined name if "!name!" neq "" (
                set /a "total+=1"
                echo !name:~0,40!         !ver:~0,10!    x64     !pub:~0,20!         !date!       !installer!
            )
        )
    )
)

:: Resumen final
echo ======================================================================================================================
echo Total MS Visual c++ Instaladas: !total!

:: Verificacion inteligente de versiones
set "all_versions=2015 2017 2019 2022"
set "missing="

for %%V in (%all_versions%) do (
    echo !installed_versions! | find "%%V" >nul || (
        echo [ADVERTENCIA] Falta VC++ %%V es normal si tienes instalado VC++ 2015-2022 
        set "missing=!missing! %%V"))
if not defined missing (
    echo Tienes todas las versiones necesarias instaladas (2015-2022)
    echo La version mas reciente incluye los componentes de versiones anteriores)
if defined missing (
    echo Microsoft decidio unificar el runtime Universal CRT: (2015, 2017, 2019, 2022...)
    echo Visual C++ 2015 (14.0), 2017 (14.1x), 2019 (14.2x), 2022 (14.3x)
echo.

echo Si deseas regalarme una tasa de cafe, dejo mi Wallet
echo BTC (Bitcoin):1GVPLHUrNCcbXCzfyeSd8zKQKwCQRjg4Hu
echo BTC (SegWit):bc1qr9dg5yyksm9sv9252e9pg0803k2aptkrs8qgd0
echo BTC (EXODUS):bc1quy3q3efqadmy8lkk40fzx7mluzekv0tk4afecy
echo ETH (ERC20):0xc33ae0e5d783cec8dfa74261983ce977bb9d0d78
echo USDT Tron(TRC20):TA6ouzHLHtWpBGDizF6FQXxKsxzZo6J6RL
echo DOGE (dogecoin):DEvXhCWZpYfbaAbgE3Y1pWbKYJ1ojkySN2
echo Si tienes algun trabajo para mi escribeme.....
echo mr.dragonstar.official@gmail.com

)

echo.
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
echo.
pause