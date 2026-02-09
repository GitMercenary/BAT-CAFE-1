@echo off
echo Initialization Git...
git init
if %errorlevel% neq 0 (
    echo Git init failed or repo already exists. Continuing...
)

echo Adding files...
git add .
if %errorlevel% neq 0 (
    echo Git add failed. Exiting.
    pause
    exit /b %errorlevel%
)

echo Committing files...
git commit -m "Initial commit for BAT CAFE 1"
if %errorlevel% neq 0 (
    echo Git commit failed (maybe nothing to commit). Continuing...
)

echo Renaming branch to main...
git branch -M main

echo Adding remote origin...
git remote add origin https://github.com/GitMercenary/BAT-CAFE-1.git
if %errorlevel% neq 0 (
    echo Remote 'origin' already exists. Setting URL...
    git remote set-url origin https://github.com/GitMercenary/BAT-CAFE-1.git
)

echo Pushing to GitHub...
git push -u origin main
if %errorlevel% neq 0 (
    echo Push failed. Please check your internet connection and GitHub credentials.
    pause
    exit /b %errorlevel%
)

echo Done!
pause
