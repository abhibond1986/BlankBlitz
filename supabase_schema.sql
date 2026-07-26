-- BlankBlitz Database Schema for Supabase
-- Run this in your Supabase SQL Editor: https://app.supabase.com/project/qockwvfaqttyucuymmzf/sql

-- =====================================================
-- 1. USERS TABLE
-- =====================================================
CREATE TABLE IF NOT EXISTS public.users (
    id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
    username TEXT UNIQUE NOT NULL,
    email TEXT UNIQUE NOT NULL,
    avatar_url TEXT,
    coins INTEGER DEFAULT 1000 NOT NULL,
    gems INTEGER DEFAULT 50 NOT NULL,
    level INTEGER DEFAULT 1 NOT NULL,
    total_xp INTEGER DEFAULT 0 NOT NULL,
    wins INTEGER DEFAULT 0 NOT NULL,
    losses INTEGER DEFAULT 0 NOT NULL,
    total_games INTEGER DEFAULT 0 NOT NULL,
    win_streak INTEGER DEFAULT 0 NOT NULL,
    best_streak INTEGER DEFAULT 0 NOT NULL,
    achievements JSONB DEFAULT '[]'::JSONB,
    settings JSONB DEFAULT '{}'::JSONB,
    created_at TIMESTAMPTZ DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMPTZ DEFAULT NOW() NOT NULL,
    last_seen_at TIMESTAMPTZ DEFAULT NOW() NOT NULL
);

-- Add indexes for faster queries
CREATE INDEX idx_users_username ON public.users(username);
CREATE INDEX idx_users_level ON public.users(level DESC);
CREATE INDEX idx_users_total_xp ON public.users(total_xp DESC);
CREATE INDEX idx_users_wins ON public.users(wins DESC);

-- Enable Row Level Security
ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;

-- RLS Policies for users table
CREATE POLICY "Users can view all profiles" ON public.users
    FOR SELECT USING (true);

CREATE POLICY "Users can update own profile" ON public.users
    FOR UPDATE USING (auth.uid() = id);

-- =====================================================
-- 2. WORDS TABLE
-- =====================================================
CREATE TABLE IF NOT EXISTS public.words (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    word TEXT NOT NULL,
    display_pattern TEXT NOT NULL,
    blanked_indices INTEGER[] NOT NULL,
    difficulty TEXT NOT NULL CHECK (difficulty IN ('EASY', 'MEDIUM', 'HARD', 'EXPERT')),
    categories TEXT[] DEFAULT ARRAY[]::TEXT[],
    definition TEXT,
    synonyms TEXT[] DEFAULT ARRAY[]::TEXT[],
    related_words TEXT[] DEFAULT ARRAY[]::TEXT[],
    hints JSONB DEFAULT '[]'::JSONB,
    base_score INTEGER DEFAULT 100 NOT NULL,
    time_bonus INTEGER DEFAULT 50 NOT NULL,
    language TEXT DEFAULT 'en' NOT NULL,
    metadata JSONB DEFAULT '{}'::JSONB,
    usage_count INTEGER DEFAULT 0 NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMPTZ DEFAULT NOW() NOT NULL
);

-- Add indexes
CREATE INDEX idx_words_difficulty ON public.words(difficulty);
CREATE INDEX idx_words_categories ON public.words USING GIN(categories);
CREATE INDEX idx_words_language ON public.words(language);

-- Enable RLS
ALTER TABLE public.words ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Words are viewable by everyone" ON public.words
    FOR SELECT USING (true);

