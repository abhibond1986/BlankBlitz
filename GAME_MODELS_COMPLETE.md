# 🎮 BlankBlitz - Core Game Models Complete

## ✅ What's Been Built

Production-ready game data models with complete business logic!

---

## 📦 Entities Created (Domain Layer)

### 1. **GameRoomEntity** (`lib/domain/entities/game_room_entity.dart`)

**Complete multiplayer room management:**

**Enums:**
- `GameMode` - 7 modes (Solo, Quick Match, Private, Public, Battle Royale, Classroom, Tournament)
- `GameStatus` - 6 states (Waiting, Starting, InProgress, Paused, Finished, Cancelled)
- `RoomVisibility` - 3 types (Public, Private, FriendsOnly)

**PlayerState Class:**
- User identification (userId, username, avatar)
- Real-time stats (score, correct/wrong answers)
- Connection status (isReady, isHost, isConnected)
- Ranking data (currentRank, joinedAt)

**GameRoomEntity Class (35+ properties):**
- Room identification (id, roomCode, hostId)
- Game configuration (mode, status, visibility)
- Player management (players list, maxPlayers)
- Round tracking (currentRound, totalRounds, timeLimit)
- Word management (currentWordId, round times)
- Game settings (categories, difficulty, hints, powerups)
- Monetization (entryFee, entryCurrency, prizes)
- Timestamps (createdAt, startedAt, finishedAt)

**Computed Properties:**
- `playerCount` - Current number of players
- `isFull` - Whether room is at capacity
- `canStart` - All players ready check
- `host` - Get host player
- `isInProgress/isWaiting/isFinished` - Status helpers
- `roundTimeRemaining` - Real-time countdown

---

### 2. **WordEntity** (`lib/domain/entities/word_entity.dart`)

**Complete word puzzle system:**

**Enums:**
- `WordDifficulty` - 4 levels (Easy, Medium, Hard, Expert)
- `WordCategory` - 11 categories (Animals, Food, Sports, Tech, Nature, Movies, Music, Science, Geography, History, General)

**HintData Class:**
- Type (letter, definition, synonym, category)
- Content (the actual hint)
- Cost (coins/gems)

**WordEntity Class (17+ properties):**
- Word data (id, word, displayPattern)
- Blanking logic (blankedIndices)
- Difficulty & categorization
- Educational content (definition, synonyms, relatedWords)
- Hint system (list of HintData)
- Scoring (baseScore, timeBonus)
- Localization (language)
- Timestamps

**Computed Properties:**
- `wordLength` - Character count
- `blankedCount` - Number of hidden letters
- `blankPercentage` - % of word hidden
- `maxScore` - Base + time bonus
- `hasDefinition/hasSynonyms/hasHints` - Content checks

**Business Logic Methods:**
- `calculateScore(timeTaken, roundTimeLimit)` - Dynamic scoring based on speed
- `isCorrectAnswer(answer)` - Case-insensitive validation

---

### 3. **AnswerEntity** (`lib/domain/entities/answer_entity.dart`)

**Player answer tracking and scoring:**

**Enums:**
- `AnswerStatus` - 5 states (Pending, Correct, Incorrect, Timeout, Skipped)

**AnswerEntity Class:**
- Answer identification (id, gameRoomId, wordId, userId)
- Answer data (answer, status, roundNumber)
- Scoring (scoreEarned, timeTaken)
- Assistance tracking (hintsUsed, powerUpsUsed)
- Ranking (isFirstCorrect, rank)
- Timestamp (submittedAt)

**Computed Properties:**
- `isCorrect/isIncorrect/isTimeout/isSkipped` - Status checks
- `usedHints/usedPowerUps` - Assistance checks
- `timeInSeconds` - Milliseconds to seconds

**RoundResult Class:**
- Round aggregation (roundNumber, wordId, correctWord)
- All answers collection
- Time tracking (startTime, endTime)

**Computed Properties:**
- `roundDuration` - How long the round took
- `totalAnswers` - Player count
- `correctAnswers/incorrectAnswers` - Stats
- `accuracyRate` - Success percentage
- `fastestCorrect` - Speed champion finder

---

## 🎨 Data Models Created (Data Layer)

### 1. **GameRoomModel** (`lib/data/models/game_room_model.dart`)

**Freezed models with JSON serialization:**

**PlayerStateModel:**
- All PlayerState fields
- `fromJson/toJson` - Cloudflare D1 compatibility
- `fromEntity/toEntity` - Domain conversion

**GameRoomModel:**
- All GameRoomEntity fields
- String enums for JSON (gameMode.name, status.name)
- Player list serialization
- `fromJson/toJson` - API compatibility
- `fromEntity/toEntity` - Clean Architecture

---

### 2. **WordModel** (`lib/data/models/word_model.dart`)

**HintDataModel:**
- Type, content, cost
- JSON serialization
- Entity conversion

**WordModel:**
- All WordEntity fields
- Category list as strings
- Hint list serialization
- `fromJson/toJson` - Database compatibility
- `fromEntity/toEntity` - Layer separation

---

### 3. **AnswerModel** (`lib/data/models/answer_model.dart`)

**AnswerModel:**
- All AnswerEntity fields
- Duration as milliseconds (timeTakenMs)
- Status as string
- JSON serialization
- Entity conversion

**RoundResultModel:**
- Aggregated round data
- Answer list serialization
- JSON support

