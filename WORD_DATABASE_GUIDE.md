# 📚 Word Database Management Guide

## How to Add Words to Your Database

### Method 1: Direct SQL Insert (Recommended for Bulk)

Open Supabase SQL Editor and run:

```sql
-- Add words to the database
INSERT INTO words (word, display_pattern, blanked_indices, difficulty, categories, definition, synonyms, base_score, time_bonus) VALUES

-- EASY WORDS (100+ examples)
('APPLE', 'A _ _ L E', ARRAY[1,2,3], 'EASY', ARRAY['food', 'nature'], 'A round fruit', ARRAY['fruit'], 100, 50),
('TIGER', 'T _ _ E R', ARRAY[1,2,4], 'EASY', ARRAY['animals'], 'Large striped cat', ARRAY['beast', 'feline'], 100, 50),
('WATER', 'W _ T _ R', ARRAY[1,3], 'EASY', ARRAY['nature'], 'Clear liquid H2O', ARRAY['liquid'], 100, 50),
('HOUSE', 'H _ U _ E', ARRAY[1,3], 'EASY', ARRAY['general'], 'Place to live', ARRAY['home', 'dwelling'], 100, 50),
('BREAD', 'B _ E A _', ARRAY[1,4], 'EASY', ARRAY['food'], 'Baked food', ARRAY['loaf'], 100, 50),
('CHAIR', 'C H _ I _', ARRAY[2,4], 'EASY', ARRAY['general'], 'Furniture to sit', ARRAY['seat'], 100, 50),
('CLOUD', 'C _ O U _', ARRAY[1,4], 'EASY', ARRAY['nature'], 'White in sky', ARRAY['vapor'], 100, 50),
('TRAIN', 'T _ A I _', ARRAY[1,4], 'EASY', ARRAY['general'], 'Rail transport', ARRAY['locomotive'], 100, 50),
('PIANO', 'P _ A N _', ARRAY[1,4], 'EASY', ARRAY['music'], 'Musical keyboard', ARRAY['keys'], 100, 50),
('BEACH', 'B _ A C _', ARRAY[1,4], 'EASY', ARRAY['nature'], 'Sandy shore', ARRAY['coast', 'shore'], 100, 50),

-- MEDIUM WORDS
('GUITAR', 'G _ I T _ R', ARRAY[1,4], 'MEDIUM', ARRAY['music'], 'String instrument', ARRAY['strings'], 150, 75),
('PYRAMID', 'P _ R A _ I D', ARRAY[1,4], 'MEDIUM', ARRAY['history'], 'Egyptian structure', ARRAY['monument'], 150, 75),
('DOLPHIN', 'D _ L P _ I N', ARRAY[1,4], 'MEDIUM', ARRAY['animals'], 'Smart sea mammal', ARRAY['cetacean'], 150, 75),
('MOUNTAIN', 'M _ U N _ A I N', ARRAY[1,4], 'MEDIUM', ARRAY['nature', 'geography'], 'High land', ARRAY['peak'], 150, 75),
('COMPUTER', 'C _ M P _ T E R', ARRAY[1,4], 'MEDIUM', ARRAY['technology'], 'Electronic device', ARRAY['PC'], 150, 75),
('TELEPHONE', 'T _ L E _ H O N E', ARRAY[1,4], 'MEDIUM', ARRAY['technology'], 'Communication device', ARRAY['phone'], 150, 75),
('BUTTERFLY', 'B _ T T E _ F L Y', ARRAY[1,5], 'MEDIUM', ARRAY['animals', 'nature'], 'Flying insect', ARRAY['insect'], 150, 75),
('CHOCOLATE', 'C _ O C _ L A T E', ARRAY[1,4], 'MEDIUM', ARRAY['food'], 'Sweet treat', ARRAY['candy'], 150, 75),
('BASKETBALL', 'B _ S K _ T B A L L', ARRAY[1,4], 'MEDIUM', ARRAY['sports'], 'Court sport', ARRAY['hoops'], 150, 75),
('ELEPHANT', 'E _ E P _ A N T', ARRAY[1,4], 'MEDIUM', ARRAY['animals'], 'Large mammal with trunk', ARRAY['pachyderm'], 150, 75),

-- HARD WORDS
('ALGORITHM', 'A _ G O R _ T H M', ARRAY[1,5], 'HARD', ARRAY['technology', 'science'], 'Step-by-step procedure', ARRAY['procedure'], 200, 100),
('PHILOSOPHY', 'P _ I L O _ O P H Y', ARRAY[1,5], 'HARD', ARRAY['general'], 'Study of wisdom', ARRAY['wisdom'], 200, 100),
('ARCHITECTURE', 'A _ C H I _ E C T U R E', ARRAY[1,5], 'HARD', ARRAY['general'], 'Building design', ARRAY['design'], 200, 100),
('DEMOCRACY', 'D _ M O C _ A C Y', ARRAY[1,5], 'HARD', ARRAY['general'], 'Government by people', ARRAY['republic'], 200, 100),
('ENCYCLOPEDIA', 'E _ C Y C _ O P E D I A', ARRAY[1,5], 'HARD', ARRAY['general'], 'Reference book', ARRAY['reference'], 200, 100),
('MICROSCOPE', 'M _ C R O _ C O P E', ARRAY[1,5], 'HARD', ARRAY['science'], 'Small viewing tool', ARRAY['lens'], 200, 100),
('TEMPERATURE', 'T _ M P E _ A T U R E', ARRAY[1,5], 'HARD', ARRAY['science'], 'Heat measure', ARRAY['heat'], 200, 100),
('PHOTOGRAPHY', 'P _ O T O _ R A P H Y', ARRAY[1,5], 'HARD', ARRAY['general'], 'Image capturing art', ARRAY['pictures'], 200, 100),
('CONSTELLATION', 'C _ N S T _ L L A T I O N', ARRAY[1,5], 'HARD', ARRAY['science', 'nature'], 'Star pattern', ARRAY['stars'], 200, 100),
('CIVILIZATION', 'C _ V I L _ Z A T I O N', ARRAY[1,5], 'HARD', ARRAY['history'], 'Advanced society', ARRAY['society'], 200, 100);

-- Add more by category...
```

