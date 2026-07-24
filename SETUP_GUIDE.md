# 🚀 WordRush Setup & GitHub Pages Deployment Guide

## 📋 Prerequisites

- Flutter SDK installed (>=3.0.0)
- Git installed
- GitHub account

## 🎯 Quick Setup

### 1. Initialize Git Repository

```bash
cd WordRush
git init
git add .
git commit -m "Initial commit: WordRush game setup"
```

### 2. Create GitHub Repository

1. Go to [GitHub](https://github.com/new)
2. Create a new repository named `WordRush`
3. **Do NOT initialize with README** (we already have one)
4. Click "Create repository"

### 3. Connect to GitHub

```bash
# Add remote (replace YOUR_USERNAME with your GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/WordRush.git

# Push to GitHub
git branch -M main
git push -u origin main
```

## 🌐 Enable GitHub Pages

### Method 1: Automatic (GitHub Actions) ⭐ Recommended

1. Go to your repository on GitHub
2. Click **Settings** → **Pages**
3. Under "Build and deployment":
   - Source: Select **GitHub Actions**
4. The workflow file (`.github/workflows/web-deploy.yml`) is already set up!
5. Push any commit to `main` branch to trigger deployment:

```bash
git add .
git commit -m "Trigger deployment"
git push
```

6. After ~2-5 minutes, your game will be live at:
   `https://YOUR_USERNAME.github.io/WordRush/`

### Method 2: Manual

If you prefer manual deployment:

```bash
# Build for web
flutter build web --release --base-href /WordRush/

# Install gh-pages package (first time only)
npm install -g gh-pages

# Deploy
gh-pages -d build/web
```

## 🎮 Local Development

### Install Dependencies

```bash
flutter pub get
```

### Run on Web

```bash
flutter run -d chrome
```

### Run on Mobile

```bash
# Android
flutter run -d android

# iOS (Mac only)
flutter run -d ios
```

### Build Release

```bash
# Web
flutter build web --release

# Android APK
flutter build apk --release

# iOS (Mac only)
flutter build ios --release
```

## 📁 Project Structure Created

```
WordRush/
├── .github/
│   └── workflows/
│       └── web-deploy.yml     # Auto-deployment to GitHub Pages
├── lib/
│   ├── main.dart              # Entry point
│   ├── screens/               # Game screens (ready for your code)
│   ├── widgets/               # Reusable UI components
│   ├── models/                # Data models
│   ├── services/              # Game logic, storage
│   └── utils/                 # Helper functions
├── assets/
│   ├── images/                # Game graphics
│   └── sounds/                # Sound effects
├── test/                      # Unit tests
├── .gitignore                 # Git ignore rules
├── pubspec.yaml               # Dependencies
└── README.md                  # Project documentation
```

## 🔧 Configuration

### Update Base URL (if needed)

If your repository name is different, update `.github/workflows/web-deploy.yml`:

```yaml
- name: Build web
  run: flutter build web --release --base-href /YOUR_REPO_NAME/
```

### Add Custom Domain (optional)

1. Buy a domain
2. Add CNAME file: `echo "yourdomain.com" > web/CNAME`
3. Configure DNS settings in your domain provider
4. Enable HTTPS in GitHub Pages settings

## 📱 Add Repository Secrets (for advanced features)

If you need environment variables:

1. Go to **Settings** → **Secrets and variables** → **Actions**
2. Click **New repository secret**
3. Add your secrets

## 🎨 Customize Your Game

Now you're ready to build! In your next command, describe:
- Game mechanics
- UI/UX design
- Features you want
- Any specific requirements

I'll generate the complete game code for you!

## 🐛 Troubleshooting

### Issue: GitHub Actions failing
**Solution:** 
- Check Actions tab for error logs
- Ensure Flutter version in workflow matches your local version
- Verify all dependencies are in `pubspec.yaml`

### Issue: Web app shows blank page
**Solution:**
- Check browser console for errors
- Verify base-href in build command matches repo name
- Clear browser cache and reload

### Issue: Images not loading on GitHub Pages
**Solution:**
- Ensure images are in `assets/images/` folder
- Add assets to `pubspec.yaml`
- Use `Image.asset()` instead of absolute paths

## 📚 Useful Commands

```bash
# Check Flutter version
flutter --version

# Clean build artifacts
flutter clean

# Update dependencies
flutter pub upgrade

# Format code
flutter format .

# Analyze code
flutter analyze

# Run tests
flutter test
```

## 🎉 You're All Set!

Your WordRush project is ready for development. The GitHub repository will automatically:
- ✅ Deploy to GitHub Pages on every push to main
- ✅ Show live preview at `https://YOUR_USERNAME.github.io/WordRush/`
- ✅ Support PWA (Progressive Web App) features
- ✅ Work on all devices (mobile, tablet, desktop)

**Next step:** Describe your game idea and I'll create the complete implementation! 🚀
