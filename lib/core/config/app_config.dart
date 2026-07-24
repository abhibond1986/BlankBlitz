/// BlankBlitz App Configuration
/// Production-ready configuration management
class AppConfig {
  // App Info
  static const String appName = 'BlankBlitz';
  static const String appTagline = 'Fill Fast. Think Faster. Win First.';
  static const String appVersion = '1.0.0';
  static const int appBuildNumber = 1;

  // Environment
  static const bool isProduction = true;
  static const bool enableAnalytics = true;
  static const bool enableCrashlytics = true;

  // Firebase
  static const String firebaseProjectId = 'blankblitz-prod';
  
  // Game Configuration
  static const int defaultRoundTime = 30; // seconds
  static const int minPlayers = 2;
  static const int maxPlayersQuickMatch = 10;
  static const int maxPlayersBattleRoyale = 100;
  static const int minWordLength = 3;
  static const int maxWordLength = 20;

  // Scoring
  static const int baseScore = 100;
  static const int maxTimeBonus = 100;
  static const int accuracyBonus = 50;
  static const int noHintBonus = 30;
  static const int perfectRoundBonus = 100;
  static const int wrongAnswerPenalty = 20;

  // Hints
  static const int hintsPerMatch = 3;
  static const int hintScorePenalty = 10;

  // Currency
  static const int dailyLoginReward = 100; // coins
  static const int matchWinReward = 50; // coins

  // Ads
  static const bool showAds = true;
  static const int adFrequency = 3; // Show ad every 3 matches

  // API Timeouts
  static const Duration apiTimeout = Duration(seconds: 30);
  static const Duration matchmakingTimeout = Duration(seconds: 60);

  // Cache
  static const Duration cacheExpiry = Duration(hours: 24);

  // Leaderboard
  static const int leaderboardLimit = 100;

  // URLs
  static const String privacyPolicyUrl = 'https://blankblitz.com/privacy';
  static const String termsOfServiceUrl = 'https://blankblitz.com/terms';
  static const String supportEmail = 'support@blankblitz.com';

  // Social
  static const String websiteUrl = 'https://blankblitz.com';
  static const String instagramUrl = 'https://instagram.com/blankblitz';
  static const String twitterUrl = 'https://twitter.com/blankblitz';

  // Feature Flags
  static const bool enableCashTournaments = false; // Region-specific
  static const bool enableReferralProgram = true;
  static const bool enableBattlePass = true;
  static const bool enableClassroomMode = true;

  // Development
  static const bool showDebugLogs = !isProduction;
  static const bool enablePerformanceMonitoring = true;
}