---

## Method 2: CSV Import (Best for 1000s of words)

### Step 1: Create CSV File

Create `words_import.csv`:

```csv
word,display_pattern,blanked_indices,difficulty,categories,definition,synonyms,base_score,time_bonus
OCEAN,O C _ A N,{2},EASY,{nature},Large body of water,{sea},100,50
FOREST,F _ R E _ T,{1,4},EASY,{nature},Trees and plants,{woods},100,50
SCHOOL,S _ H O _ L,{1,4},EASY,{general},Place of learning,{academy},100,50
```

### Step 2: Import via Supabase

1. Go to Supabase Dashboard → Table Editor
2. Select `words` table
3. Click "Insert" → "Import data from CSV"
4. Upload your CSV file
5. Map columns
6. Import!

---

## Method 3: Programmatic Insert (For Dynamic Addition)

Create a Flutter admin screen or use Supabase Functions:

```dart
// Example Flutter code to add words
Future<void> addWord({
  required String word,
  required String difficulty,
  required List<String> categories,
}) async {
  final supabase = SupabaseConfig.client;
  
  // Generate display pattern (show first and last, hide middle)
  final displayPattern = generateDisplayPattern(word);
  final blankedIndices = calculateBlankedIndices(word);
  
  await supabase.from('words').insert({
    'word': word.toUpperCase(),
    'display_pattern': displayPattern,
    'blanked_indices': blankedIndices,
    'difficulty': difficulty,
    'categories': categories,
    'base_score': difficulty == 'EASY' ? 100 : (difficulty == 'MEDIUM' ? 150 : 200),
    'time_bonus': difficulty == 'EASY' ? 50 : (difficulty == 'MEDIUM' ? 75 : 100),
  });
}
```

---

## Pre-Made Word Lists

### 500 Common Words by Category

#### Animals (50 words):
```sql
INSERT INTO words (word, display_pattern, blanked_indices, difficulty, categories, base_score) VALUES
('CAT', 'C _ T', ARRAY[1], 'EASY', ARRAY['animals'], 100),
('DOG', 'D _ G', ARRAY[1], 'EASY', ARRAY['animals'], 100),
('BEAR', 'B _ A R', ARRAY[1], 'EASY', ARRAY['animals'], 100),
('LION', 'L _ O N', ARRAY[1], 'EASY', ARRAY['animals'], 100),
('WOLF', 'W _ L F', ARRAY[1], 'EASY', ARRAY['animals'], 100),
-- ... add 45 more
```

#### Food (50 words):
```sql
INSERT INTO words (word, display_pattern, blanked_indices, difficulty, categories, base_score) VALUES
('PIZZA', 'P _ Z Z A', ARRAY[1], 'EASY', ARRAY['food'], 100),
('PASTA', 'P _ S T A', ARRAY[1], 'EASY', ARRAY['food'], 100),
('BURGER', 'B _ R G E R', ARRAY[1], 'EASY', ARRAY['food'], 100),
-- ... add 47 more
```

#### Sports (50 words):
```sql
INSERT INTO words (word, display_pattern, blanked_indices, difficulty, categories, base_score) VALUES
('SOCCER', 'S _ C C E R', ARRAY[1], 'EASY', ARRAY['sports'], 100),
('TENNIS', 'T _ N N I S', ARRAY[1], 'EASY', ARRAY['sports'], 100),
-- ... add 48 more
```

#### Technology (50 words):
```sql
INSERT INTO words (word, display_pattern, blanked_indices, difficulty, categories, base_score) VALUES
('LAPTOP', 'L _ P T O P', ARRAY[1], 'MEDIUM', ARRAY['technology'], 150),
('MOUSE', 'M _ U S E', ARRAY[1], 'EASY', ARRAY['technology'], 100),
('KEYBOARD', 'K _ Y B O _ R D', ARRAY[1,5], 'MEDIUM', ARRAY['technology'], 150),
-- ... add 47 more
```

---

## Word Generation Scripts

### Python Script to Generate Words

