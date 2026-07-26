# 🚀 BlankBlitz - Complete Deployment Guide

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Supabase Backend Setup](#supabase-backend-setup)
3. [Flutter App Configuration](#flutter-app-configuration)
4. [Building for Production](#building-for-production)
5. [Web Deployment](#web-deployment)
6. [Mobile Deployment](#mobile-deployment)
7. [Testing & Verification](#testing--verification)

---

## Prerequisites

Before you begin, ensure you have:

- ✅ Flutter SDK (3.5.0 or higher)
- ✅ Dart SDK (3.5.0 or higher)
- ✅ Node.js (for Supabase CLI - optional)
- ✅ Git
- ✅ A Supabase account (free tier works)
- ✅ A code editor (VS Code recommended)

---

## Supabase Backend Setup

### Step 1: Database Schema Setup

1. **Go to your Supabase Dashboard**
   - URL: https://app.supabase.com/project/qockwvfaqttyucuymmzf

2. **Run the Database Schema**
   - Click on "SQL Editor" in the left sidebar
   - Click "New Query"
   - Copy and paste the entire contents of `supabase_schema.sql`
   - Click "Run" to execute
   - You should see "Success. No rows returned"

3. **Verify Tables Created**
   - Go to "Database" → "Tables"
   - You should see these tables:
     - `users`
     - `words`
     - `game_rooms`
     - `game_history`
     - `leaderboards`
     - `friendships`

### Step 2: Enable Authentication

1. **Enable Email Authentication**
   - Go to "Authentication" → "Providers"
   - Find "Email" provider
   - Toggle it ON
   - Save changes

2. **Configure Email Templates (Optional but Recommended)**
   - Go to "Authentication" → "Email Templates"
   - Customize:
     - Confirmation email
     - Password reset email
     - Magic link email

3. **Test Authentication**
   - Go to "Authentication" → "Users"
   - Click "Add user" → "Create new user"
   - Add a test user with email and password
   - Verify the user appears in the list

### Step 3: Configure Row Level Security (RLS)

The schema already includes RLS policies, but verify they're active:

1. Go to "Database" → "Tables"
2. For each table, click on it and go to "Policies"
3. Verify policies are listed and enabled

### Step 4: Enable Realtime (for Multiplayer)

1. Go to "Database" → "Replication"
2. Find the `game_rooms` table
3. Enable replication for real-time updates
4. Click "Save"

### Step 5: API Keys (Already Configured)

Your project is already configured with:
- **Project URL**: `https://qockwvfaqttyucuymmzf.supabase.co`
- **Anon Key**: Already in `lib/core/config/supabase_config.dart`

⚠️ **Security Note**: The anon key is safe to use in client apps, but never expose your `service_role` key!

---

## Flutter App Configuration

### Step 1: Install Dependencies

```bash
cd BlankBlitz
flutter clean
flutter pub get
```

### Step 2: Verify Supabase Configuration

The configuration is already set in `lib/core/config/supabase_config.dart`:

```dart
static const String supabaseUrl = 'https://qockwvfaqttyucuymmzf.supabase.co';
static const String supabaseAnonKey = 'eyJhbGc...'; // Already configured
```

### Step 3: Environment Variables (Optional - For Production)

For better security in production, use environment variables:

1. Create `.env` file in project root:
```env
SUPABASE_URL=https://qockwvfaqttyucuymmzf.supabase.co
SUPABASE_ANON_KEY=your_anon_key_here
```

2. Add to `.gitignore`:
```
.env
*.env
```

3. Build with environment variables:
```bash
flutter build web --dart-define=SUPABASE_URL=$SUPABASE_URL --dart-define=SUPABASE_ANON_KEY=$SUPABASE_ANON_KEY
```

---

## Building for Production

### Web Build

```bash
# Clean previous builds
flutter clean

# Get dependencies
flutter pub get

# Build for web (optimized)
flutter build web --release --web-renderer canvaskit

# Output will be in: build/web/
```

**Build Options:**
- `--web-renderer canvaskit` - Better for complex graphics (recommended)
- `--web-renderer html` - Faster loading, lighter weight
- `--web-renderer auto` - Flutter decides

### Android Build

```bash
# Build APK (for testing)
flutter build apk --release

# Build App Bundle (for Play Store)
flutter build appbundle --release

# Output: build/app/outputs/
```

### iOS Build (Mac only)

```bash
# Build iOS app
flutter build ios --release

# Or build with Xcode
open ios/Runner.xcworkspace
```

---

## Web Deployment

### Option 1: GitHub Pages (Free)

1. **Setup GitHub Pages**
```bash
# Add web build to gh-pages branch
cd build/web
git init
git add .
git commit -m "Deploy to GitHub Pages"
git branch -M gh-pages
git remote add origin https://github.com/yourusername/blankblitz.git
git push -u origin gh-pages
```

2. **Enable GitHub Pages**
   - Go to your repository settings
   - Navigate to "Pages"
   - Source: gh-pages branch
   - Save

Your app will be live at: `https://yourusername.github.io/blankblitz/`

### Option 2: Netlify (Free)

1. **Install Netlify CLI**
```bash
npm install -g netlify-cli
```

2. **Deploy**
```bash
cd build/web
netlify deploy --prod
```

3. **Follow prompts**
   - Create/link site
   - Specify build directory: `.` (current directory)
   - Confirm deployment

### Option 3: Vercel (Free)

1. **Install Vercel CLI**
```bash
npm install -g vercel
```

2. **Deploy**
```bash
cd build/web
vercel --prod
```

### Option 4: Firebase Hosting

1. **Install Firebase CLI**
```bash
npm install -g firebase-tools
```

2. **Initialize Firebase**
```bash
firebase login
firebase init hosting
# Select build/web as public directory
```

3. **Deploy**
```bash
firebase deploy --only hosting
```

### Option 5: Cloudflare Pages

1. Go to https://pages.cloudflare.com/
2. Connect your GitHub repository
3. Build settings:
   - Build command: `flutter build web --release`
   - Build output directory: `build/web`
4. Deploy

---

## Mobile Deployment

### Android - Google Play Store

1. **Prepare App**
   - Update version in `pubspec.yaml`
   - Update `android/app/build.gradle` with signing config
   - Create keystore for signing

2. **Generate Keystore**
```bash
keytool -genkey -v -keystore blankblitz-release.jks -keyalg RSA -keysize 2048 -validity 10000 -alias blankblitz
```

3. **Configure Signing**
   - Create `android/key.properties`:
```properties
storePassword=your_password
keyPassword=your_password
keyAlias=blankblitz
storeFile=../blankblitz-release.jks
```

4. **Build App Bundle**
```bash
flutter build appbundle --release
```

5. **Upload to Play Console**
   - Go to https://play.google.com/console
   - Create app listing
   - Upload `build/app/outputs/bundle/release/app-release.aab`
   - Fill in store listing details
   - Submit for review

### iOS - App Store

1. **Configure in Xcode**
```bash
open ios/Runner.xcworkspace
```

2. **Update Bundle ID and Signing**
   - Select Runner target
   - Update Bundle Identifier
   - Select your Team
   - Enable Automatic Signing

3. **Build Archive**
   - Product → Archive
   - Once complete, click "Distribute App"
   - Choose "App Store Connect"
   - Follow prompts

4. **Upload to App Store Connect**
   - Go to https://appstoreconnect.apple.com
   - Create app
   - Fill in app information
   - Submit for review

---

## Testing & Verification

### 1. Test Authentication Flow

```bash
# Run in debug mode
flutter run -d chrome
```

Test scenarios:
- ✅ Register new user
- ✅ Login with credentials
- ✅ Logout
- ✅ Check user persists after app restart

### 2. Test Database Connection

Check in Supabase Dashboard:
- Go to "Authentication" → "Users"
- Verify new users appear
- Go to "Database" → "Table Editor" → "users"
- Verify user profile data is saved

### 3. Test Game Functionality

- ✅ Start practice game
- ✅ Submit answers
- ✅ Check scoring
- ✅ Verify game history saved
- ✅ Test multiplayer room creation

### 4. Performance Testing

```bash
# Run performance test
flutter run --profile

# Check build size
flutter build web --release
ls -lh build/web/
```

### 5. Cross-Browser Testing

Test on:
- ✅ Chrome
- ✅ Firefox
- ✅ Safari
- ✅ Edge

---

## Post-Deployment Checklist

### Security
- [ ] All API keys secured
- [ ] RLS policies tested
- [ ] Authentication working properly
- [ ] No sensitive data exposed in logs

### Performance
- [ ] App loads in <3 seconds
- [ ] Images optimized
- [ ] Lazy loading implemented
- [ ] Caching configured

### Functionality
- [ ] All game modes working
- [ ] Realtime multiplayer tested
- [ ] Leaderboards updating
- [ ] In-app purchases functional (if applicable)

### Analytics & Monitoring
- [ ] Analytics configured (Firebase/Sentry)
- [ ] Error tracking enabled
- [ ] User feedback mechanism
- [ ] Crash reporting active

---

## Troubleshooting

### Build Issues

**Problem**: Flutter build fails
```bash
# Solution
flutter clean
flutter pub get
flutter pub upgrade
flutter build web --release
```

**Problem**: Supabase connection timeout
```bash
# Check your network
# Verify Supabase project is active
# Check API keys are correct
```

### Runtime Issues

**Problem**: Authentication not working
- Verify Supabase email provider is enabled
- Check email templates are configured
- Verify RLS policies allow user creation

**Problem**: Realtime not updating
- Enable replication in Supabase for `game_rooms`
- Check network connectivity
- Verify user is authenticated

### Database Issues

**Problem**: Can't insert data
- Check RLS policies
- Verify user is authenticated
- Check table schemas match models

---

## Monitoring & Maintenance

### 1. Monitor Supabase Usage

Go to Supabase Dashboard → "Settings" → "Usage"

Watch:
- Database size
- API requests
- Storage usage
- Active connections

### 2. Database Backups

Supabase automatically backs up your database, but you can also:

```bash
# Export database
supabase db dump -f backup.sql

# Import database
supabase db push backup.sql
```

### 3. Update Dependencies

```bash
# Check for outdated packages
flutter pub outdated

# Update all packages
flutter pub upgrade

# Update Flutter SDK
flutter upgrade
```

---

## Support & Resources

### Official Documentation
- Flutter: https://flutter.dev/docs
- Supabase: https://supabase.com/docs
- Go Router: https://pub.dev/packages/go_router
- Riverpod: https://riverpod.dev

### Supabase Dashboard
- Project: https://app.supabase.com/project/qockwvfaqttyucuymmzf
- SQL Editor: https://app.supabase.com/project/qockwvfaqttyucuymmzf/sql
- Auth: https://app.supabase.com/project/qockwvfaqttyucuymmzf/auth/users

### Community
- Flutter Discord: https://discord.gg/flutter
- Supabase Discord: https://discord.supabase.com

---

## Quick Reference Commands

```bash
# Development
flutter run -d chrome
flutter run -d android
flutter run -d ios

# Testing
flutter test
flutter analyze

# Building
flutter build web --release
flutter build apk --release
flutter build appbundle --release
flutter build ios --release

# Cleaning
flutter clean
flutter pub get

# Debugging
flutter logs
flutter doctor
flutter doctor -v
```

---

## Next Steps

1. ✅ Set up Supabase database (schema already created)
2. ✅ Configure authentication
3. ⏳ Add sample words to database
4. ⏳ Test authentication flow
5. ⏳ Test game functionality
6. ⏳ Build for production
7. ⏳ Deploy to hosting platform
8. ⏳ Submit to app stores

---

## Notes

- The app is configured with your Supabase credentials
- All backend functionality is ready to use
- Just run `flutter pub get` and start testing!
- Remember to add the app logo (`logo.png`) to `assets/images/` folder

**You're all set! 🎮 Let's build something amazing!**
