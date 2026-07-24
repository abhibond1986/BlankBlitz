@echo off
echo ========================================
echo  BlankBlitz - Generate Code and Deploy
echo ========================================
echo.

echo Step 1: Installing dependencies...
call flutter pub get
if %errorlevel% neq 0 (
    echo ERROR: Flutter pub get failed!
    pause
    exit /b %errorlevel%
)
echo ✓ Dependencies installed
echo.

echo Step 2: Generating Freezed code...
echo This may take 1-2 minutes...
call flutter pub run build_runner build --delete-conflicting-outputs
if %errorlevel% neq 0 (
    echo ERROR: Code generation failed!
    pause
    exit /b %errorlevel%
)
echo ✓ Code generated successfully
echo.

echo Step 3: Committing generated files...
git add .
git commit -m "Add generated Freezed files for deployment"
echo ✓ Files committed
echo.

echo Step 4: Pushing to GitHub...
git push origin main
if %errorlevel% neq 0 (
    echo ERROR: Git push failed!
    pause
    exit /b %errorlevel%
)
echo ✓ Pushed to GitHub
echo.

echo ========================================
echo  ✓ DEPLOYMENT STARTED!
echo ========================================
echo.
echo Your app will be live in 3-5 minutes at:
echo https://abhibond1986.github.io/BlankBlitz/
echo.
echo Go to GitHub Actions to watch the build:
echo https://github.com/abhibond1986/BlankBlitz/actions
echo.
pause
