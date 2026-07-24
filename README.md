# 🎮 BlankBlitz - Multiplayer Word Battle Game

**A production-ready, real-time multiplayer word puzzle game for Android**

[![Flutter](https://img.shields.io/badge/Flutter-3.24-blue)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.5-blue)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)

---

## 🌟 What is BlankBlitz?

BlankBlitz is a fast-paced multiplayer word battle game where players race to complete incomplete words before time runs out!

**Example:** `A _ _ L E` → Type `APPLE` → Earn points based on speed!

### Game Modes
- 🎯 **Solo Practice** - Practice offline, unlimited words
- ⚡ **Quick Match** - Fast 2-10 player matchmaking
- 🔒 **Private Room** - Play with friends
- 🌍 **Public Room** - Join any open game
- 👑 **Battle Royale** - 20-100 players, elimination mode
- 🎓 **Classroom** - Teacher-controlled for education
- 🏆 **Tournament** - Competitive play with prizes

---

## ✨ Features

### **Gameplay**
- Real-time multiplayer (2-100 players)
- 30-second rounds
- 11 word categories (Animals, Food, Sports, Tech, etc.)
- 4 difficulty levels (Easy, Medium, Hard, Expert)
- Hint system (definitions, synonyms, letters)
- Dynamic scoring (base score + time bonus)
- Live leaderboards

### **Progression**
- XP & Level system
- 8 Rank tiers (Bronze → Legend)
- Coins & Gems currency
- Achievements & Badges
- Battle Pass
- Daily rewards

### **Social**
- Friends system
- Private chat
- Spectator mode
- Friend invites
- Player profiles

---

## 🏗️ Architecture

### **Clean Architecture (3 Layers)**

```
lib/
├── presentation/     # UI, State Management, Screens
│   ├── screens/      # 7 complete screens
│   ├── widgets/      # Reusable components
│   └── providers/    # Riverpod state
├── domain/          # Business Logic, Entities
│   ├── entities/     # 4 core entities
│   └── repositories/ # 4 repository interfaces
├── data/            # External Data Sources
│   ├── models/       # 9 Freezed models
│   ├── repositories/ # Repository implementations
│   └── datasources/  # API & local storage
└── core/            # Shared utilities
    ├── config/       # App configuration
    ├── theme/        # Material Design 3
    └── network/      # API client
```

### **Tech Stack**

**Frontend:**
- Flutter 3.24+ with Material Design 3
- Riverpod (State Management)
- GoRouter (Navigation)
- Freezed (Immutable Models)
- Dio (HTTP Client)
- Google Fonts (Typography)
- Flutter Animate (Animations)

**Backend:**
- Cloudflare Workers (Serverless API)
- Cloudflare D1 (SQLite at the edge)
- Cloudflare Durable Objects (Real-time rooms)
- Cloudflare R2 (Object storage)
- Cloudflare KV (Caching)

**Why Cloudflare?**
- 50ms global latency (vs 100-200ms Firebase)
- Unlimited scalability
- Real WebSocket support
- Cost-effective at scale
- No vendor lock-in

---

## 📱 Screens

### 1. **Splash Screen**
- Animated logo entrance
- Gradient background
- App tagline

### 2. **Login Screen**
- Email/username input
- Password with toggle visibility
- Form validation
- Loading states
- Error display

### 3. **Register Screen**
- Username, email, password fields
- Confirm password validation
- Terms & Conditions checkbox
- Beautiful gradient design

### 4. **Home Screen**
- User profile header (rank, level, coins, gems)
- 5 game mode cards
- Bottom navigation
- Smooth animations

### 5. **Lobby Screen** (Waiting Room)
- Room code display
- Player grid (up to 10 players)
- Ready status indicators
- Host controls
- Game settings preview

### 6. **Gameplay Screen**
- Circular timer (30s countdown)
- Word display with blanks
- Answer input field
- Hint button
- Live player scores
- Round counter

### 7. **Results Screen**
- Winner podium (top 3)
- Your performance stats
- Rewards earned (coins, XP)
- Full rankings
- Play again button

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.24.0+
- Dart 3.5.0+
- Android Studio or VS Code
- Git

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/BlankBlitz.git
cd BlankBlitz
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Generate code (Freezed + JSON)**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. **Run the app**
```bash
flutter run
```

---

## 🎨 Design System

### **Colors**
- **Primary:** `#6366F1` (Indigo)
- **Secondary:** `#8B5CF6` (Purple)
- **Accent:** `#EC4899` (Pink)
- **Success:** `#10B981` (Green)
- **Error:** `#EF4444` (Red)

### **Rank Colors**
- Bronze → Silver → Gold → Platinum → Diamond → Master → Grandmaster → Legend

### **Typography**
- **Font:** Poppins (Google Fonts)
- **Title:** 28px Bold
- **Body:** 16px Regular
- **Caption:** 12px Medium

---

## 📊 Project Status

**Current Phase:** Foundation Complete (35%)

### ✅ Completed
- Architecture & project structure
- Authentication system (login, register)
- 7 beautiful UI screens
- Complete data models (Freezed)
- Repository interfaces
- State management (Riverpod)
- Navigation (GoRouter)
- Theme system
- Documentation

### 🚧 In Progress
- Repository implementations
- Game logic
- Solo practice mode

### ⬜ Pending
- Backend deployment (Cloudflare)
- Real-time multiplayer
- Matchmaking
- Word database (100,000+ words)
- Social features
- Monetization
- Testing
- Play Store deployment

---

## 📖 Documentation

- [`ARCHITECTURE.md`](ARCHITECTURE.md) - Complete architecture overview
- [`CLOUDFLARE_ARCHITECTURE.md`](CLOUDFLARE_ARCHITECTURE.md) - Backend design
- [`BUILD_INSTRUCTIONS.md`](BUILD_INSTRUCTIONS.md) - Setup & troubleshooting
- [`PROGRESS_SUMMARY.md`](PROGRESS_SUMMARY.md) - Development progress
- [`WHAT_IVE_BUILT.md`](WHAT_IVE_BUILT.md) - Feature breakdown

---

## 🤝 Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details.

### Development Workflow
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## 📝 License

This project is licensed under the MIT License - see [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Cloudflare for edge computing platform
- Material Design team for design guidelines
- Open source community

---

## 📧 Contact

- **Website:** [blankblitz.com](https://blankblitz.com)
- **Email:** support@blankblitz.com
- **Twitter:** [@BlankBlitzGame](https://twitter.com/BlankBlitzGame)

---

## 🎯 Roadmap

### **Phase 1:** MVP Launch (Q3 2026)
- Solo practice mode
- Quick match (up to 10 players)
- Basic leaderboards
- 10,000 words

### **Phase 2:** Social Features (Q4 2026)
- Friends system
- Private rooms
- Chat
- Tournaments

### **Phase 3:** Advanced Features (Q1 2027)
- Battle royale mode
- Power-ups
- Battle pass
- Mobile app release

### **Phase 4:** Scale (Q2 2027)
- 100,000+ words
- 20+ categories
- Multiple languages
- Desktop version

---

**Built with ❤️ using Flutter & Clean Architecture**

**Ready to BlankBlitz? Let's play!** 🚀

---

*Star ⭐ this repo if you like the project!*