-- =====================================================
-- 3. GAME ROOMS TABLE
-- =====================================================
CREATE TABLE IF NOT EXISTS public.game_rooms (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    room_code TEXT UNIQUE NOT NULL,
    host_id UUID REFERENCES public.users(id) ON DELETE CASCADE NOT NULL,
    game_mode TEXT NOT NULL CHECK (game_mode IN ('soloPractice', 'quickMatch', 'privateRoom', 'publicRoom', 'battleRoyale', 'classroom', 'tournament')),
    status TEXT NOT NULL CHECK (status IN ('waiting', 'starting', 'inProgress', 'paused', 'finished', 'cancelled')),
    visibility TEXT NOT NULL CHECK (visibility IN ('public', 'private', 'friendsOnly')),
    players JSONB DEFAULT '[]'::JSONB NOT NULL,
    max_players INTEGER DEFAULT 10 NOT NULL,
    current_round INTEGER DEFAULT 0 NOT NULL,
    total_rounds INTEGER DEFAULT 10 NOT NULL,
    round_time_limit INTEGER DEFAULT 30 NOT NULL,
    current_word_id UUID REFERENCES public.words(id),
    round_start_time TIMESTAMPTZ,
    round_end_time TIMESTAMPTZ,
    categories TEXT[] DEFAULT ARRAY[]::TEXT[],
    difficulty TEXT DEFAULT 'MEDIUM' NOT NULL,
    allow_hints BOOLEAN DEFAULT true NOT NULL,
    hints_per_round INTEGER DEFAULT 3 NOT NULL,
    allow_power_ups BOOLEAN DEFAULT false NOT NULL,
    entry_fee INTEGER DEFAULT 0 NOT NULL,
    entry_currency TEXT DEFAULT 'coins' NOT NULL CHECK (entry_currency IN ('coins', 'gems')),
    prizes JSONB DEFAULT '{}'::JSONB,
    settings JSONB DEFAULT '{}'::JSONB,
    created_at TIMESTAMPTZ DEFAULT NOW() NOT NULL,
    started_at TIMESTAMPTZ,
    finished_at TIMESTAMPTZ
);

-- Add indexes
CREATE INDEX idx_game_rooms_status ON public.game_rooms(status);
CREATE INDEX idx_game_rooms_game_mode ON public.game_rooms(game_mode);
CREATE INDEX idx_game_rooms_visibility ON public.game_rooms(visibility);
CREATE INDEX idx_game_rooms_room_code ON public.game_rooms(room_code);
CREATE INDEX idx_game_rooms_host_id ON public.game_rooms(host_id);

-- Enable RLS
ALTER TABLE public.game_rooms ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Game rooms are viewable by everyone" ON public.game_rooms
    FOR SELECT USING (true);

CREATE POLICY "Host can update their game rooms" ON public.game_rooms
    FOR UPDATE USING (auth.uid() = host_id);

CREATE POLICY "Authenticated users can create game rooms" ON public.game_rooms
    FOR INSERT WITH CHECK (auth.uid() = host_id);

-- =====================================================
-- 4. GAME HISTORY TABLE
-- =====================================================
CREATE TABLE IF NOT EXISTS public.game_history (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    room_id UUID REFERENCES public.game_rooms(id) ON DELETE CASCADE NOT NULL,
    user_id UUID REFERENCES public.users(id) ON DELETE CASCADE NOT NULL,
    game_mode TEXT NOT NULL,
    final_score INTEGER DEFAULT 0 NOT NULL,
    correct_answers INTEGER DEFAULT 0 NOT NULL,
    wrong_answers INTEGER DEFAULT 0 NOT NULL,
    rank INTEGER,
    coins_earned INTEGER DEFAULT 0 NOT NULL,
    xp_earned INTEGER DEFAULT 0 NOT NULL,
    achievements_unlocked TEXT[] DEFAULT ARRAY[]::TEXT[],
    duration_seconds INTEGER,
    played_at TIMESTAMPTZ DEFAULT NOW() NOT NULL
);

-- Add indexes
CREATE INDEX idx_game_history_user_id ON public.game_history(user_id);
CREATE INDEX idx_game_history_room_id ON public.game_history(room_id);
CREATE INDEX idx_game_history_played_at ON public.game_history(played_at DESC);

-- Enable RLS
ALTER TABLE public.game_history ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view their own game history" ON public.game_history
    FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can insert their own game history" ON public.game_history
    FOR INSERT WITH CHECK (auth.uid() = user_id);

-- =====================================================
-- 5. LEADERBOARDS TABLE
-- =====================================================
CREATE TABLE IF NOT EXISTS public.leaderboards (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES public.users(id) ON DELETE CASCADE NOT NULL,
    leaderboard_type TEXT NOT NULL CHECK (leaderboard_type IN ('daily', 'weekly', 'monthly', 'allTime')),
    score INTEGER DEFAULT 0 NOT NULL,
    rank INTEGER,
    period_start DATE NOT NULL,
    period_end DATE NOT NULL,
    updated_at TIMESTAMPTZ DEFAULT NOW() NOT NULL,
    UNIQUE(user_id, leaderboard_type, period_start)
);

