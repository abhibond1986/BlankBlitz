import 'package:dartz/dartz.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/entities/user_entity.dart';
import '../../core/errors/failures.dart';
import '../datasources/remote/cloudflare_auth_datasource.dart';
import '../datasources/local/local_storage_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CloudflareAuthDataSource remoteDataSource;
  final LocalStorageDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, UserEntity>> login({
    required String emailOrUsername,
    required String password,
  }) async {
    try {
      final userModel = await remoteDataSource.login(
        emailOrUsername: emailOrUsername,
        password: password,
      );
      
      // Save token locally
      await localDataSource.saveToken(userModel.id);
      await localDataSource.saveUser(userModel);
      
      return Right(userModel.toEntity());
    } on ServerFailure catch (e) {
      return Left(e);
    } on NetworkFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> register({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final userModel = await remoteDataSource.register(
        username: username,
        email: email,
        password: password,
      );
      
      // Save token locally
      await localDataSource.saveToken(userModel.id);
      await localDataSource.saveUser(userModel);
      
      return Right(userModel.toEntity());
    } on ServerFailure catch (e) {
      return Left(e);
    } on NetworkFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> sendOtp(String phoneNumber) async {
    try {
      final sessionId = await remoteDataSource.sendOtp(phoneNumber);
      return Right(sessionId);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> verifyOtp({
    required String phoneNumber,
    required String otp,
  }) async {
    try {
      final userModel = await remoteDataSource.verifyOtp(
        phoneNumber: phoneNumber,
        otp: otp,
      );
      
      await localDataSource.saveToken(userModel.id);
      await localDataSource.saveUser(userModel);
      
      return Right(userModel.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    try {
      final userModel = await localDataSource.getUser();
      if (userModel != null) {
        return Right(userModel.toEntity());
      }
      return const Left(AuthFailure('No user found'));
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await localDataSource.clearToken();
      await localDataSource.clearUser();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<bool> isAuthenticated() async {
    final token = await localDataSource.getToken();
    return token != null;
  }

  @override
  Future<String?> getToken() async {
    return await localDataSource.getToken();
  }
}