---

## 🏗️ Architecture Benefits

### **Clean Separation:**
```
Domain Layer (Entities)
  ↓ Business logic, pure Dart
  ↓ No JSON, no external dependencies
  ↓
Data Layer (Models)
  ↓ Freezed, JSON serialization
  ↓ API/Database compatible
  ↓ fromEntity/toEntity converters
```

### **Type Safety:**
- ✅ Enums for all categorical data
- ✅ Required vs optional clearly defined
- ✅ Immutable with Freezed
- ✅ Null safety everywhere

### **Business Logic:**
- ✅ Score calculation algorithms
- ✅ Answer validation
- ✅ Time management
- ✅ Round aggregation
- ✅ Player ranking

---

## 🎯 Real-World Usage Examples

### **Example 1: Create a Game Room**
```dart
final room = GameRoomEntity(
  id: 'room_123',
  roomCode: 'ABCD1234',
  hostId: 'user_456',
  gameMode: GameMode.quickMatch,
  status: GameStatus.waiting,
  visibility: RoomVisibility.public,
  players: [
    PlayerState(
      userId: 'user_456',
      username: 'Player1',
      isHost: true,
      joinedAt: DateTime.now(),
    ),
  ],
  totalRounds: 10,
  roundTimeLimit: 30,
  categories: ['animals', 'food'],
  difficulty: 'MEDIUM',
  createdAt: DateTime.now(),
);

// Check if can start
if (room.canStart) {
  print('Game can start!');
}

// Get time remaining
final timeLeft = room.roundTimeRemaining;
```

### **Example 2: Word Generation**
```dart
final word = WordEntity(
  id: 'word_789',
  word: 'ELEPHANT',
  displayPattern: 'E _ _ P _ A _ T',
  blankedIndices: [1, 2, 4, 6],
  difficulty: WordDifficulty.medium,
  categories: [WordCategory.animals],
  definition: 'A large mammal with a trunk',
  synonyms: ['pachyderm'],
  hints: [
    HintData(
      type: 'letter',
      content: 'The second letter is L',
      cost: 10,
    ),
    HintData(
      type: 'definition',
      content: 'Lives in Africa and Asia',
      cost: 20,
    ),
  ],
  baseScore: 100,
  timeBonus: 50,
  createdAt: DateTime.now(),
);

// Calculate score (answered in 15 seconds out of 30)
final score = word.calculateScore(
  Duration(seconds: 15),
  30,
);
print('Score: $score'); // 100 + (50 * 0.5) = 125

// Validate answer
final isCorrect = word.isCorrectAnswer('elephant'); // true
```

### **Example 3: Answer Submission**
```dart
final answer = AnswerEntity(
  id: 'ans_321',
  gameRoomId: 'room_123',
  wordId: 'word_789',
  userId: 'user_456',
  answer: 'ELEPHANT',
  status: AnswerStatus.correct,
  roundNumber: 1,
  scoreEarned: 125,
  timeTaken: Duration(seconds: 15),
  hintsUsed: 1,
  powerUpsUsed: [],
  isFirstCorrect: true,
  rank: 1,
  submittedAt: DateTime.now(),
);

if (answer.isCorrect && answer.isFirstCorrect) {
  print('First place! +${answer.scoreEarned} points');
}
```

### **Example 4: Round Results**
```dart
final round = RoundResult(
  roundNumber: 1,
  wordId: 'word_789',
  correctWord: 'ELEPHANT',
  answers: [answer1, answer2, answer3],
  startTime: DateTime.now().subtract(Duration(seconds: 30)),
  endTime: DateTime.now(),
);

print('Round accuracy: ${round.accuracyRate}%');
print('Fastest: ${round.fastestCorrect?.username}');
```

---

## 📊 Data Flow

```
Frontend (Presentation)
    ↓
  Entities (Domain)
    ↓
  Repositories
    ↓
  Models (Data)
    ↓
JSON ↔ Cloudflare D1/Workers
```

**Conversion Chain:**
1. UI shows entities
2. Repository converts entity → model
3. Model serializes to JSON
4. API sends to Cloudflare
5. Response deserializes JSON → model
6. Model converts to entity
7. Entity updates UI via Riverpod

---

## 🚀 Next Steps

### **Immediate:**
1. ✅ Run code generation: `flutter pub run build_runner build --delete-conflicting-outputs`
2. ⬜ Create game repository interfaces (domain)
3. ⬜ Implement game repositories (data)
4. ⬜ Build word engine service
5. ⬜ Create game lobby screen
6. ⬜ Build gameplay screen

### **Backend:**
1. ⬜ Cloudflare D1 tables for words, rooms, answers
2. ⬜ Durable Objects for real-time rooms
3. ⬜ Worker endpoints for game API
4. ⬜ Word database (100,000+ words)

---

## 📈 Progress Summary

**Files Created:** 6 core files
- 3 Entity files (domain)
- 3 Model files (data)

**Lines of Code:** ~1,200 lines

**Features:**
- ✅ Complete game room management
- ✅ Word puzzle system with hints
- ✅ Answer tracking and scoring
- ✅ Round aggregation
- ✅ Player state management
- ✅ Real-time calculations
- ✅ Business logic methods
- ✅ JSON serialization ready
- ✅ Clean Architecture compliant

---

**Core game data models are production-ready!** 🎮

*Next: Building repository layer and game engine*
