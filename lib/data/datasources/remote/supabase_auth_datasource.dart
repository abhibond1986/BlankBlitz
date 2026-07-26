import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../core/config/supabase_config.dart';
import '../../../core/error/exceptions.dart';
import '../../models/user_model.dart';

class SupabaseAuthDataSource {
  final SupabaseClient _client = SupabaseConfig.client;

  /// Sign in with email and password
  Future<UserModel> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw ServerException('Login failed');
      }

      // Fetch user profile from users table
      final profileData = await _client
          .from('users')
          .select()
          .eq('id', response.user!.id)
          .single();

      return UserModel.fromJson({
        ...profileData,
        'email': response.user!.email,
      });
    } on AuthException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException('Failed to sign in: $e');
    }
  }

  /// Sign up with email and password
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      // Check if username is taken
      final existingUsers = await _client
          .from('users')
          .select('username')
          .eq('username', username)
          .maybeSingle();

      if (existingUsers != null) {
        throw ServerException('Username already taken');
      }

      // Create auth user
      final response = await _client.auth.signUp(
        email: email,
        password: password,
        data: {'username': username},
      );

      if (response.user == null) {
        throw ServerException('Sign up failed');
      }

      // Create user profile
      final userData = {
        'id': response.user!.id,
        'username': username,
        'email': email,
        'avatar_url': null,
        'coins': 1000, // Starting coins
        'gems': 50, // Starting gems
        'level': 1,
        'total_xp': 0,
        'wins': 0,
        'losses': 0,
        'total_games': 0,
        'win_streak': 0,
        'best_streak': 0,
        'created_at': DateTime.now().toIso8601String(),
      };

      await _client.from('users').insert(userData);

      return UserModel.fromJson({
        ...userData,
        'email': email,
      });
    } on AuthException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException('Failed to sign up: $e');
    }
  }

  /// Sign out
  Future<void> signOut() async {
    try {
      await _client.auth.signOut();
    } catch (e) {
      throw ServerException('Failed to sign out: $e');
    }
  }

  /// Get current user
  Future<UserModel?> getCurrentUser() async {
    try {
      final user = _client.auth.currentUser;
      if (user == null) return null;

      final profileData = await _client
          .from('users')
          .select()
          .eq('id', user.id)
          .single();

      return UserModel.fromJson({
        ...profileData,
        'email': user.email,
      });
    } catch (e) {
      return null;
    }
  }

  /// Check if user is authenticated
  bool isAuthenticated() {
    return _client.auth.currentUser != null;
  }

  /// Listen to auth state changes
  Stream<AuthState> authStateChanges() {
    return _client.auth.onAuthStateChange;
  }

  /// Reset password
  Future<void> resetPassword(String email) async {
    try {
      await _client.auth.resetPasswordForEmail(email);
    } on AuthException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException('Failed to reset password: $e');
    }
  }

  /// Update user profile
  Future<UserModel> updateProfile({
    required String userId,
    String? username,
    String? avatarUrl,
  }) async {
    try {
      final updates = <String, dynamic>{};
      if (username != null) updates['username'] = username;
      if (avatarUrl != null) updates['avatar_url'] = avatarUrl;
      updates['updated_at'] = DateTime.now().toIso8601String();

      final response = await _client
          .from('users')
          .update(updates)
          .eq('id', userId)
          .select()
          .single();

      return UserModel.fromJson(response);
    } catch (e) {
      throw ServerException('Failed to update profile: $e');
    }
  }
}