```python
import json

categories = {
    'animals': ['cat', 'dog', 'bear', 'lion', 'tiger', ...],
    'food': ['apple', 'bread', 'pizza', 'pasta', ...],
    'sports': ['soccer', 'tennis', 'golf', ...],
    # ... more categories
}

def generate_display_pattern(word):
    if len(word) <= 3:
        return word
    # Show first and last, hide middle
    middle = '_' * (len(word) - 2)
    return f"{word[0]} {middle} {word[-1]}"

def generate_blanked_indices(word):
    if len(word) <= 3:
        return []
    return list(range(1, len(word) - 1))

# Generate SQL
for category, words in categories.items():
    for word in words:
        pattern = generate_display_pattern(word)
        indices = generate_blanked_indices(word)
        print(f"('{word.upper()}', '{pattern}', ARRAY{indices}, 'EASY', ARRAY['{category}'], 100, 50),")
```

---

## Quick 1000-Word Starter Pack

Download ready-made word packs:

### Use ChatGPT/AI to Generate:

**Prompt**:
```
Generate 100 common [CATEGORY] words in this SQL format:
('WORD', 'W _ R D', ARRAY[1,3], 'EASY', ARRAY['category'], 'definition', ARRAY['synonym'], 100, 50),

Categories: animals, food, sports, technology, nature, movies, music, science, geography, history
```

---

## Word Database Best Practices

### 1. Difficulty Distribution
- **EASY**: 40% of words (3-5 letters, common words)
- **MEDIUM**: 40% of words (6-10 letters, moderate)
- **HARD**: 20% of words (10+ letters, complex)

### 2. Category Distribution
Aim for balanced categories:
- Animals: 10%
- Food: 10%
- Sports: 10%
- Technology: 10%
- Nature: 10%
- Movies: 5%
- Music: 5%
- Science: 10%
- Geography: 10%
- History: 10%
- General: 10%

### 3. Pattern Variety
- Show different letters (not always first/last)
- Vary difficulty even within same length
- Mix vowels and consonants in blanks

### 4. Add Hints
```sql
UPDATE words SET hints = jsonb_build_array(
  jsonb_build_object('type', 'definition', 'content', 'A large mammal'),
  jsonb_build_object('type', 'synonym', 'content', 'Pachyderm'),
  jsonb_build_object('type', 'letter', 'content', 'Third letter is E')
) WHERE word = 'ELEPHANT';
```

---

## Monitoring Word Usage

### Track Popular Words:
```sql
-- See most used words
SELECT word, usage_count, difficulty, categories
FROM words
ORDER BY usage_count DESC
LIMIT 50;
```

### Find Underused Words:
```sql
-- Words never used
SELECT word, difficulty, categories
FROM words
WHERE usage_count = 0
ORDER BY created_at DESC;
```

### Balance Check:
```sql
-- Check distribution by difficulty
SELECT difficulty, COUNT(*) as count
FROM words
GROUP BY difficulty;

-- Check distribution by category
SELECT unnest(categories) as category, COUNT(*) as count
FROM words
GROUP BY category
ORDER BY count DESC;
```

---

## Automated Word Addition

### Using Supabase Edge Functions:

```typescript
// Supabase Edge Function to add word
Deno.serve(async (req) => {
  const { word, difficulty, categories } = await req.json();
  
  // Auto-generate pattern and indices
  const displayPattern = generatePattern(word);
  const blankedIndices = calculateIndices(word);
  
  const { data, error } = await supabase
    .from('words')
    .insert({
      word: word.toUpperCase(),
      display_pattern: displayPattern,
      blanked_indices: blankedIndices,
      difficulty,
      categories,
      base_score: getBaseScore(difficulty),
      time_bonus: getTimeBonus(difficulty)
    });
    
  return new Response(JSON.stringify({ data, error }));
});
```

---

## Performance Tips

### 1. Index Your Data
```sql
-- Already in schema, but verify:
CREATE INDEX IF NOT EXISTS idx_words_difficulty ON words(difficulty);
CREATE INDEX IF NOT EXISTS idx_words_categories ON words USING GIN(categories);
```

### 2. Preload Words
In your app, preload 50-100 words per session:
```dart
// On app start
await wordRepository.preloadWords(
  count: 100,
  categories: ['general', 'animals', 'food'],
  difficulty: 'MEDIUM'
);
```

### 3. Cache Frequently Used Words
Use local storage to cache popular words.

---

## Goal: 5000+ Words

### Milestone Plan:
- **Phase 1**: 100 words (MVP) ✅
- **Phase 2**: 500 words (Launch ready)
- **Phase 3**: 1000 words (Solid variety)
- **Phase 4**: 2500 words (Comprehensive)
- **Phase 5**: 5000+ words (Professional)

### Resources:
- Word frequency lists (Google "10000 most common English words")
- Dictionary APIs
- Educational word lists
- Scrabble word lists
- Crossword puzzle databases

---

## Quick Start Command

Run this to add 50 starter words right now:

```sql
-- Copy from supabase_schema.sql (already has 5 sample words)
-- Then add more from the examples above
```

---

**Your app will be MUCH better with 500+ words!**

Aim for 1000 words for a professional experience! 🚀
