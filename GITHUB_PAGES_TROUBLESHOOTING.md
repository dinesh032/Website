# GitHub Pages Deployment Troubleshooting

## Issue: Cannot see "Deploy from a branch" option

This is a common issue due to recent GitHub interface changes. Here are the solutions:

## Solution 1: Check Repository Settings

### Step 1: Verify Repository is Public
- Go to your repository on GitHub
- Click **Settings** (top menu bar)
- Scroll to the bottom to **"Danger Zone"**
- If you see "Change repository visibility", your repo might be private
- Click "Change visibility" and make it **Public** (required for free GitHub Pages)

### Step 2: Navigate to Pages Settings
1. In your repository, click **Settings** tab
2. Scroll down the left sidebar to find **"Pages"** 
3. Click on **"Pages"**

### Step 3: Look for Different Interface Options

**Option A: New Interface (Build and deployment)**
- Under "Build and deployment"
- **Source** dropdown should show:
  - "GitHub Actions" (recommended)
  - "Deploy from a branch" (classic)

**Option B: If you see "GitHub Actions" selected by default:**
- This is the new recommended method
- Click the dropdown and select **"Deploy from a branch"**
- Then choose **"main"** branch and **"/ (root)"** folder

## Solution 2: Alternative - Use GitHub Actions (Recommended)

If you can't find the branch option, use the modern GitHub Actions method:

### Create GitHub Actions Workflow

1. In your repository, create this folder structure:
   ```
   .github/
   └── workflows/
       └── pages.yml
   ```

2. Add this content to `pages.yml`:

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [ main ]
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: "pages"
  cancel-in-progress: true

jobs:
  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v3
      
      - name: Setup Pages
        uses: actions/configure-pages@v2
      
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v1
        with:
          path: '.'
      
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v1
```

### Enable GitHub Actions Method
1. Go to **Settings** → **Pages**
2. Under "Source", select **"GitHub Actions"**
3. Commit and push the workflow file
4. Your site will deploy automatically

## Solution 3: Check Repository Requirements

### Repository Name Options

**Option A: User/Organization Site**
- Repository name: `yourusername.github.io`
- URL: `https://yourusername.github.io/`
- Pages enabled automatically

**Option B: Project Site**
- Repository name: any name (e.g., `personal-website`)
- URL: `https://yourusername.github.io/repository-name/`
- Requires manual Pages setup

## Solution 4: Manual Steps if Settings Missing

### If Pages section is missing entirely:

1. **Check repository permissions**:
   - You must be the repository owner or have admin access
   - Organization repositories may have restrictions

2. **Try different browser**:
   - Clear browser cache
   - Try incognito/private mode
   - Use different browser

3. **Check GitHub Status**:
   - Visit https://githubstatus.com/
   - GitHub Pages might be temporarily down

## Solution 5: Command Line Alternative

If the web interface isn't working, use the GitHub CLI:

```bash
# Install GitHub CLI if needed
# Windows: winget install GitHub.cli
# Mac: brew install gh
# Linux: See https://cli.github.com/

# Authenticate
gh auth login

# Enable Pages
gh api repos/:owner/:repo/pages \
  --method POST \
  --field source.branch=main \
  --field source.path="/"
```

## Verification Steps

After setup, verify your deployment:

1. **Check Actions tab**:
   - Look for "pages-build-deployment" workflow
   - Should show green checkmark when successful

2. **Visit your site**:
   - URL format: `https://username.github.io/repository-name/`
   - May take 5-10 minutes to become available

3. **Check Pages settings**:
   - Should show "Your site is published at [URL]"
   - Green checkmark indicates success

## Common Issues and Fixes

### Issue: 404 Error
- **Fix**: Ensure `index.html` is in repository root
- **Fix**: Check file names are correct (case-sensitive)
- **Fix**: Wait 5-10 minutes for deployment

### Issue: CSS/JS Not Loading
- **Fix**: Use relative paths in HTML (`./styles.css` not `/styles.css`)
- **Fix**: Check all files are committed to Git
- **Fix**: Clear browser cache

### Issue: Changes Not Showing
- **Fix**: Wait for Actions workflow to complete
- **Fix**: Hard refresh browser (Ctrl+F5)
- **Fix**: Check commit was successful

## Quick Deploy Script (Updated)

Here's an updated deployment script that handles the new interface:

```bash
# Quick deployment commands
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/USERNAME/REPO.git
git push -u origin main

# Then manually enable Pages in GitHub settings
```

## Need More Help?

If you're still having issues:

1. **Screenshot the Pages settings** - Share what you see
2. **Check repository visibility** - Must be public
3. **Try the GitHub Actions method** - More reliable
4. **Contact GitHub Support** - For account-specific issues

The GitHub Actions method is now the recommended approach and often works better than the traditional branch deployment.
