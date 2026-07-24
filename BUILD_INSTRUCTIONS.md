# 🛠️ BlankBlitz - Build Instructions

## 📋 Prerequisites

- Flutter SDK 3.24.0 or higher
- Dart 3.5.0 or higher
- Android Studio / VS Code
- Git

---

## 🚀 Setup Steps

### 1. Install Dependencies

```bash
cd BlankBlitz
flutter pub get
```

### 2. Run Code Generation

**IMPORTANT:** Run this to generate Freezed and JSON serialization code:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

This will generate:
- `*.freezed.dart` files (Freezed immutable models)
- `*.g.dart` files (JSON serialization)

**Expected output:**
```
[INFO] Generating build script completed, took 542ms
[INFO] Creating build script snapshot... completed, took 8.2s
[INFO] Running build completed, took 12.3s
[INFO] Caching finalized dependency graph completed, took 45ms
[INFO] Succeeded after 12.4s with 142 outputs
```

### 3. Verify Build

Check that generated files exist:

```bash
# Check user model generation
ls lib/data/models/user_model.freezed.dart
ls lib/data/models/user_model.g.dart

# Check game models generation
ls lib/data/models/game_room_model.freezed.dart
ls lib/data/models/word_model.freezed.dart
ls lib/data/models/answer_model.freezed.dart
```

### 4. Run the App

```bash
flutter run
```

**What you'll see:**
1. Splash screen with animated logo
2. Login screen (beautiful gradient UI)
3. Register screen (if you click "Sign Up")
4. Home screen (after successful login)

---

## 🐛 Troubleshooting

### Error: "The getter 'copyWith' isn't defined"
**Solution:** Run code generation:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Error: "No Firebase App '[DEFAULT]' has been created"
**Solution:** This is expected. We're using Cloudflare, not Firebase. The error should not appear in current version.

### Error: "Could not resolve package:freezed_annotation"
**Solution:** Run `flutter pub get`

### Error: "Conflicting outputs"
**Solution:** Use `--delete-conflicting-outputs` flag:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Error: Build runner hangs
**Solution:** Clean and rebuild:
```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## 📱 Testing Without Backend

The app is designed to work with Cloudflare Workers backend. Until the backend is deployed:

**What works:**
- ✅ Navigation between screens
- ✅ UI animations
- ✅ Form validation
- ✅ State management

**What needs backend:**
- ⬜ Actual login/register (will show network errors)
- ⬜ Game rooms
- ⬜ Multiplayer features

**Temporary solution:** Comment out API calls in `CloudflareAuthDataSource` to test UI:

```dart
// lib/data/datasources/remote/cloudflare_auth_datasource.dart
Future<UserModel> login(...) async {
  // Mock successful login for UI testing
  return UserModel(
    id: 'test_user_123',
    username: 'TestPlayer',
    email: 'test@example.com',
    coins: 1000,
    gems: 50,
    rank: 'GOLD',
    level: 15,
    // ... other fields
  );
}
```

---

## 🏗️ Project Structure

```
lib/
├── core/
│   ├── config/           # App configuration
│   ├── constants/        # Constants
│   ├── errors/          # Error handling
│   ├── network/         # API client
│   └── theme/           # Theme & colors
├── data/
│   ├── datasources/     # API & local storage
│   ├── models/          # Freezed data models
│   └── repositories/    # Repository implementations
├── domain/
│   ├── entities/        # Business entities
│   └── repositories/    # Repository interfaces
├── presentation/
│   ├── providers/       # Riverpod state management
│   ├── routes/          # Navigation
│   ├── screens/         # UI screens
│   └── widgets/         # Reusable widgets
└── main.dart            # App entry point
```

---

## 🎨 Current Features

### ✅ Complete:
1. **Authentication System**
   - Login screen with validation
   - Register screen with terms
   - JWT token management
   - State management with Riverpod

2. **Home Screen**
   - User profile header
   - Rank & level display
   - Coins & gems
   - 5 game mode cards
   - Bottom navigation

3. **Data Models**
   - User model
   - GameRoom model
   - Word model
   - Answer model
   - All with Freezed + JSON

4. **Architecture**
   - Clean Architecture (3 layers)
   - MVVM pattern
   - Repository pattern
   - Either type error handling

### ⬜ In Progress:
- Game repository layer
- Word engine
- Game lobby screen
- Gameplay screen
- Real-time multiplayer

---

## 📊 Code Generation Commands

### Generate once:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Watch mode (auto-generate on file changes):
```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```

### Clean generated files:
```bash
flutter pub run build_runner clean
```

---

## 🚀 Deployment Checklist

### Before deploying to Play Store:

1. **Backend Setup:**
   - [ ] Deploy Cloudflare Workers
   - [ ] Set up D1 database
   - [ ] Configure Durable Objects
   - [ ] Test all API endpoints

2. **App Configuration:**
   - [ ] Update API base URL in `ApiClient`
   - [ ] Set production Firebase config (if using)
   - [ ] Configure app signing
   - [ ] Update version numbers

3. **Testing:**
   - [ ] Unit tests
   - [ ] Widget tests
   - [ ] Integration tests
   - [ ] Performance testing

4. **Assets:**
   - [ ] App icon (adaptive icon)
   - [ ] Splash screen
   - [ ] Screenshots for Play Store
   - [ ] Feature graphic

5. **Documentation:**
   - [ ] Privacy policy
   - [ ] Terms of service
   - [ ] App description
   - [ ] What's new

---

## 💡 Development Tips

### Hot Reload
After UI changes, press `r` in terminal or IDE for hot reload.

### Full Restart
After model changes, press `R` for full restart.

### Debug Mode
The app runs in debug mode by default. For release build:
```bash
flutter build apk --release
```

### Check for Issues
```bash
flutter analyze
```

### Format Code
```bash
dart format .
```

---

## 📚 Useful Commands

```bash
# Check Flutter version
flutter --version

# Check for updates
flutter upgrade

# Clear all caches
flutter clean

# Install dependencies
flutter pub get

# Run on specific device
flutter devices
flutter run -d <device-id>

# Build release APK
flutter build apk --release

# Build release bundle
flutter build appbundle --release
```

---

**Happy coding! 🎮**

*For questions, check ARCHITECTURE.md and CLOUDFLARE_ARCHITECTURE.md*
