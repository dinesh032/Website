@echo off
echo Setting up your personal website for GitHub deployment...
echo.

REM Check if Git is installed
git --version >nul 2>&1
if errorlevel 1 (
    echo Error: Git is not installed or not in PATH
    echo Please install Git from https://git-scm.com/
    pause
    exit /b 1
)

echo Git is installed. Proceeding with setup...
echo.

REM Initialize Git repository if not already initialized
if not exist .git (
    echo Initializing Git repository...
    git init
    echo.
)

REM Add all files to Git
echo Adding files to Git...
git add .
echo.

REM Commit files
echo Committing files...
git commit -m "Initial commit: Add personal website files"
echo.

echo Setup complete! 
echo.
echo Next steps:
echo 1. Create a repository on GitHub
echo 2. Copy the remote add command from GitHub and run it
echo 3. Run: git push -u origin main
echo 4. Enable GitHub Pages in repository settings
echo.
echo For detailed instructions, see DEPLOYMENT_GUIDE.md
echo.
pause
