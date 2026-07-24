# 🚀 BlankBlitz Setup Guide

## Quick Start (For Testing WITHOUT Backend)

This guide will help you run BlankBlitz with **mock data** (no Supabase/backend needed).

### Prerequisites

- Flutter SDK 3.24.0+ installed
- Android Studio or VS Code
- Git

### Step 1: Install Dependencies

```bash
cd BlankBlitz
flutter pub get
```

### Step 2: Generate Code (IMPORTANT!)

This generates all the Freezed models and JSON serialization:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

**Note:** This might take 1-2 minutes. You'll see output like:
```
[INFO] Generating build script completed, took 15.2s
[INFO] Running build completed, took 45.3s
[INFO] Caching finalized dependency graph completed, took 456ms
```

### Step 3: Run the App

**For Android:**
```bash
flutter run
```

**For Web:**
```bash
flutter run -d chrome
```

**For specific device:**
```bash
flutter devices  # List all devices
flutter run -d <device-id>
```

---

## 🎮 What You Can Test Right Now

### ✅ Working Features (Mock Data):

1. **Authentication**
   - Login with ANY email/password (e.g., `test@test.com` / `123456`)
   - Register new account
   - Auto-login on next launch

2. **Solo Practice Mode**
   - Click "Solo Practice" from home
   - 10 rounds of word puzzles
   - Real timer countdown
   - Score calculation
   - Results screen with stats

3. **UI Navigation**
   - Splash screen → Login → Home
   - All 5 game mode cards
   - Bottom navigation
   - Results screen

### ⬜ Not Yet Working (Needs Supabase):

- Quick Match (multiplayer matchmaking)
- Private Rooms
- Real-time multiplayer
- Leaderboards
- Friends system
- Persistent data across devices

---

## 🐛 Common Issues & Fixes

### Issue 1: "MissingPluginException"

**Fix:**
```bash
flutter clean
flutter pub get
flutter run
```

### Issue 2: "Freezed code not found"

**Fix:**
```bash
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
```

### Issue 3: Web build fails

**Fix:** Make sure you're using Flutter 3.24+
```bash
flutter --version
flutter upgrade
```

### Issue 4: Android build fails

**Fix:**
```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
flutter run
```

---

## 📱 Testing on Real Device

### Android:

1. Enable Developer Options on your phone
2. Enable USB Debugging
3. Connect via USB
4. Run `flutter devices` to see your device
5. Run `flutter run`

### iOS (Mac only):

1. Connect iPhone
2. Trust the computer
3. Open Xcode, add your Apple ID
4. Run `flutter run`

---

## 🌐 GitHub Pages Deployment

Your app will auto-deploy to GitHub Pages when you push to `main` branch!

**Live URL:** `https://<your-username>.github.io/BlankBlitz/`

### To Deploy:

```bash
git add .
git commit -m "Initial release"
git push origin main
```

Wait 2-3 minutes, then visit your GitHub Pages URL!

---

## 🔄 Next Steps (Supabase Integration)

When you're ready to add the backend:

1. Create a Supabase project at https://supabase.com
2. Create the database schema (see `docs/supabase_schema.sql`)
3. Replace mock data sources with Supabase clients
4. Update environment variables

**Detailed guide:** See `docs/SUPABASE_INTEGRATION.md` (coming soon!)

---

## 📖 More Documentation

- `README.md` - Project overview
- `ARCHITECTURE.md` - Code architecture
- `BUILD_INSTRUCTIONS.md` - Detailed build guide
- `WHAT_IVE_BUILT.md` - Feature breakdown

---

## 💬 Need Help?

- Check `BUILD_INSTRUCTIONS.md` for troubleshooting
- See Flutter docs: https://docs.flutter.dev
- Supabase docs: https://supabase.com/docs

---

**Ready to play?** 🎮

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
```

**Login with:** `test@test.com` / `password123`

**Enjoy BlankBlitz!** 🚀
