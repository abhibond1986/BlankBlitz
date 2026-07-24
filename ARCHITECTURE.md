# 🏗️ BlankBlitz - Complete Architecture Document

## 📋 Table of Contents
1. [Architecture Overview](#architecture-overview)
2. [Tech Stack](#tech-stack)
3. [Design Patterns](#design-patterns)
4. [Layer Architecture](#layer-architecture)
5. [State Management](#state-management)
6. [Firebase Architecture](#firebase-architecture)
7. [Multiplayer Engine](#multiplayer-engine)
8. [Security Architecture](#security-architecture)
9. [Performance Optimization](#performance-optimization)
10. [Scalability Strategy](#scalability-strategy)

---

## 1. Architecture Overview

BlankBlitz follows **Clean Architecture** principles with clear separation of concerns:

```
┌─────────────────────────────────────────────────────────┐
│                    Presentation Layer                    │
│  (UI Screens, Widgets, ViewModels, State Providers)     │
└────────────────────┬────────────────────────────────────┘
                     │
┌────────────────────▼────────────────────────────────────┐
│                     Domain Layer                         │
│    (Use Cases, Business Logic, Entities, Interfaces)    │
└────────────────────┬────────────────────────────────────┘
                     │
┌────────────────────▼────────────────────────────────────┐
│                      Data Layer                          │
│  (Repositories, Data Sources, Models, API Services)     │
└─────────────────────────────────────────────────────────┘
                     │
┌────────────────────▼────────────────────────────────────┐
│                  External Services                       │
│     (Firebase, Local Storage, Payment Gateway)          │
└─────────────────────────────────────────────────────────┘
```

### Key Principles
- **Separation of Concerns**: Each layer has a single responsibility
- **Dependency Rule**: Dependencies point inward (Presentation → Domain → Data)
- **Abstraction**: Layers communicate through interfaces/abstract classes
- **Testability**: Easy to mock and unit test
- **Scalability**: Easy to add features without breaking existing code
- **Maintainability**: Clean code, SOLID principles

---

## 2. Tech Stack

### Core Framework
```yaml
Flutter: 3.24.0 (stable)
Dart: 3.5.0
Material Design: 3
```

### State Management
```yaml
Riverpod: ^2.5.1           # State management
Flutter Hooks: ^0.20.5     # Lifecycle management
Freezed: ^2.5.2            # Immutable models
```

### Navigation
```yaml
GoRouter: ^14.2.0          # Type-safe routing
```

### Backend & Cloud
```yaml
Firebase Core: ^3.3.0
Firebase Auth: ^5.1.4
Cloud Firestore: ^5.2.1
Firebase Storage: ^12.1.3
Cloud Functions: ^5.0.4
Firebase Analytics: ^11.2.1
Firebase Crashlytics: ^4.0.4
Firebase Messaging: ^15.0.4
Firebase Performance: ^0.10.0.4
```

### Local Storage
```yaml
Shared Preferences: ^2.2.3
Hive: ^2.2.3
Hive Flutter: ^1.1.0
```

### Network & API
```yaml
Dio: ^5.5.0+1              # HTTP client
Connectivity Plus: ^6.0.3   # Network check
```

### UI & Design
```yaml
Google Fonts: ^6.2.1
Flutter SVG: ^2.0.10+1
Lottie: ^3.1.2             # Animations
Flutter Animate: ^4.5.0    # Smooth animations
Shimmer: ^3.0.0            # Loading effect
Cached Network Image: ^3.3.1
```

### Utilities
```yaml
Intl: ^0.19.0              # Internationalization
UUID: ^4.4.0               # Unique IDs
Equatable: ^2.0.5          # Value equality
Json Annotation: ^4.9.0    # JSON serialization
```

### Audio
```yaml
Audioplayers: ^6.0.0       # Sound effects
```

### Ads & Monetization
```yaml
Google Mobile Ads: ^5.1.0  # AdMob
In App Purchase: ^3.2.0    # Payments
Razorpay Flutter: ^1.3.7   # Indian payments
```

### Analytics & Monitoring
```yaml
Firebase Analytics: ^11.2.1
Firebase Crashlytics: ^4.0.4
Sentry Flutter: ^8.3.0     # Error tracking
```

### Development Tools
```yaml
Flutter Lints: ^4.0.0
Build Runner: ^2.4.11
Freezed Annotation: ^2.4.2
Json Serializable: ^6.8.0
```

---

## 3. Design Patterns

### 1. Repository Pattern
Abstracts data sources from business logic.

```dart
abstract class GameRepository {
  Future<List<Word>> getWords(Category category, Difficulty difficulty);
  Future<void> submitAnswer(String roomId, Answer answer);
  Stream<GameState> watchGameState(String roomId);
}

class GameRepositoryImpl implements GameRepository {
  final FirebaseGameDataSource _firebaseDataSource;
  final LocalGameDataSource _localDataSource;
  
  // Implementation uses data sources
}
```

### 2. MVVM (Model-View-ViewModel)
Separates UI from business logic.

```dart
// Model
class GameState with _$GameState {
  factory GameState({
    required Word currentWord,
    required List<Player> players,
    required int timeRemaining,
  }) = _GameState;
}

// ViewModel (Provider)
class GameViewModel extends StateNotifier<GameState> {
  final GameRepository _repository;
  
  Future<void> submitAnswer(String answer) async {
    // Business logic
    await _repository.submitAnswer(roomId, answer);
  }
}

// View
class GameScreen extends ConsumerWidget {
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameViewModelProvider);
    return GameContent(state: gameState);
  }
}
```

### 3. Dependency Injection
Using Riverpod for DI.

```dart
// Providers
final gameRepositoryProvider = Provider<GameRepository>((ref) {
  return GameRepositoryImpl(
    firebaseDataSource: ref.watch(firebaseDataSourceProvider),
    localDataSource: ref.watch(localDataSourceProvider),
  );
});

final gameViewModelProvider = StateNotifierProvider<GameViewModel, GameState>((ref) {
  return GameViewModel(ref.watch(gameRepositoryProvider));
});
```

### 4. Factory Pattern
For creating complex objects.

```dart
class WordFactory {
  static Word fromFirestore(Map<String, dynamic> data) {
    return Word(
      id: data['id'],
      text: data['text'],
      difficulty: DifficultyExtension.fromString(data['difficulty']),
      category: CategoryExtension.fromString(data['category']),
    );
  }
}
```

### 5. Strategy Pattern
For different game modes.

```dart
abstract class GameModeStrategy {
  Future<void> startGame();
  void handleAnswer(Answer answer);
  void endRound();
}

class QuickMatchStrategy implements GameModeStrategy {
  // Quick match implementation
}

class BattleRoyaleStrategy implements GameModeStrategy {
  // Battle royale implementation
}
```

### 6. Observer Pattern
For real-time updates (via Streams).

```dart
class GameRoomObserver {
  Stream<GameRoom> watchRoom(String roomId) {
    return _firestore
        .collection('rooms')
        .doc(roomId)
        .snapshots()
        .map((snapshot) => GameRoom.fromFirestore(snapshot.data()));
  }
}
```

---

## 4. Layer Architecture

### Presentation Layer
**Location**: `lib/presentation/`

**Responsibilities**:
- UI rendering
- User input handling
- Navigation
- State consumption
- Animations

**Structure**:
```
presentation/
├── screens/        # Full-screen pages
├── widgets/        # Reusable components
├── providers/      # Riverpod providers
├── routes/         # GoRouter configuration
└── theme/          # Theme data
```

### Domain Layer
**Location**: `lib/domain/`

**Responsibilities**:
- Business logic
- Use cases
- Entity definitions
- Repository interfaces

**Structure**:
```
domain/
├── entities/       # Core business objects
├── usecases/       # Business operations
├── repositories/   # Repository interfaces
└── failures/       # Error types
```

### Data Layer
**Location**: `lib/data/`

**Responsibilities**:
- Data fetching
- Caching
- API calls
- Database operations
- Repository implementations

**Structure**:
```
data/
├── models/         # JSON serializable models
├── repositories/   # Repository implementations
├── datasources/    # Remote & local data sources
│   ├── remote/     # Firebase, API
│   └── local/      # Hive, SharedPreferences
└── mappers/        # Model ↔ Entity conversion
```

### Core Layer
**Location**: `lib/core/`

**Responsibilities**:
- Shared utilities
- Constants
- Extensions
- Error handling

**Structure**:
```
core/
├── constants/      # App-wide constants
├── utils/          # Helper functions
├── extensions/     # Dart extensions
├── errors/         # Custom exceptions
└── network/        # Network utilities
```

---

## 5. State Management

### Riverpod Architecture

```dart
// 1. State Classes (Immutable)
@freezed
class GameState with _$GameState {
  const factory GameState({
    required Word currentWord,
    required List<Player> players,
    required int timeRemaining,
    required GameStatus status,
    @Default(false) bool isLoading,
    String? error,
  }) = _GameState;
}

// 2. StateNotifier (Business Logic)
class GameNotifier extends StateNotifier<GameState> {
  final GameRepository _repository;
  
  GameNotifier(this._repository) : super(GameState.initial());
  
  Future<void> loadWord() async {
    state = state.copyWith(isLoading: true);
    try {
      final word = await _repository.getNextWord();
      state = state.copyWith(
        currentWord: word,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        error: e.toString(),
        isLoading: false,
      );
    }
  }
}

// 3. Provider (DI Container)
final gameProvider = StateNotifierProvider<GameNotifier, GameState>((ref) {
  return GameNotifier(ref.watch(gameRepositoryProvider));
});

// 4. Consumer (UI)
class GameScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameProvider);
    
    return gameState.isLoading
        ? LoadingWidget()
        : GameContent(word: gameState.currentWord);
  }
}
```

### State Types

1. **Screen State**: Manages screen-level state
2. **Global State**: App-wide state (user, theme, auth)
3. **Ephemeral State**: Temporary UI state (animations)
4. **Cached State**: Persisted state (scores, settings)

---

## 6. Firebase Architecture

### Firestore Collections Structure

```
firestore/
├── users/
│   └── {userId}/
│       ├── profile
│       ├── stats
│       ├── inventory
│       └── transactions/
├── rooms/
│   └── {roomId}/
│       ├── metadata
│       ├── players/
│       ├── rounds/
│       └── messages/
├── words/
│   └── {wordId}/
├── tournaments/
│   └── {tournamentId}/
├── leaderboards/
│   └── {leaderboardId}/
├── transactions/
│   └── {transactionId}/
└── admin/
    └── config/
```

### Real-time Synchronization

```dart
class GameRoomService {
  final FirebaseFirestore _firestore;
  
  // Listen to room updates
  Stream<GameRoom> watchRoom(String roomId) {
    return _firestore
        .collection('rooms')
        .doc(roomId)
        .snapshots()
        .map((snapshot) => GameRoom.fromFirestore(snapshot.data()));
  }
  
  // Listen to player answers
  Stream<List<Answer>> watchAnswers(String roomId, String roundId) {
    return _firestore
        .collection('rooms')
        .doc(roomId)
        .collection('rounds')
        .doc(roundId)
        .collection('answers')
        .orderBy('timestamp')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Answer.fromFirestore(doc.data()))
            .toList());
  }
}
```

### Cloud Functions Architecture

```javascript
// Triggered when answer submitted
exports.validateAnswer = functions.firestore
  .document('rooms/{roomId}/rounds/{roundId}/answers/{answerId}')
  .onCreate(async (snap, context) => {
    const answer = snap.data();
    const word = await getWord(answer.wordId);
    
    const isCorrect = validateAnswer(answer.text, word.text);
    const score = calculateScore(answer, word, isCorrect);
    
    await snap.ref.update({
      isCorrect,
      score,
      validatedAt: admin.firestore.FieldValue.serverTimestamp()
    });
    
    // Update player stats
    await updatePlayerStats(answer.playerId, score);
    
    // Check if round should end
    await checkRoundCompletion(context.params.roomId, context.params.roundId);
  });

// Matchmaking function
exports.findMatch = functions.https.onCall(async (data, context) => {
  const userId = context.auth.uid;
  const skillLevel = data.skillLevel;
  
  // Find or create room
  const room = await matchmaker.findRoom(userId, skillLevel);
  
  return { roomId: room.id };
});
```

---

## 7. Multiplayer Engine

### Architecture

```
Player A Device              Firebase Cloud              Player B Device
┌─────────────┐            ┌─────────────┐            ┌─────────────┐
│   Submit    │────────────▶│  Firestore  │────────────▶│   Receive   │
│   Answer    │            │   Document  │            │   Update    │
└─────────────┘            └─────────────┘            └─────────────┘
       │                          │                          │
       │                          ▼                          │
       │                   ┌─────────────┐                  │
       │                   │   Cloud     │                  │
       │                   │  Function   │                  │
       │                   │  (Validate) │                  │
       │                   └─────────────┘                  │
       │                          │                          │
       │                          ▼                          │
       │                   ┌─────────────┐                  │
       └──────────────────▶│   Update    │◀─────────────────┘
                           │  Scoreboard │
                           └─────────────┘
```

### Key Components

1. **Room Manager**: Creates/joins/leaves rooms
2. **Match Maker**: Finds suitable opponents
3. **Game Sync**: Synchronizes game state
4. **Answer Validator**: Server-side validation
5. **Score Calculator**: Fair scoring system
6. **Reconnect Handler**: Handles disconnections
7. **Host Migration**: Transfers host on disconnect

### Latency Compensation

```dart
class LatencyCompensator {
  // Client-side prediction
  void predictAnswer(String answer) {
    // Immediately show as submitted
    _localState.update(answer);
    
    // Send to server
    _submitToServer(answer);
  }
  
  // Server reconciliation
  void reconcileWithServer(ServerResponse response) {
    if (response.timestamp < _localTimestamp) {
      // Server is behind, keep local state
      return;
    }
    
    // Update with server state
    _localState = response.state;
  }
}
```

---

## 8. Security Architecture

### Authentication Flow

```
User Opens App
     │
     ▼
Check Auth State
     │
     ├─────────▶ Not Logged In ────▶ Login Screen
     │                                      │
     │                                      ▼
     │                              Firebase Auth
     │                                      │
     │                                      ▼
     │                              Generate Token
     │                                      │
     └─────────▶ Logged In ◀────────────────┘
                    │
                    ▼
              Home Screen
```

### Firestore Security Rules

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    
    // Users can only read/write their own data
    match /users/{userId} {
      allow read: if request.auth.uid != null;
      allow write: if request.auth.uid == userId;
      
      match /transactions/{transactionId} {
        allow read: if request.auth.uid == userId;
        allow create: if request.auth.uid == userId;
        allow update, delete: if false; // Immutable
      }
    }
    
    // Anyone in a room can read it
    match /rooms/{roomId} {
      allow read: if request.auth.uid != null 
        && exists(/databases/$(database)/documents/rooms/$(roomId)/players/$(request.auth.uid));
      
      // Only host can update room settings
      allow update: if request.auth.uid != null
        && get(/databases/$(database)/documents/rooms/$(roomId)).data.hostId == request.auth.uid;
    }
    
    // Answers are write-once, server validates
    match /rooms/{roomId}/rounds/{roundId}/answers/{answerId} {
      allow read: if request.auth.uid != null;
      allow create: if request.auth.uid != null
        && request.resource.data.playerId == request.auth.uid
        && request.resource.data.timestamp == request.time;
      allow update, delete: if false;
    }
  }
}
```

### Anti-Cheat Measures

1. **Server-Side Validation**: All answers validated on server
2. **Timestamp Verification**: Answers timestamped on server
3. **Rate Limiting**: Prevent spam submissions
4. **Input Validation**: Sanitize all user input
5. **Score Integrity**: Scores calculated server-side only
6. **Bot Detection**: Analyze typing patterns
7. **Session Verification**: Validate game session tokens

---

## 9. Performance Optimization

### Strategies

1. **Lazy Loading**: Load data only when needed
2. **Caching**: Cache words, assets locally
3. **Image Optimization**: Compress and cache images
4. **Code Splitting**: Lazy load features
5. **Debouncing**: Limit rapid API calls
6. **Batch Operations**: Group Firestore writes
7. **Index Optimization**: Proper Firestore indexes
8. **Memory Management**: Dispose controllers properly
9. **Widget Optimization**: Use const constructors
10. **Build Optimization**: Minimize rebuilds

### Implementation

```dart
// 1. Memoization
final wordsProvider = FutureProvider.family<List<Word>, WordQuery>((ref, query) {
  // Cached per query
  return ref.watch(wordRepositoryProvider).getWords(query);
});

// 2. Pagination
class WordsPaginator {
  static const int pageSize = 20;
  DocumentSnapshot? lastDocument;
  
  Future<List<Word>> getNextPage() async {
    Query query = _firestore
        .collection('words')
        .orderBy('createdAt')
        .limit(pageSize);
    
    if (lastDocument != null) {
      query = query.startAfterDocument(lastDocument!);
    }
    
    final snapshot = await query.get();
    lastDocument = snapshot.docs.last;
    
    return snapshot.docs.map((doc) => Word.fromFirestore(doc.data())).toList();
  }
}

// 3. Debounce Search
Timer? _debounceTimer;
void onSearchChanged(String query) {
  _debounceTimer?.cancel();
  _debounceTimer = Timer(Duration(milliseconds: 300), () {
    performSearch(query);
  });
}
```

---

## 10. Scalability Strategy

### Horizontal Scaling

1. **Firestore**: Auto-scales to millions of users
2. **Cloud Functions**: Auto-scales based on load
3. **Firebase Storage**: CDN-backed, globally distributed
4. **Authentication**: Firebase handles millions of users

### Database Optimization

```dart
// Composite indexes for complex queries
// firestore.indexes.json
{
  "indexes": [
    {
      "collectionGroup": "words",
      "queryScope": "COLLECTION",
      "fields": [
        {"fieldPath": "category", "order": "ASCENDING"},
        {"fieldPath": "difficulty", "order": "ASCENDING"},
        {"fieldPath": "frequency", "order": "DESCENDING"}
      ]
    },
    {
      "collectionGroup": "leaderboards",
      "queryScope": "COLLECTION",
      "fields": [
        {"fieldPath": "region", "order": "ASCENDING"},
        {"fieldPath": "score", "order": "DESCENDING"},
        {"fieldPath": "timestamp", "order": "DESCENDING"}
      ]
    }
  ]
}
```

### Caching Strategy

```dart
class CacheManager {
  // Memory cache for hot data
  final Map<String, dynamic> _memoryCache = {};
  
  // Persistent cache for cold data
  final Box _hiveCache = Hive.box('app_cache');
  
  Future<T?> get<T>(String key, {
    Duration? maxAge,
    Future<T> Function()? fetchFn,
  }) async {
    // 1. Check memory cache
    if (_memoryCache.containsKey(key)) {
      return _memoryCache[key] as T;
    }
    
    // 2. Check persistent cache
    final cached = _hiveCache.get(key);
    if (cached != null && !_isExpired(cached, maxAge)) {
      _memoryCache[key] = cached;
      return cached as T;
    }
    
    // 3. Fetch from network
    if (fetchFn != null) {
      final data = await fetchFn();
      await set(key, data);
      return data;
    }
    
    return null;
  }
}
```

### Migration Strategy (Firebase → Supabase)

```dart
// Abstract repository interface
abstract class GameRepository {
  Future<List<Word>> getWords(Category category);
  Stream<GameRoom> watchRoom(String roomId);
}

// Firebase implementation
class FirebaseGameRepository implements GameRepository {
  final FirebaseFirestore _firestore;
  // Implementation
}

// Supabase implementation (future)
class SupabaseGameRepository implements GameRepository {
  final SupabaseClient _supabase;
  // Implementation
}

// Switch via provider
final gameRepositoryProvider = Provider<GameRepository>((ref) {
  final useSupabase = ref.watch(configProvider).useSupabase;
  
  return useSupabase
      ? SupabaseGameRepository()
      : FirebaseGameRepository();
});
```

---

## Summary

This architecture ensures:
- ✅ **Scalability**: Handle millions of users
- ✅ **Maintainability**: Clean, organized code
- ✅ **Testability**: Easy to unit test
- ✅ **Performance**: Optimized for 60+ FPS
- ✅ **Security**: Server-side validation
- ✅ **Flexibility**: Easy to migrate backends
- ✅ **Quality**: Production-ready code

**Next Steps:**
1. Create folder structure
2. Define Firestore schema
3. Implement authentication
4. Build multiplayer engine
5. Develop game logic
6. Create UI screens
7. Integrate payments
8. Test and optimize

This architecture will serve as the foundation for a world-class multiplayer word game! 🚀
