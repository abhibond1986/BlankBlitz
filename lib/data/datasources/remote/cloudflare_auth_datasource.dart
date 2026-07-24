import 'package:dio/dio.dart';
import '../../models/user_model.dart';
import '../../../core/errors/failures.dart';
import '../../../core/network/api_client.dart';

class CloudflareAuthDataSource {
  final ApiClient apiClient;

  CloudflareAuthDataSource({required this.apiClient});

  Future<UserModel> login({
    required String emailOrUsername,
    required String password,
  }) async {
    try {
      final response = await apiClient.post('/auth/login', {
        'emailOrUsername': emailOrUsername,
        'password': password,
      });

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data['user']);
      } else {
        throw ServerFailure(response.data['message'] ?? 'Login failed');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw const NetworkFailure('Connection timeout');
      }
      throw ServerFailure(e.message ?? 'Server error');
    }
  }

  Future<UserModel> register({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiClient.post('/auth/register', {
        'username': username,
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        return UserModel.fromJson(response.data['user']);
      } else {
        throw ServerFailure(response.data['message'] ?? 'Registration failed');
      }
    } on DioException catch (e) {
      throw ServerFailure(e.message ?? 'Server error');
    }
  }

  Future<String> sendOtp(String phoneNumber) async {
    try {
      final response = await apiClient.post('/auth/send-otp', {
        'phoneNumber': phoneNumber,
      });

      if (response.statusCode == 200) {
        return response.data['sessionId'];
      } else {
        throw ServerFailure('Failed to send OTP');
      }
    } on DioException catch (e) {
      throw ServerFailure(e.message ?? 'Server error');
    }
  }

  Future<UserModel> verifyOtp({
    required String phoneNumber,
    required String otp,
  }) async {
    try {
      final response = await apiClient.post('/auth/verify-otp', {
        'phoneNumber': phoneNumber,
        'otp': otp,
      });

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data['user']);
      } else {
        throw ServerFailure('Invalid OTP');
      }
    } on DioException catch (e) {
      throw ServerFailure(e.message ?? 'Server error');
    }
  }
}
