@echo off
echo Quick GitHub Pages Deployment Script
echo ====================================
echo.

REM Check if Git is installed
git --version >nul 2>&1
if errorlevel 1 (
    echo Error: Git is not installed
    pause
    exit /b 1
)

REM Get repository URL from user
set /p REPO_URL="Enter your GitHub repository URL (e.g., https://github.com/username/repository.git): "

if "%REPO_URL%"=="" (
    echo Error: Repository URL is required
    pause
    exit /b 1
)

echo.
echo Deploying to: %REPO_URL%
echo.

REM Initialize Git if needed
if not exist .git (
    git init
)

REM Add remote origin
git remote remove origin 2>nul
git remote add origin %REPO_URL%

REM Add all files
git add .

REM Commit
git commit -m "Deploy personal website to GitHub Pages"

REM Set main branch
git branch -M main

REM Push to GitHub
echo Pushing to GitHub...
git push -u origin main

if errorlevel 0 (
    echo.
    echo Success! Your website has been pushed to GitHub.
    echo.
    echo Next steps:
    echo 1. Go to your GitHub repository
    echo 2. Click Settings ^> Pages
    echo 3. Select "Deploy from a branch"
    echo 4. Choose "main" branch and "/ (root)" folder
    echo 5. Click Save
    echo.
    echo Your website will be available at:
    for /f "tokens=3 delims=/" %%a in ("%REPO_URL%") do (
        for /f "tokens=1 delims=." %%b in ("%%a") do (
            for /f "tokens=2 delims=/" %%c in ("%REPO_URL%") do (
                echo https://%%c.github.io/%%b/
            )
        )
    )
) else (
    echo.
    echo Error occurred during deployment.
    echo Please check your repository URL and try again.
)

echo.
pause
