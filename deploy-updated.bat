@echo off
echo GitHub Pages Deployment with Actions Support
echo ============================================
echo.

REM Check if Git is installed
git --version >nul 2>&1
if errorlevel 1 (
    echo Error: Git is not installed
    pause
    exit /b 1
)

REM Get repository URL from user
set /p REPO_URL="Enter your GitHub repository URL: "

if "%REPO_URL%"=="" (
    echo Error: Repository URL is required
    pause
    exit /b 1
)

echo.
echo Setting up deployment to: %REPO_URL%
echo.

REM Initialize Git if needed
if not exist .git (
    echo Initializing Git repository...
    git init
)

REM Add remote origin
git remote remove origin 2>nul
git remote add origin %REPO_URL%

REM Create .github/workflows directory if it doesn't exist
if not exist .github\workflows (
    echo Creating GitHub Actions workflow directory...
    mkdir .github\workflows
)

REM Add all files including the workflow
echo Adding all files...
git add .

REM Commit
echo Committing files...
git commit -m "Deploy personal website with GitHub Actions"

REM Set main branch
git branch -M main

REM Push to GitHub
echo Pushing to GitHub...
git push -u origin main

if errorlevel 0 (
    echo.
    echo ✅ Success! Your website has been pushed to GitHub.
    echo.
    echo 🚀 DEPLOYMENT STEPS:
    echo ==================
    echo 1. Go to your GitHub repository: %REPO_URL%
    echo 2. Click on "Settings" tab
    echo 3. Scroll down to "Pages" in the left sidebar
    echo 4. Under "Source", select "GitHub Actions"
    echo 5. Your site will deploy automatically!
    echo.
    echo 📋 IF YOU CAN'T FIND "GitHub Actions" OPTION:
    echo - Make sure your repository is PUBLIC
    echo - Try refreshing the page
    echo - Look for "Deploy from a branch" and select it
    echo - Choose "main" branch and "/ (root)" folder
    echo.
    echo 🌐 Your website will be available at:
    for /f "tokens=3,4 delims=/" %%a in ("%REPO_URL%") do (
        echo https://%%a.github.io/%%b/
    )
    echo.
    echo ⏰ Note: It may take 5-10 minutes for your site to go live.
    echo.
    echo 📖 For troubleshooting, see: GITHUB_PAGES_TROUBLESHOOTING.md
) else (
    echo.
    echo ❌ Error occurred during deployment.
    echo Please check:
    echo - Repository URL is correct
    echo - You have access to the repository  
    echo - Internet connection is stable
    echo.
    echo See GITHUB_PAGES_TROUBLESHOOTING.md for more help.
)

echo.
pause
