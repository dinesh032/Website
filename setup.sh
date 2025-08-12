#!/bin/bash

echo "Setting up your personal website for GitHub deployment..."
echo

# Check if Git is installed
if ! command -v git &> /dev/null; then
    echo "Error: Git is not installed"
    echo "Please install Git:"
    echo "  macOS: brew install git"
    echo "  Ubuntu/Debian: sudo apt install git"
    echo "  CentOS/RHEL: sudo yum install git"
    exit 1
fi

echo "Git is installed. Proceeding with setup..."
echo

# Initialize Git repository if not already initialized
if [ ! -d .git ]; then
    echo "Initializing Git repository..."
    git init
    echo
fi

# Add all files to Git
echo "Adding files to Git..."
git add .
echo

# Commit files
echo "Committing files..."
git commit -m "Initial commit: Add personal website files"
echo

echo "Setup complete!"
echo
echo "Next steps:"
echo "1. Create a repository on GitHub"
echo "2. Copy the remote add command from GitHub and run it"
echo "3. Run: git push -u origin main"
echo "4. Enable GitHub Pages in repository settings"
echo
echo "For detailed instructions, see DEPLOYMENT_GUIDE.md"
echo
