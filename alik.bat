@echo off

set cwd=%~dp0
cd "%cwd%"

set python_version=3.10.2
set python_dir=%cwd%python%python_version%
set python=%python_dir%\python.exe
set python_tmp=%python_dir%\python.tmp
set python_zip=%python_dir%\python.zip
set python_link=https://www.python.org/ftp/python/3.10.2/python-3.10.2-embed-amd64.zip


set alik_dir=%cwd%\alik
set alik_py=%alik_dir%\alik.py


if not exist "%python_dir%" (
    echo alik supports only latest versions of windows 10 and 11
    echo if errors occur, update windows
    pause
    mkdir "%python_dir%"
)
if not exist "%python%" (
    if not exist "%python_zip%" (
        echo downloading python %python_version%...
        curl "%python_link%" -o "%python_tmp%"
        ren "%python_tmp%" "python.zip"
    )
    echo unzipping python %python_version%...
    cd "%python_dir%"
    tar -xf "%python_zip%"
    cd "%cwd%"
)


if exist "%python_zip%" (
    del "%python_zip%"
)
if exist "%python_tmp%" (
    del "%python_tmp%"
)

if not exist "%alik_dir%" (
    mkdir "%alik_dir%"
)

@REM if not exist "%alik_py%" (
    
@REM )

"%python%" "%alik_py%"
