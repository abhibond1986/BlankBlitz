@echo off
REM BlankBlitz Cleanup Script - Remove Unnecessary Files
REM Run this to clean up your project folder

echo ============================================
echo  BlankBlitz Project Cleanup
echo ============================================
echo.
echo This will delete old/redundant documentation files.
echo Essential files will be kept (README, guides, SQL, etc.)
echo.
pause

cd /d "%~dp0"

echo.
echo Deleting old documentation files...

del /F /Q APP_READY.md 2>nul
del /F /Q ARCHITECTURE.md 2>nul
del /F /Q AUTH_COMPLETE_WITH_SCREENS.md 2>nul
del /F /Q AUTH_FEATURE_COMPLETE.md 2>nul
del /F /Q BUILD_FIXES.md 2>nul
del /F /Q BUILD_INSTRUCTIONS.md 2>nul
del /F /Q CLOUDFLARE_ARCHITECTURE.md 2>nul
del /F /Q COMPLETE_PACKAGE.md 2>nul
del /F /Q DEPLOY_INSTRUCTIONS.md 2>nul
del /F /Q FINAL_DELIVERY.md 2>nul
del /F /Q FIXES_APPLIED.md 2>nul
del /F /Q FOLDER_VERIFICATION.md 2>nul
del /F /Q GAME_MODELS_COMPLETE.md 2>nul
del /F /Q HOW_TO_ADD_LOGO.md 2>nul
del /F /Q IMPLEMENTATION_STATUS.md 2>nul
del /F /Q PHASE3_PROGRESS.md 2>nul
del /F /Q PRODUCTION_READY.md 2>nul
del /F /Q PROGRESS_SUMMARY.md 2>nul
del /F /Q PROJECT_STATUS.md 2>nul
del /F /Q README_DEPLOYMENT.md 2>nul
del /F /Q READY_TO_TEST.md 2>nul
del /F /Q SETUP_GUIDE.md 2>nul
del /F /Q WHAT_IVE_BUILT.md 2>nul
del /F /Q setup.md 2>nul

echo.
echo Deleting old scripts...

del /F /Q create_structure.sh 2>nul
del /F /Q generate_and_deploy.bat 2>nul

echo.
echo Deleting cleanup files...

del /F /Q CLEANUP_PLAN.md 2>nul

echo.
echo ============================================
echo  Cleanup Complete!
echo ============================================
echo.
echo Your project folder is now clean and organized.
echo.
echo Essential files kept:
echo   - README.md
echo   - START_HERE.md
echo   - COMPLETE_FIX_GUIDE.md
echo   - DEPLOYMENT_GUIDE.md
echo   - supabase_schema.sql
echo   - quick_start.bat/sh
echo   - All source code (lib/)
echo   - All assets
echo.
echo You can now delete this CLEANUP.bat file too!
echo.
pause
