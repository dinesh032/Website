# Deploy Personal Website to GitHub Pages

This guide will help you deploy your personal website to GitHub Pages for free hosting.

## Prerequisites
- GitHub account (create one at https://github.com if you don't have one)
- Git installed on your computer
- Your website files ready

## Step-by-Step Deployment Guide

### Step 1: Create a GitHub Repository

1. **Go to GitHub**: Visit https://github.com and sign in
2. **Create New Repository**:
   - Click the "+" icon in the top-right corner
   - Select "New repository"
   - Name your repository (e.g., `personal-website` or `your-username.github.io`)
   - Make it **Public** (required for free GitHub Pages)
   - **Don't** initialize with README, .gitignore, or license (we have our files ready)
   - Click "Create repository"

### Step 2: Prepare Your Local Files

Open Command Prompt or Terminal in your project folder and run these commands:

```bash
# Initialize Git repository
git init

# Add all files to staging
git add .

# Commit your files
git commit -m "Initial commit: Add personal website"

# Add your GitHub repository as origin (replace with your actual repository URL)
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPOSITORY_NAME.git

# Push to GitHub
git branch -M main
git push -u origin main
```

### Step 3: Enable GitHub Pages

1. **Go to your repository** on GitHub
2. **Click on "Settings"** tab (top of the repository page)
3. **Scroll down to "Pages"** section in the left sidebar
4. **Under "Source"**:
   - Select "Deploy from a branch"
   - Choose "main" branch
   - Choose "/ (root)" folder
5. **Click "Save"**

### Step 4: Access Your Website

- Your website will be available at: `https://YOUR_USERNAME.github.io/YOUR_REPOSITORY_NAME/`
- If you named your repository `YOUR_USERNAME.github.io`, it will be available at: `https://YOUR_USERNAME.github.io/`
- It may take a few minutes for the site to become available

## Alternative: Using GitHub Desktop (GUI Method)

If you prefer a graphical interface:

1. **Download GitHub Desktop**: https://desktop.github.com/
2. **Install and sign in** with your GitHub account
3. **Create new repository**:
   - File → New Repository
   - Name: your-website-name
   - Local Path: Choose your website folder
   - Click "Create Repository"
4. **Publish to GitHub**:
   - Click "Publish repository"
   - Uncheck "Keep this code private"
   - Click "Publish Repository"
5. **Enable Pages** (follow Step 3 above)

## Updating Your Website

When you make changes to your website:

```bash
# Add changes
git add .

# Commit changes
git commit -m "Update website content"

# Push to GitHub
git push origin main
```

Your website will automatically update within a few minutes.

## Custom Domain (Optional)

To use a custom domain like `yourname.com`:

1. **Buy a domain** from a registrar (GoDaddy, Namecheap, etc.)
2. **Create a CNAME file** in your repository root:
   - File name: `CNAME` (no extension)
   - Content: `yourdomain.com`
3. **Configure DNS** at your domain registrar:
   - Add CNAME record pointing to `YOUR_USERNAME.github.io`
4. **Enable HTTPS** in GitHub Pages settings

## Troubleshooting

### Common Issues:

1. **404 Error**: 
   - Check if repository is public
   - Ensure `index.html` is in the root folder
   - Wait a few minutes for deployment

2. **CSS/JS Not Loading**:
   - Check file paths in HTML
   - Ensure files are committed to Git
   - Clear browser cache

3. **Changes Not Showing**:
   - Wait 5-10 minutes for propagation
   - Clear browser cache
   - Check if commit was successful

### Useful Commands:

```bash
# Check Git status
git status

# View commit history
git log --oneline

# Check remote repositories
git remote -v

# Pull latest changes
git pull origin main
```

## Best Practices

1. **Test Locally First**: Always test changes on your local machine
2. **Use Meaningful Commit Messages**: Describe what you changed
3. **Regular Backups**: Keep your code in multiple places
4. **Monitor Analytics**: Add Google Analytics to track visitors
5. **SEO Optimization**: Add meta tags and optimize for search engines

## Security Notes

- Never commit sensitive information (API keys, passwords)
- Use environment variables for sensitive data
- Keep your repository public for free GitHub Pages
- Regularly update dependencies

## Next Steps After Deployment

1. **Test thoroughly** on different devices and browsers
2. **Add Google Analytics** for visitor tracking
3. **Submit to search engines** (Google Search Console)
4. **Share your website** on social media and professional networks
5. **Keep content updated** regularly

## Example Repository Structure

```
personal-website/
├── index.html          # Main page
├── styles.css          # Styles
├── script.js           # JavaScript
├── README.md          # Documentation
├── CNAME              # Custom domain (optional)
├── .gitignore         # Git ignore file
└── images/            # Image assets (if any)
    ├── profile.jpg
    └── projects/
```

Your website should now be live and accessible to anyone on the internet!
