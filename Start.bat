@echo off
:::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::: WARNING ::::::::::::::::::::
:::::::::::::::: DON'T EDIT HERE ::::::::::::::::
:::::::::: EDIT ON THE CONFIG FILE ON :::::::::::
:::::::::: TEMP FOLDER vapeConfig.txt :::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::


:::::    Load config file    :::::
set "config_file=%temp%\vapeConfig.txt"
FOR /f "usebackq eol=; tokens=* delims=*" %%# in ("%config_file%") do (CALL SET "%%#")

color b


:::::    CONFIG GENERATOR     :::::
If exist "%temp%\vapeConfig.txt" (goto LoadChecker) else (echo ;;VAPE RUNNER CONFIG >%config_file% & echo. >>%config_file% & echo. >>%config_file% & echo. >>%config_file% & echo ;; Vape directory (The folder with the server.py not the exe) >>%config_file% & echo Vape-Dir=n/a >>%config_file% a & echo. >>%config_file% & echo ;; Vape version. Put "v4" or "lite" (Lowercase)  >>%config_file% & echo Vape-Version= >>%config_file% & echo. >>%config_file% & echo ;; Load time (The time the program wait before open vape. So, open the server and wait x time to wait before inyect)  -  Default: 5 >>%config_file% & echo Timeout-Time=5 >>%config_file% & echo .>>%config_file% & echo ;;Batch startup location >>%config_file% & echo Bat-location=C:\Windows\System32\vape.bat >>%config_file% & cls & echo Config file generated on %config_file% & timeout /t 2 /nobreak >%temp%\nul & exit )
goto LoadChecker



:::::    loader checker    :::::
:LoadChecker
cls
if "%Vape-Dir%"=="n/a" (echo Dir is not defines & timeout /t 2 /nobreak & exit )
cls
If "%Vape-Version%"=="v4" (echo Loading Vape v4. If you want to load Vape Lite change con config file ^(%config_file%^) & timeout /t 3 /nobreak & goto Loadv4) else (If "%Vape-Version%"=="lite" (echo Loading Vape Lite. If you want to load Vape v4 change con config file ^(%config_file%^) & timeout /t 3 /nobreak & goto LoadLite) else (echo Vape version not defined/incorrect spelling on config file ^(%config_file%^) & timeout /t 3 /nobreak & exit))



:::::    Server Loader v4     :::::
:Loadv4
cd "%Vape-Dir%"
cls

If NOT exist "tmp.bat" (echo @echo off >>tmp.bat & echo color b >>tmp.bat & echo python server.py >>tmp.bat)

start tmp.bat
cls
echo Giving time to the server to load
timeout /t %Timeout-Time% /nobreak >nul

"%Vape-Dir%\Vape_V4\Kangaroo Patcher.exe" "%Vape-Dir%\Vape_V4\Vape_V4.exe"

goto Loadedv4




:::::    Server Loader Lite     :::::
:LoadLite
cd "%Vape-Dir%"
cls

If NOT exist "tmp.bat" (echo @echo off >>tmp.bat & echo color b >>tmp.bat & echo python server.py >>tmp.bat)

start tmp.bat
cls
echo Giving time to the server to load
timeout /t %Timeout-Time% /nobreak >nul
"%vapedir%\Vape Lite\Kangaroo Patcher.exe" "%vapedir%\Vape Lite\Vape_Lite.exe"

goto LoadedLite




:::::    Menu for loaded v4     :::::
:Loadedv4
cd "%Vape-Dir%"
cls
echo ###########################################
echo #                                         #
echo #                                         #
echo #              Vape Loader                #
echo #             By craciu25yt               #
echo #                                         #
echo #                                         #
echo #            Current version:             #
echo #                   v4                    #
echo #                                         #
echo #                                         #
echo ###########################################
echo.
echo.
echo.
echo            [1]. Re-inyect
echo            [2]. Re-open server
echo            [3]. Self destruct
set/p menu=Option: 
If "%menu%"=="1" goto Loadv4
If "%menu%"=="2" start tmp.bat
If "%menu%"=="3" goto destruct

echo %menu% isn't a valid option.
pause 
goto Loadedv4





:::::    Menu for loaded Lite     :::::
:LoadedLite
cd "%Vape-Dir%"
cls
echo ###########################################
echo #                                         #
echo #                                         #
echo #              Vape Loader                #
echo #             By craciu25yt               #
echo #                                         #
echo #                                         #
echo #            Current version:             #
echo #                  Lite                   #
echo #                                         #
echo #                                         #
echo ###########################################
echo.
echo.
echo.
echo            [1]. Re-inyect
echo            [2]. Re-open server
echo            [3]. Self destruct
set/p menu=Option: 
If "%menu%"=="1" goto LoadLite
If "%menu%"=="2" start tmp.bat
If "%menu%"=="3" goto destruct




echo %menu% isn't a valid option.
pause 
goto LoadedLite







:::::    Destestruct     :::::
:destruct
echo Remember to selfdestruct vape on RSHIFT ^> Other ^> Self-Destruct
timeout /t 5 /nobreak
cd %temp%
echo @echo off >> "%temp%\sd.bat"
echo title >> "%temp%\sd.bat"
echo timeout /t 3 /nobreak ^>nul >> "%temp%\sd.bat"
echo set "vapedir=%Vape-Dir%" >> "%temp%\sd.bat"
echo del /f /s /q "%Vape-Dir%" >> "%temp%\sd.bat"
echo del /f /s /q "%Bat-location%" >> "%temp%\sd.bat"
echo del /f /s /q %0 >> "%temp%\sd.bat"
start "%temp%\sd.bat"
exit







