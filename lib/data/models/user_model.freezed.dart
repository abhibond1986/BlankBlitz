// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;
  String get rank => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  int get xp => throw _privateConstructorUsedError;
  int get coins => throw _privateConstructorUsedError;
  int get gems => throw _privateConstructorUsedError;
  int get wins => throw _privateConstructorUsedError;
  int get losses => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_matches')
  int get totalMatches => throw _privateConstructorUsedError;
  @JsonKey(name: 'typing_speed')
  double get typingSpeed => throw _privateConstructorUsedError;
  double get accuracy => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_admin')
  bool get isAdmin => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_banned')
  bool get isBanned => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_login')
  DateTime? get lastLogin => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String id,
      String username,
      String? email,
      String? phone,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      String rank,
      int level,
      int xp,
      int coins,
      int gems,
      int wins,
      int losses,
      @JsonKey(name: 'total_matches') int totalMatches,
      @JsonKey(name: 'typing_speed') double typingSpeed,
      double accuracy,
      @JsonKey(name: 'is_admin') bool isAdmin,
      @JsonKey(name: 'is_banned') bool isBanned,
      @JsonKey(name: 'last_login') DateTime? lastLogin,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = freezed,
    Object? phone = freezed,
    Object? avatarUrl = freezed,
    Object? rank = null,
    Object? level = null,
    Object? xp = null,
    Object? coins = null,
    Object? gems = null,
    Object? wins = null,
    Object? losses = null,
    Object? totalMatches = null,
    Object? typingSpeed = null,
    Object? accuracy = null,
    Object? isAdmin = null,
    Object? isBanned = null,
    Object? lastLogin = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      xp: null == xp
          ? _value.xp
          : xp // ignore: cast_nullable_to_non_nullable
              as int,
      coins: null == coins
          ? _value.coins
          : coins // ignore: cast_nullable_to_non_nullable
              as int,
      gems: null == gems
          ? _value.gems
          : gems // ignore: cast_nullable_to_non_nullable
              as int,
      wins: null == wins
          ? _value.wins
          : wins // ignore: cast_nullable_to_non_nullable
              as int,
      losses: null == losses
          ? _value.losses
          : losses // ignore: cast_nullable_to_non_nullable
              as int,
      totalMatches: null == totalMatches
          ? _value.totalMatches
          : totalMatches // ignore: cast_nullable_to_non_nullable
              as int,
      typingSpeed: null == typingSpeed
          ? _value.typingSpeed
          : typingSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      isBanned: null == isBanned
          ? _value.isBanned
          : isBanned // ignore: cast_nullable_to_non_nullable
              as bool,
      lastLogin: freezed == lastLogin
          ? _value.lastLogin
          : lastLogin // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String username,
      String? email,
      String? phone,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      String rank,
      int level,
      int xp,
      int coins,
      int gems,
      int wins,
      int losses,
      @JsonKey(name: 'total_matches') int totalMatches,
      @JsonKey(name: 'typing_speed') double typingSpeed,
      double accuracy,
      @JsonKey(name: 'is_admin') bool isAdmin,
      @JsonKey(name: 'is_banned') bool isBanned,
      @JsonKey(name: 'last_login') DateTime? lastLogin,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = freezed,
    Object? phone = freezed,
    Object? avatarUrl = freezed,
    Object? rank = null,
    Object? level = null,
    Object? xp = null,
    Object? coins = null,
    Object? gems = null,
    Object? wins = null,
    Object? losses = null,
    Object? totalMatches = null,
    Object? typingSpeed = null,
    Object? accuracy = null,
    Object? isAdmin = null,
    Object? isBanned = null,
    Object? lastLogin = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$UserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      xp: null == xp
          ? _value.xp
          : xp // ignore: cast_nullable_to_non_nullable
              as int,
      coins: null == coins
          ? _value.coins
          : coins // ignore: cast_nullable_to_non_nullable
              as int,
      gems: null == gems
          ? _value.gems
          : gems // ignore: cast_nullable_to_non_nullable
              as int,
      wins: null == wins
          ? _value.wins
          : wins // ignore: cast_nullable_to_non_nullable
              as int,
      losses: null == losses
          ? _value.losses
          : losses // ignore: cast_nullable_to_non_nullable
              as int,
      totalMatches: null == totalMatches
          ? _value.totalMatches
          : totalMatches // ignore: cast_nullable_to_non_nullable
              as int,
      typingSpeed: null == typingSpeed
          ? _value.typingSpeed
          : typingSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      isBanned: null == isBanned
          ? _value.isBanned
          : isBanned // ignore: cast_nullable_to_non_nullable
              as bool,
      lastLogin: freezed == lastLogin
          ? _value.lastLogin
          : lastLogin // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl extends _UserModel {
  const _$UserModelImpl(
      {required this.id,
      required this.username,
      this.email,
      this.phone,
      @JsonKey(name: 'avatar_url') this.avatarUrl,
      this.rank = 'BRONZE',
      this.level = 1,
      this.xp = 0,
      this.coins = 0,
      this.gems = 0,
      this.wins = 0,
      this.losses = 0,
      @JsonKey(name: 'total_matches') this.totalMatches = 0,
      @JsonKey(name: 'typing_speed') this.typingSpeed = 0.0,
      this.accuracy = 0.0,
      @JsonKey(name: 'is_admin') this.isAdmin = false,
      @JsonKey(name: 'is_banned') this.isBanned = false,
      @JsonKey(name: 'last_login') this.lastLogin,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt})
      : super._();

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String id;
  @override
  final String username;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  @JsonKey()
  final String rank;
  @override
  @JsonKey()
  final int level;
  @override
  @JsonKey()
  final int xp;
  @override
  @JsonKey()
  final int coins;
  @override
  @JsonKey()
  final int gems;
  @override
  @JsonKey()
  final int wins;
  @override
  @JsonKey()
  final int losses;
  @override
  @JsonKey(name: 'total_matches')
  final int totalMatches;
  @override
  @JsonKey(name: 'typing_speed')
  final double typingSpeed;
  @override
  @JsonKey()
  final double accuracy;
  @override
  @JsonKey(name: 'is_admin')
  final bool isAdmin;
  @override
  @JsonKey(name: 'is_banned')
  final bool isBanned;
  @override
  @JsonKey(name: 'last_login')
  final DateTime? lastLogin;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'UserModel(id: $id, username: $username, email: $email, phone: $phone, avatarUrl: $avatarUrl, rank: $rank, level: $level, xp: $xp, coins: $coins, gems: $gems, wins: $wins, losses: $losses, totalMatches: $totalMatches, typingSpeed: $typingSpeed, accuracy: $accuracy, isAdmin: $isAdmin, isBanned: $isBanned, lastLogin: $lastLogin, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.xp, xp) || other.xp == xp) &&
            (identical(other.coins, coins) || other.coins == coins) &&
            (identical(other.gems, gems) || other.gems == gems) &&
            (identical(other.wins, wins) || other.wins == wins) &&
            (identical(other.losses, losses) || other.losses == losses) &&
            (identical(other.totalMatches, totalMatches) ||
                other.totalMatches == totalMatches) &&
            (identical(other.typingSpeed, typingSpeed) ||
                other.typingSpeed == typingSpeed) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin) &&
            (identical(other.isBanned, isBanned) ||
                other.isBanned == isBanned) &&
            (identical(other.lastLogin, lastLogin) ||
                other.lastLogin == lastLogin) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        username,
        email,
        phone,
        avatarUrl,
        rank,
        level,
        xp,
        coins,
        gems,
        wins,
        losses,
        totalMatches,
        typingSpeed,
        accuracy,
        isAdmin,
        isBanned,
        lastLogin,
        createdAt,
        updatedAt
      ]);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel extends UserModel {
  const factory _UserModel(
          {required final String id,
          required final String username,
          final String? email,
          final String? phone,
          @JsonKey(name: 'avatar_url') final String? avatarUrl,
          final String rank,
          final int level,
          final int xp,
          final int coins,
          final int gems,
          final int wins,
          final int losses,
          @JsonKey(name: 'total_matches') final int totalMatches,
          @JsonKey(name: 'typing_speed') final double typingSpeed,
          final double accuracy,
          @JsonKey(name: 'is_admin') final bool isAdmin,
          @JsonKey(name: 'is_banned') final bool isBanned,
          @JsonKey(name: 'last_login') final DateTime? lastLogin,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt}) =
      _$UserModelImpl;
  const _UserModel._() : super._();

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get id;
  @override
  String get username;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @override
  String get rank;
  @override
  int get level;
  @override
  int get xp;
  @override
  int get coins;
  @override
  int get gems;
  @override
  int get wins;
  @override
  int get losses;
  @override
  @JsonKey(name: 'total_matches')
  int get totalMatches;
  @override
  @JsonKey(name: 'typing_speed')
  double get typingSpeed;
  @override
  double get accuracy;
  @override
  @JsonKey(name: 'is_admin')
  bool get isAdmin;
  @override
  @JsonKey(name: 'is_banned')
  bool get isBanned;
  @override
  @JsonKey(name: 'last_login')
  DateTime? get lastLogin;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