-- Add indexes
CREATE INDEX idx_leaderboards_type ON public.leaderboards(leaderboard_type);
CREATE INDEX idx_leaderboards_score ON public.leaderboards(score DESC);
CREATE INDEX idx_leaderboards_period ON public.leaderboards(period_start, period_end);

-- Enable RLS
ALTER TABLE public.leaderboards ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Leaderboards are viewable by everyone" ON public.leaderboards
    FOR SELECT USING (true);

-- =====================================================
-- 6. FRIENDSHIPS TABLE
-- =====================================================
CREATE TABLE IF NOT EXISTS public.friendships (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES public.users(id) ON DELETE CASCADE NOT NULL,
    friend_id UUID REFERENCES public.users(id) ON DELETE CASCADE NOT NULL,
    status TEXT NOT NULL CHECK (status IN ('pending', 'accepted', 'blocked')),
    created_at TIMESTAMPTZ DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMPTZ DEFAULT NOW() NOT NULL,
    UNIQUE(user_id, friend_id),
    CHECK (user_id != friend_id)
);

-- Add indexes
CREATE INDEX idx_friendships_user_id ON public.friendships(user_id);
CREATE INDEX idx_friendships_friend_id ON public.friendships(friend_id);
CREATE INDEX idx_friendships_status ON public.friendships(status);

-- Enable RLS
ALTER TABLE public.friendships ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view their friendships" ON public.friendships
    FOR SELECT USING (auth.uid() = user_id OR auth.uid() = friend_id);

CREATE POLICY "Users can create friendships" ON public.friendships
    FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their friendships" ON public.friendships
    FOR UPDATE USING (auth.uid() = user_id OR auth.uid() = friend_id);

-- =====================================================
-- 7. TRIGGERS FOR UPDATED_AT
-- =====================================================
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_users_updated_at BEFORE UPDATE ON public.users
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_words_updated_at BEFORE UPDATE ON public.words
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_friendships_updated_at BEFORE UPDATE ON public.friendships
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- =====================================================
-- 8. REALTIME PUBLICATION
-- =====================================================
-- Enable realtime for game rooms (for live multiplayer)
ALTER PUBLICATION supabase_realtime ADD TABLE public.game_rooms;

-- =====================================================
-- 9. SAMPLE DATA (OPTIONAL - FOR TESTING)
-- =====================================================
-- Insert some sample words for testing
INSERT INTO public.words (word, display_pattern, blanked_indices, difficulty, categories, definition) VALUES
('APPLE', 'A _ _ L E', ARRAY[1,2,3], 'EASY', ARRAY['food', 'nature'], 'A round fruit with red or green skin'),
('TIGER', 'T _ _ E _', ARRAY[1,2,4], 'EASY', ARRAY['animals', 'nature'], 'A large wild cat with stripes'),
('GUITAR', 'G _ _ T A _', ARRAY[1,2,5], 'MEDIUM', ARRAY['music'], 'A musical instrument with strings'),
('COMPUTER', 'C _ _ P U _ E _', ARRAY[1,2,5,7], 'MEDIUM', ARRAY['technology'], 'An electronic device for processing data'),
('ALGORITHM', 'A _ G O _ I _ H _', ARRAY[1,4,6,8], 'HARD', ARRAY['technology', 'science'], 'A step-by-step procedure for solving a problem')
ON CONFLICT DO NOTHING;

-- Create a function to generate room codes
CREATE OR REPLACE FUNCTION generate_room_code()
RETURNS TEXT AS $$
DECLARE
    chars TEXT := 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
    result TEXT := '';
    i INTEGER;
BEGIN
    FOR i IN 1..6 LOOP
        result := result || substr(chars, floor(random() * length(chars) + 1)::INTEGER, 1);
    END LOOP;
    RETURN result;
END;
$$ LANGUAGE plpgsql;

-- =====================================================
-- SETUP COMPLETE!
-- =====================================================
-- Next steps:
-- 1. Run this entire script in your Supabase SQL Editor
-- 2. Go to Authentication > Providers and enable Email provider
-- 3. Configure email templates if needed
-- 4. Test authentication in your Flutter app
