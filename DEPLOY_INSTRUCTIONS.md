# 🚀 Deploy to GitHub Pages - Step by Step

## The Issue
The build is failing because Freezed code generation doesn't work well in GitHub Actions for the first deployment.

## ✅ Solution: Build Locally First

### Step 1: Open Terminal/Command Prompt
```bash
cd C:\Users\DELL\Desktop\BlankBlitz
```

### Step 2: Install Dependencies
```bash
flutter pub get
```

### Step 3: Generate Freezed Code (IMPORTANT!)
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

**Wait 1-2 minutes** - This will generate all `.freezed.dart` and `.g.dart` files.

You'll see output like:
```
[INFO] Generating build script completed, took 15.2s
[INFO] Running build completed, took 45.3s
[INFO] Caching finalized dependency graph completed, took 456ms
```

### Step 4: Remove .gitignore Entry for Generated Files

We need to commit the generated files (just for the first deployment):

Open `.gitignore` and **comment out or remove** these lines:
```
# *.g.dart
# *.freezed.dart
```

### Step 5: Commit Generated Files
```bash
git add .
git commit -m "Add generated Freezed files for deployment"
```

### Step 6: Push to GitHub
```bash
git push origin main
```

### Step 7: Wait for Deployment
- Go to your repo: https://github.com/abhibond1986/BlankBlitz
- Click **Actions** tab
- Watch the workflow run (should take 3-5 minutes)
- ✅ Green checkmark = Success!

### Step 8: Visit Your Live App
After successful deployment, visit:
**https://abhibond1986.github.io/BlankBlitz/**

---

## 🎮 What You'll See

The actual Flutter web app with:
- Splash screen animation
- Login page
- Working game interface
- NOT just the README markdown!

---

## ⚠️ If Build Still Fails

If you get errors after Step 3, share the error message and I'll help fix it!

Common issues:
1. **Flutter not installed** → Install Flutter SDK
2. **Wrong directory** → Make sure you're in `BlankBlitz` folder
3. **Dependencies failed** → Run `flutter clean` then try again

---

## 🔄 Alternative: Test Locally First

Before deploying to web, test locally:

```bash
# Test on Android/Emulator
flutter run

# OR test in Chrome browser
flutter run -d chrome
```

This way you can see and play the game immediately!

---

## 📱 Local Testing (Recommended First!)

**EASIEST WAY TO SEE YOUR GAME:**

1. Open Android Studio or connect Android phone
2. Run:
```bash
flutter run
```

You'll see the actual game UI immediately - no web deployment needed!

---

**Need help?** Let me know which step fails and I'll guide you through it! 🚀
