class AppConstants {
  // Route Names
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String homeRoute = '/home';
  static const String gameRoute = '/game';
  static const String lobbyRoute = '/lobby';
  static const String resultsRoute = '/results';
  static const String profileRoute = '/profile';
  static const String shopRoute = '/shop';
  static const String leaderboardRoute = '/leaderboard';
  static const String tournamentRoute = '/tournament';
  static const String settingsRoute = '/settings';

  // Hive Box Names
  static const String userBox = 'user_box';
  static const String gameBox = 'game_box';
  static const String settingsBox = 'settings_box';
  static const String cacheBox = 'cache_box';

  // SharedPreferences Keys
  static const String isFirstLaunch = 'is_first_launch';
  static const String userId = 'user_id';
  static const String authToken = 'auth_token';
  static const String soundEnabled = 'sound_enabled';
  static const String musicEnabled = 'music_enabled';
  static const String vibrateEnabled = 'vibrate_enabled';

  // Firestore Collections
  static const String usersCollection = 'users';
  static const String roomsCollection = 'rooms';
  static const String wordsCollection = 'words';
  static const String tournamentsCollection = 'tournaments';
  static const String leaderboardsCollection = 'leaderboards';
  static const String transactionsCollection = 'transactions';

  // Game Modes
  static const String soloPractice = 'solo_practice';
  static const String quickMatch = 'quick_match';
  static const String privateRoom = 'private_room';
  static const String publicRoom = 'public_room';
  static const String battleRoyale = 'battle_royale';
  static const String classroomMode = 'classroom_mode';
  static const String tournamentMode = 'tournament_mode';

  // Word Categories
  static const List<String> categories = [
    'Animals',
    'Birds',
    'Countries',
    'Capitals',
    'Sports',
    'Movies',
    'Science',
    'Technology',
    'Medical',
    'Engineering',
    'Programming',
    'Physics',
    'Chemistry',
    'Biology',
    'History',
    'Geography',
    'Space',
    'Brands',
    'Cars',
    'Food',
    'Random',
  ];

  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 400);
  static const Duration longAnimation = Duration(milliseconds: 600);

  // Asset Paths
  static const String imagesPath = 'assets/images/';
  static const String soundsPath = 'assets/sounds/';
  static const String animationsPath = 'assets/animations/';
  static const String dataPath = 'assets/data/';
}
