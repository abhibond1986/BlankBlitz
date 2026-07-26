import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  // Supabase project credentials
  static const String supabaseUrl = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: 'https://qockwvfaqttyucuymmzf.supabase.co',
  );

  static const String supabaseAnonKey = String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFvY2t3dmZhcXR0eXVjdXltbXpmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODUwNzIyNDMsImV4cCI6MjEwMDY0ODI0M30.JWbSSwhBg3J3Qm6Wob01fsgVALv2474NfSh5gUYCBNg',
  );

  static Future<void> initialize() async {
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseAnonKey,
      authOptions: const FlutterAuthClientOptions(
        authFlowType: AuthFlowType.pkce,
      ),
      realtimeClientOptions: const RealtimeClientOptions(
        logLevel: RealtimeLogLevel.info,
      ),
      storageOptions: const StorageClientOptions(
        retryAttempts: 3,
      ),
    );
  }

  static SupabaseClient get client => Supabase.instance.client;
}
