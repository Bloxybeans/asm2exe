@echo off
setlocal

echo Building SNES Recompiler Suite...

REM Clean old files
del /q recompiler.exe asm2exe.exe gui.exe 2>nul

echo [1/3] Building recompiler.exe
if not exist recompiler.cpp ( echo Missing recompiler.cpp & pause & exit /b 1 )
g++ -std=c++17 -O2 -Wall -Wextra recompiler.cpp -o recompiler.exe || ( echo Failed recompiler build & pause & exit /b 1 )

echo [2/3] Building asm2exe.exe
if not exist asm2exe.cpp ( echo Missing asm2exe.cpp & pause & exit /b 1 )
g++ -std=c++17 -O2 -Wall -Wextra asm2exe.cpp -o asm2exe.exe || ( echo Failed asm2exe build & pause & exit /b 1 )

REM GUI is optional
if exist main_cpp_gui.cpp (
    echo [3/3] Building gui.exe
    g++ -std=c++17 -O2 -Wall -Wextra main_cpp_gui.cpp -o gui.exe -municode -static -static-libstdc++ -static-libgcc -lgdi32 -lcomdlg32 -lshell32 || (
        echo Failed gui build & pause & exit /b 1
    )
) else (
    echo [3/3] Skipping gui build
)

echo All builds complete.
pause
endlocal
