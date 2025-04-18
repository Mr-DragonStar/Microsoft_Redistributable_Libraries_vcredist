@echo off
rem Mr. Dragon Star derechos reservados
setlocal enabledelayedexpansion

:: Configurar color verde (0= fondo negro, A= texto verde)
color 0A

:: Configuración de consola
mode con: cols=150 lines=50
:: Título de la ventana de comandos:
title Mr. DragonStar VC++ 2005
cls

echo Obteniendo informacion de Visual C++ 2005...
echo https://www.youtube.com/@Mr.DragonStar
echo Suscribete y regalame tu like...
echo Si deseas regalarme una tasa de cafe, dejo mi Wallet
echo BTC (Bitcoin):1GVPLHUrNCcbXCzfyeSd8zKQKwCQRjg4Hu
echo BTC (SegWit):bc1qr9dg5yyksm9sv9252e9pg0803k2aptkrs8qgd0
echo BTC (EXODUS):bc1quy3q3efqadmy8lkk40fzx7mluzekv0tk4afecy
echo ETH (ERC20):0xc33ae0e5d783cec8dfa74261983ce977bb9d0d78
echo USDT Tron(TRC20):TA6ouzHLHtWpBGDizF6FQXxKsxzZo6J6RL
echo DOGE (dogecoin):DEvXhCWZpYfbaAbgE3Y1pWbKYJ1ojkySN2
echo Si tienes algun trabajo para mi escribeme.....
echo mr.dragonstar.official@gmail.com
echo.

:: Cabecera de la tabla
echo Nombre                                          Version       Tipo    Publisher              InstallDate      Instalador
echo ======================================================================================================================

:: Variables para control de duplicados
set "prev_name="
set "x86_found=0"
set "x64_found=0"

:: Buscar versiones x86 de VC++ 2005
for /f "tokens=*" %%a in ('reg query "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "Microsoft Visual C++ 2005 Redistributable" 2^>nul') do (
    set "key=%%a"
    for /f "tokens=1,2,*" %%b in ('reg query "!key!" /v DisplayName 2^>nul ^| find "REG_SZ"') do (
        set "name=%%d"
        :: Verificar si coincide exactamente con el nombre
        echo !name! | find "Microsoft Visual C++ 2005 Redistributable" >nul && (
            for /f "tokens=1,2,*" %%e in ('reg query "!key!" /v DisplayVersion 2^>nul ^| find "REG_SZ"') do set "ver=%%g"
            for /f "tokens=1,2,*" %%e in ('reg query "!key!" /v Publisher 2^>nul ^| find "REG_SZ"') do set "pub=%%g"
            for /f "tokens=1,2,*" %%e in ('reg query "!key!" /v InstallDate 2^>nul ^| find "REG_SZ"') do set "date=%%g"
            
            :: Determinar si es .msi o .exe usando WindowsInstaller
            set "installer=Desconocido"
            for /f "tokens=1,2,*" %%e in ('reg query "!key!" /v WindowsInstaller 2^>nul ^| find "REG_DWORD"') do (
                if "%%g"=="0x1" set "installer=.msi"
            )
            if "!installer!"=="Desconocido" (
                for /f "tokens=1,2,*" %%e in ('reg query "!key!" /v UninstallString 2^>nul ^| find "REG_SZ"') do (
                    echo %%g | find ".exe" >nul && set "installer=.exe"
                )
            )

            if "!name!" neq "!prev_name!" (
                set "x86_found=1"
                set "prev_name=!name!"
                echo !name:~0,40!         !ver:~0,10!    x86     !pub:~0,20!         !date!       !installer!
            )
        )
    )
)

:: Buscar versiones x64 de VC++ 2005 (solo en sistemas de 64 bits)
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (
    set "prev_name="
    for /f "tokens=*" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "Microsoft Visual C++ 2005 Redistributable" 2^>nul') do (
        set "key=%%a"
        for /f "tokens=1,2,*" %%b in ('reg query "!key!" /v DisplayName 2^>nul ^| find "REG_SZ"') do (
            set "name=%%d"
            :: Verificar si coincide exactamente con el nombre
            echo !name! | find "Microsoft Visual C++ 2005 Redistributable" >nul && (
                for /f "tokens=1,2,*" %%e in ('reg query "!key!" /v DisplayVersion 2^>nul ^| find "REG_SZ"') do set "ver=%%g"
                for /f "tokens=1,2,*" %%e in ('reg query "!key!" /v Publisher 2^>nul ^| find "REG_SZ"') do set "pub=%%g"
                for /f "tokens=1,2,*" %%e in ('reg query "!key!" /v InstallDate 2^>nul ^| find "REG_SZ"') do set "date=%%g"
                
                :: Determinar si es .msi o .exe usando WindowsInstaller
                set "installer=Desconocido"
                for /f "tokens=1,2,*" %%e in ('reg query "!key!" /v WindowsInstaller 2^>nul ^| find "REG_DWORD"') do (
                    if "%%g"=="0x1" set "installer=.msi"
                )
                if "!installer!"=="Desconocido" (
                    for /f "tokens=1,2,*" %%e in ('reg query "!key!" /v UninstallString 2^>nul ^| find "REG_SZ"') do (
                        echo %%g | find ".exe" >nul && set "installer=.exe"
                    )
                )

                if "!name!" neq "!prev_name!" (
                    set "x64_found=1"
                    set "prev_name=!name!"
                    echo !name:~0,40!         !ver:~0,10!    x64     !pub:~0,20!         !date!       !installer!
                )
            )
        )
    )
)

:: Mensaje si no se encontraron instalaciones
if !x86_found! equ 0 (
    echo Microsoft Visual C++ 2005 x86 Redistributable         NO ENCONTRADO
)
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" if !x64_found! equ 0 (
    echo Microsoft Visual C++ 2005 x64 Redistributable         NO ENCONTRADO
)

echo ======================================================================================================================
echo MINI TUTORIAL PARA NOVATOS:
echo 1. Algunas versiones de VC++ no incluyen x86 =32 bit y x64= 64 bit
echo 2. Presiona Tecla Windows + R y escribe Regedit, en el EDITOR DE REGISTRO pega:
echo 3. Equipo\HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall
echo    Por Ejem. VC++2005x86 la carpeta es {710f4c1c-cc18-4c49-8cbf-51240c89a1a2} puede variar.
echo    Nos intereza el Archivo rojo: DisplayName
echo.
echo    Nota1:Minimum Version; version basica requerida para que una aplicacion funcione.
echo    Nota2:Additional Version; son actualizaciones incrementales que se instalan sobre la version minima.
echo    Nota3:Redistributable Final (Version completa) es el paquete completo que incluye todas las actualizaciones
echo    Nota Final:Recomendacion para desarrolladores Usa el Redistributable Final
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