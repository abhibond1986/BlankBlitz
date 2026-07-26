@echo off
REM BlankBlitz Quick Start Script for Windows

echo =============================
echo 🎮 BlankBlitz Quick Start
echo =============================
echo.

REM Check if Flutter is installed
where flutter >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Flutter is not installed!
    echo Please install Flutter from: https://flutter.dev/docs/get-started/install
    pause
    exit /b 1
)

echo ✅ Flutter is installed
echo.

REM Clean previous builds
echo 🧹 Cleaning previous builds...
call flutter clean

REM Get dependencies
echo 📦 Installing dependencies...
call flutter pub get

REM Check for issues
echo 🔍 Checking for code issues...
call flutter analyze

REM Run the app
echo.
echo 🚀 Starting BlankBlitz...
echo.
echo Select platform:
echo 1) Chrome (Web)
echo 2) Android
echo 3) Build Web for Production
echo 4) Build Android APK
echo.
set /p choice="Enter choice (1-4): "

if "%choice%"=="1" (
    echo 🌐 Launching in Chrome...
    call flutter run -d chrome
) else if "%choice%"=="2" (
    echo 📱 Launching on Android...
    call flutter run
) else if "%choice%"=="3" (
    echo 🏗️ Building Web for production...
    call flutter build web --release
    echo ✅ Web build complete! Output: build\web\
) else if "%choice%"=="4" (
    echo 🏗️ Building Android APK...
    call flutter build apk --release
    echo ✅ APK build complete! Output: build\app\outputs\flutter-apk\
) else (
    echo Invalid choice
    exit /b 1
)

echo.
echo ✨ Done!
pause
