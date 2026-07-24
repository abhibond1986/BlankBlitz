// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_room_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlayerStateModel _$PlayerStateModelFromJson(Map<String, dynamic> json) {
  return _PlayerStateModel.fromJson(json);
}

/// @nodoc
mixin _$PlayerStateModel {
  String get userId => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  int get correctAnswers => throw _privateConstructorUsedError;
  int get wrongAnswers => throw _privateConstructorUsedError;
  bool get isReady => throw _privateConstructorUsedError;
  bool get isHost => throw _privateConstructorUsedError;
  bool get isConnected => throw _privateConstructorUsedError;
  int? get currentRank => throw _privateConstructorUsedError;
  DateTime get joinedAt => throw _privateConstructorUsedError;

  /// Serializes this PlayerStateModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlayerStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlayerStateModelCopyWith<PlayerStateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerStateModelCopyWith<$Res> {
  factory $PlayerStateModelCopyWith(
          PlayerStateModel value, $Res Function(PlayerStateModel) then) =
      _$PlayerStateModelCopyWithImpl<$Res, PlayerStateModel>;
  @useResult
  $Res call(
      {String userId,
      String username,
      String? avatarUrl,
      int score,
      int correctAnswers,
      int wrongAnswers,
      bool isReady,
      bool isHost,
      bool isConnected,
      int? currentRank,
      DateTime joinedAt});
}

/// @nodoc
class _$PlayerStateModelCopyWithImpl<$Res, $Val extends PlayerStateModel>
    implements $PlayerStateModelCopyWith<$Res> {
  _$PlayerStateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlayerStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? username = null,
    Object? avatarUrl = freezed,
    Object? score = null,
    Object? correctAnswers = null,
    Object? wrongAnswers = null,
    Object? isReady = null,
    Object? isHost = null,
    Object? isConnected = null,
    Object? currentRank = freezed,
    Object? joinedAt = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      correctAnswers: null == correctAnswers
          ? _value.correctAnswers
          : correctAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      wrongAnswers: null == wrongAnswers
          ? _value.wrongAnswers
          : wrongAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      isReady: null == isReady
          ? _value.isReady
          : isReady // ignore: cast_nullable_to_non_nullable
              as bool,
      isHost: null == isHost
          ? _value.isHost
          : isHost // ignore: cast_nullable_to_non_nullable
              as bool,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      currentRank: freezed == currentRank
          ? _value.currentRank
          : currentRank // ignore: cast_nullable_to_non_nullable
              as int?,
      joinedAt: null == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlayerStateModelImplCopyWith<$Res>
    implements $PlayerStateModelCopyWith<$Res> {
  factory _$$PlayerStateModelImplCopyWith(_$PlayerStateModelImpl value,
          $Res Function(_$PlayerStateModelImpl) then) =
      __$$PlayerStateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String username,
      String? avatarUrl,
      int score,
      int correctAnswers,
      int wrongAnswers,
      bool isReady,
      bool isHost,
      bool isConnected,
      int? currentRank,
      DateTime joinedAt});
}

/// @nodoc
class __$$PlayerStateModelImplCopyWithImpl<$Res>
    extends _$PlayerStateModelCopyWithImpl<$Res, _$PlayerStateModelImpl>
    implements _$$PlayerStateModelImplCopyWith<$Res> {
  __$$PlayerStateModelImplCopyWithImpl(_$PlayerStateModelImpl _value,
      $Res Function(_$PlayerStateModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? username = null,
    Object? avatarUrl = freezed,
    Object? score = null,
    Object? correctAnswers = null,
    Object? wrongAnswers = null,
    Object? isReady = null,
    Object? isHost = null,
    Object? isConnected = null,
    Object? currentRank = freezed,
    Object? joinedAt = null,
  }) {
    return _then(_$PlayerStateModelImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      correctAnswers: null == correctAnswers
          ? _value.correctAnswers
          : correctAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      wrongAnswers: null == wrongAnswers
          ? _value.wrongAnswers
          : wrongAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      isReady: null == isReady
          ? _value.isReady
          : isReady // ignore: cast_nullable_to_non_nullable
              as bool,
      isHost: null == isHost
          ? _value.isHost
          : isHost // ignore: cast_nullable_to_non_nullable
              as bool,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      currentRank: freezed == currentRank
          ? _value.currentRank
          : currentRank // ignore: cast_nullable_to_non_nullable
              as int?,
      joinedAt: null == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayerStateModelImpl implements _PlayerStateModel {
  const _$PlayerStateModelImpl(
      {required this.userId,
      required this.username,
      this.avatarUrl,
      this.score = 0,
      this.correctAnswers = 0,
      this.wrongAnswers = 0,
      this.isReady = false,
      this.isHost = false,
      this.isConnected = true,
      this.currentRank,
      required this.joinedAt});

  factory _$PlayerStateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerStateModelImplFromJson(json);

  @override
  final String userId;
  @override
  final String username;
  @override
  final String? avatarUrl;
  @override
  @JsonKey()
  final int score;
  @override
  @JsonKey()
  final int correctAnswers;
  @override
  @JsonKey()
  final int wrongAnswers;
  @override
  @JsonKey()
  final bool isReady;
  @override
  @JsonKey()
  final bool isHost;
  @override
  @JsonKey()
  final bool isConnected;
  @override
  final int? currentRank;
  @override
  final DateTime joinedAt;

  @override
  String toString() {
    return 'PlayerStateModel(userId: $userId, username: $username, avatarUrl: $avatarUrl, score: $score, correctAnswers: $correctAnswers, wrongAnswers: $wrongAnswers, isReady: $isReady, isHost: $isHost, isConnected: $isConnected, currentRank: $currentRank, joinedAt: $joinedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerStateModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.correctAnswers, correctAnswers) ||
                other.correctAnswers == correctAnswers) &&
            (identical(other.wrongAnswers, wrongAnswers) ||
                other.wrongAnswers == wrongAnswers) &&
            (identical(other.isReady, isReady) || other.isReady == isReady) &&
            (identical(other.isHost, isHost) || other.isHost == isHost) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected) &&
            (identical(other.currentRank, currentRank) ||
                other.currentRank == currentRank) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      username,
      avatarUrl,
      score,
      correctAnswers,
      wrongAnswers,
      isReady,
      isHost,
      isConnected,
      currentRank,
      joinedAt);

  /// Create a copy of PlayerStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerStateModelImplCopyWith<_$PlayerStateModelImpl> get copyWith =>
      __$$PlayerStateModelImplCopyWithImpl<_$PlayerStateModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerStateModelImplToJson(
      this,
    );
  }
}

abstract class _PlayerStateModel implements PlayerStateModel {
  const factory _PlayerStateModel(
      {required final String userId,
      required final String username,
      final String? avatarUrl,
      final int score,
      final int correctAnswers,
      final int wrongAnswers,
      final bool isReady,
      final bool isHost,
      final bool isConnected,
      final int? currentRank,
      required final DateTime joinedAt}) = _$PlayerStateModelImpl;

  factory _PlayerStateModel.fromJson(Map<String, dynamic> json) =
      _$PlayerStateModelImpl.fromJson;

  @override
  String get userId;
  @override
  String get username;
  @override
  String? get avatarUrl;
  @override
  int get score;
  @override
  int get correctAnswers;
  @override
  int get wrongAnswers;
  @override
  bool get isReady;
  @override
  bool get isHost;
  @override
  bool get isConnected;
  @override
  int? get currentRank;
  @override
  DateTime get joinedAt;

  /// Create a copy of PlayerStateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerStateModelImplCopyWith<_$PlayerStateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GameRoomModel _$GameRoomModelFromJson(Map<String, dynamic> json) {
  return _GameRoomModel.fromJson(json);
}

/// @nodoc
mixin _$GameRoomModel {
  String get id => throw _privateConstructorUsedError;
  String get roomCode => throw _privateConstructorUsedError;
  String get hostId => throw _privateConstructorUsedError;
  String get gameMode => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get visibility => throw _privateConstructorUsedError;
  List<PlayerStateModel> get players => throw _privateConstructorUsedError;
  int get maxPlayers => throw _privateConstructorUsedError;
  int get currentRound => throw _privateConstructorUsedError;
  int get totalRounds => throw _privateConstructorUsedError;
  int get roundTimeLimit => throw _privateConstructorUsedError;
  String? get currentWordId => throw _privateConstructorUsedError;
  DateTime? get roundStartTime => throw _privateConstructorUsedError;
  DateTime? get roundEndTime => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;
  String get difficulty => throw _privateConstructorUsedError;
  bool get allowHints => throw _privateConstructorUsedError;
  int get hintsPerRound => throw _privateConstructorUsedError;
  bool get allowPowerUps => throw _privateConstructorUsedError;
  int get entryFee => throw _privateConstructorUsedError;
  String get entryCurrency => throw _privateConstructorUsedError;
  Map<String, dynamic> get prizes => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get startedAt => throw _privateConstructorUsedError;
  DateTime? get finishedAt => throw _privateConstructorUsedError;
  Map<String, dynamic> get settings => throw _privateConstructorUsedError;

  /// Serializes this GameRoomModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GameRoomModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameRoomModelCopyWith<GameRoomModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameRoomModelCopyWith<$Res> {
  factory $GameRoomModelCopyWith(
          GameRoomModel value, $Res Function(GameRoomModel) then) =
      _$GameRoomModelCopyWithImpl<$Res, GameRoomModel>;
  @useResult
  $Res call(
      {String id,
      String roomCode,
      String hostId,
      String gameMode,
      String status,
      String visibility,
      List<PlayerStateModel> players,
      int maxPlayers,
      int currentRound,
      int totalRounds,
      int roundTimeLimit,
      String? currentWordId,
      DateTime? roundStartTime,
      DateTime? roundEndTime,
      List<String> categories,
      String difficulty,
      bool allowHints,
      int hintsPerRound,
      bool allowPowerUps,
      int entryFee,
      String entryCurrency,
      Map<String, dynamic> prizes,
      DateTime createdAt,
      DateTime? startedAt,
      DateTime? finishedAt,
      Map<String, dynamic> settings});
}

/// @nodoc
class _$GameRoomModelCopyWithImpl<$Res, $Val extends GameRoomModel>
    implements $GameRoomModelCopyWith<$Res> {
  _$GameRoomModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameRoomModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? roomCode = null,
    Object? hostId = null,
    Object? gameMode = null,
    Object? status = null,
    Object? visibility = null,
    Object? players = null,
    Object? maxPlayers = null,
    Object? currentRound = null,
    Object? totalRounds = null,
    Object? roundTimeLimit = null,
    Object? currentWordId = freezed,
    Object? roundStartTime = freezed,
    Object? roundEndTime = freezed,
    Object? categories = null,
    Object? difficulty = null,
    Object? allowHints = null,
    Object? hintsPerRound = null,
    Object? allowPowerUps = null,
    Object? entryFee = null,
    Object? entryCurrency = null,
    Object? prizes = null,
    Object? createdAt = null,
    Object? startedAt = freezed,
    Object? finishedAt = freezed,
    Object? settings = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      roomCode: null == roomCode
          ? _value.roomCode
          : roomCode // ignore: cast_nullable_to_non_nullable
              as String,
      hostId: null == hostId
          ? _value.hostId
          : hostId // ignore: cast_nullable_to_non_nullable
              as String,
      gameMode: null == gameMode
          ? _value.gameMode
          : gameMode // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as String,
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<PlayerStateModel>,
      maxPlayers: null == maxPlayers
          ? _value.maxPlayers
          : maxPlayers // ignore: cast_nullable_to_non_nullable
              as int,
      currentRound: null == currentRound
          ? _value.currentRound
          : currentRound // ignore: cast_nullable_to_non_nullable
              as int,
      totalRounds: null == totalRounds
          ? _value.totalRounds
          : totalRounds // ignore: cast_nullable_to_non_nullable
              as int,
      roundTimeLimit: null == roundTimeLimit
          ? _value.roundTimeLimit
          : roundTimeLimit // ignore: cast_nullable_to_non_nullable
              as int,
      currentWordId: freezed == currentWordId
          ? _value.currentWordId
          : currentWordId // ignore: cast_nullable_to_non_nullable
              as String?,
      roundStartTime: freezed == roundStartTime
          ? _value.roundStartTime
          : roundStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      roundEndTime: freezed == roundEndTime
          ? _value.roundEndTime
          : roundEndTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
      allowHints: null == allowHints
          ? _value.allowHints
          : allowHints // ignore: cast_nullable_to_non_nullable
              as bool,
      hintsPerRound: null == hintsPerRound
          ? _value.hintsPerRound
          : hintsPerRound // ignore: cast_nullable_to_non_nullable
              as int,
      allowPowerUps: null == allowPowerUps
          ? _value.allowPowerUps
          : allowPowerUps // ignore: cast_nullable_to_non_nullable
              as bool,
      entryFee: null == entryFee
          ? _value.entryFee
          : entryFee // ignore: cast_nullable_to_non_nullable
              as int,
      entryCurrency: null == entryCurrency
          ? _value.entryCurrency
          : entryCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      prizes: null == prizes
          ? _value.prizes
          : prizes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      finishedAt: freezed == finishedAt
          ? _value.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameRoomModelImplCopyWith<$Res>
    implements $GameRoomModelCopyWith<$Res> {
  factory _$$GameRoomModelImplCopyWith(
          _$GameRoomModelImpl value, $Res Function(_$GameRoomModelImpl) then) =
      __$$GameRoomModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String roomCode,
      String hostId,
      String gameMode,
      String status,
      String visibility,
      List<PlayerStateModel> players,
      int maxPlayers,
      int currentRound,
      int totalRounds,
      int roundTimeLimit,
      String? currentWordId,
      DateTime? roundStartTime,
      DateTime? roundEndTime,
      List<String> categories,
      String difficulty,
      bool allowHints,
      int hintsPerRound,
      bool allowPowerUps,
      int entryFee,
      String entryCurrency,
      Map<String, dynamic> prizes,
      DateTime createdAt,
      DateTime? startedAt,
      DateTime? finishedAt,
      Map<String, dynamic> settings});
}

/// @nodoc
class __$$GameRoomModelImplCopyWithImpl<$Res>
    extends _$GameRoomModelCopyWithImpl<$Res, _$GameRoomModelImpl>
    implements _$$GameRoomModelImplCopyWith<$Res> {
  __$$GameRoomModelImplCopyWithImpl(
      _$GameRoomModelImpl _value, $Res Function(_$GameRoomModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameRoomModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? roomCode = null,
    Object? hostId = null,
    Object? gameMode = null,
    Object? status = null,
    Object? visibility = null,
    Object? players = null,
    Object? maxPlayers = null,
    Object? currentRound = null,
    Object? totalRounds = null,
    Object? roundTimeLimit = null,
    Object? currentWordId = freezed,
    Object? roundStartTime = freezed,
    Object? roundEndTime = freezed,
    Object? categories = null,
    Object? difficulty = null,
    Object? allowHints = null,
    Object? hintsPerRound = null,
    Object? allowPowerUps = null,
    Object? entryFee = null,
    Object? entryCurrency = null,
    Object? prizes = null,
    Object? createdAt = null,
    Object? startedAt = freezed,
    Object? finishedAt = freezed,
    Object? settings = null,
  }) {
    return _then(_$GameRoomModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      roomCode: null == roomCode
          ? _value.roomCode
          : roomCode // ignore: cast_nullable_to_non_nullable
              as String,
      hostId: null == hostId
          ? _value.hostId
          : hostId // ignore: cast_nullable_to_non_nullable
              as String,
      gameMode: null == gameMode
          ? _value.gameMode
          : gameMode // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as String,
      players: null == players
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as List<PlayerStateModel>,
      maxPlayers: null == maxPlayers
          ? _value.maxPlayers
          : maxPlayers // ignore: cast_nullable_to_non_nullable
              as int,
      currentRound: null == currentRound
          ? _value.currentRound
          : currentRound // ignore: cast_nullable_to_non_nullable
              as int,
      totalRounds: null == totalRounds
          ? _value.totalRounds
          : totalRounds // ignore: cast_nullable_to_non_nullable
              as int,
      roundTimeLimit: null == roundTimeLimit
          ? _value.roundTimeLimit
          : roundTimeLimit // ignore: cast_nullable_to_non_nullable
              as int,
      currentWordId: freezed == currentWordId
          ? _value.currentWordId
          : currentWordId // ignore: cast_nullable_to_non_nullable
              as String?,
      roundStartTime: freezed == roundStartTime
          ? _value.roundStartTime
          : roundStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      roundEndTime: freezed == roundEndTime
          ? _value.roundEndTime
          : roundEndTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
      allowHints: null == allowHints
          ? _value.allowHints
          : allowHints // ignore: cast_nullable_to_non_nullable
              as bool,
      hintsPerRound: null == hintsPerRound
          ? _value.hintsPerRound
          : hintsPerRound // ignore: cast_nullable_to_non_nullable
              as int,
      allowPowerUps: null == allowPowerUps
          ? _value.allowPowerUps
          : allowPowerUps // ignore: cast_nullable_to_non_nullable
              as bool,
      entryFee: null == entryFee
          ? _value.entryFee
          : entryFee // ignore: cast_nullable_to_non_nullable
              as int,
      entryCurrency: null == entryCurrency
          ? _value.entryCurrency
          : entryCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      prizes: null == prizes
          ? _value._prizes
          : prizes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      finishedAt: freezed == finishedAt
          ? _value.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      settings: null == settings
          ? _value._settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameRoomModelImpl implements _GameRoomModel {
  const _$GameRoomModelImpl(
      {required this.id,
      required this.roomCode,
      required this.hostId,
      required this.gameMode,
      required this.status,
      required this.visibility,
      required final List<PlayerStateModel> players,
      this.maxPlayers = 10,
      this.currentRound = 0,
      this.totalRounds = 10,
      this.roundTimeLimit = 30,
      this.currentWordId,
      this.roundStartTime,
      this.roundEndTime,
      final List<String> categories = const [],
      this.difficulty = 'MEDIUM',
      this.allowHints = true,
      this.hintsPerRound = 3,
      this.allowPowerUps = false,
      this.entryFee = 0,
      this.entryCurrency = 'coins',
      final Map<String, dynamic> prizes = const {},
      required this.createdAt,
      this.startedAt,
      this.finishedAt,
      final Map<String, dynamic> settings = const {}})
      : _players = players,
        _categories = categories,
        _prizes = prizes,
        _settings = settings;

  factory _$GameRoomModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameRoomModelImplFromJson(json);

  @override
  final String id;
  @override
  final String roomCode;
  @override
  final String hostId;
  @override
  final String gameMode;
  @override
  final String status;
  @override
  final String visibility;
  final List<PlayerStateModel> _players;
  @override
  List<PlayerStateModel> get players {
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

  @override
  @JsonKey()
  final int maxPlayers;
  @override
  @JsonKey()
  final int currentRound;
  @override
  @JsonKey()
  final int totalRounds;
  @override
  @JsonKey()
  final int roundTimeLimit;
  @override
  final String? currentWordId;
  @override
  final DateTime? roundStartTime;
  @override
  final DateTime? roundEndTime;
  final List<String> _categories;
  @override
  @JsonKey()
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  @JsonKey()
  final String difficulty;
  @override
  @JsonKey()
  final bool allowHints;
  @override
  @JsonKey()
  final int hintsPerRound;
  @override
  @JsonKey()
  final bool allowPowerUps;
  @override
  @JsonKey()
  final int entryFee;
  @override
  @JsonKey()
  final String entryCurrency;
  final Map<String, dynamic> _prizes;
  @override
  @JsonKey()
  Map<String, dynamic> get prizes {
    if (_prizes is EqualUnmodifiableMapView) return _prizes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_prizes);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime? startedAt;
  @override
  final DateTime? finishedAt;
  final Map<String, dynamic> _settings;
  @override
  @JsonKey()
  Map<String, dynamic> get settings {
    if (_settings is EqualUnmodifiableMapView) return _settings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_settings);
  }

  @override
  String toString() {
    return 'GameRoomModel(id: $id, roomCode: $roomCode, hostId: $hostId, gameMode: $gameMode, status: $status, visibility: $visibility, players: $players, maxPlayers: $maxPlayers, currentRound: $currentRound, totalRounds: $totalRounds, roundTimeLimit: $roundTimeLimit, currentWordId: $currentWordId, roundStartTime: $roundStartTime, roundEndTime: $roundEndTime, categories: $categories, difficulty: $difficulty, allowHints: $allowHints, hintsPerRound: $hintsPerRound, allowPowerUps: $allowPowerUps, entryFee: $entryFee, entryCurrency: $entryCurrency, prizes: $prizes, createdAt: $createdAt, startedAt: $startedAt, finishedAt: $finishedAt, settings: $settings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameRoomModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.roomCode, roomCode) ||
                other.roomCode == roomCode) &&
            (identical(other.hostId, hostId) || other.hostId == hostId) &&
            (identical(other.gameMode, gameMode) ||
                other.gameMode == gameMode) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            const DeepCollectionEquality().equals(other._players, _players) &&
            (identical(other.maxPlayers, maxPlayers) ||
                other.maxPlayers == maxPlayers) &&
            (identical(other.currentRound, currentRound) ||
                other.currentRound == currentRound) &&
            (identical(other.totalRounds, totalRounds) ||
                other.totalRounds == totalRounds) &&
            (identical(other.roundTimeLimit, roundTimeLimit) ||
                other.roundTimeLimit == roundTimeLimit) &&
            (identical(other.currentWordId, currentWordId) ||
                other.currentWordId == currentWordId) &&
            (identical(other.roundStartTime, roundStartTime) ||
                other.roundStartTime == roundStartTime) &&
            (identical(other.roundEndTime, roundEndTime) ||
                other.roundEndTime == roundEndTime) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.allowHints, allowHints) ||
                other.allowHints == allowHints) &&
            (identical(other.hintsPerRound, hintsPerRound) ||
                other.hintsPerRound == hintsPerRound) &&
            (identical(other.allowPowerUps, allowPowerUps) ||
                other.allowPowerUps == allowPowerUps) &&
            (identical(other.entryFee, entryFee) ||
                other.entryFee == entryFee) &&
            (identical(other.entryCurrency, entryCurrency) ||
                other.entryCurrency == entryCurrency) &&
            const DeepCollectionEquality().equals(other._prizes, _prizes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.finishedAt, finishedAt) ||
                other.finishedAt == finishedAt) &&
            const DeepCollectionEquality().equals(other._settings, _settings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        roomCode,
        hostId,
        gameMode,
        status,
        visibility,
        const DeepCollectionEquality().hash(_players),
        maxPlayers,
        currentRound,
        totalRounds,
        roundTimeLimit,
        currentWordId,
        roundStartTime,
        roundEndTime,
        const DeepCollectionEquality().hash(_categories),
        difficulty,
        allowHints,
        hintsPerRound,
        allowPowerUps,
        entryFee,
        entryCurrency,
        const DeepCollectionEquality().hash(_prizes),
        createdAt,
        startedAt,
        finishedAt,
        const DeepCollectionEquality().hash(_settings)
      ]);

  /// Create a copy of GameRoomModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameRoomModelImplCopyWith<_$GameRoomModelImpl> get copyWith =>
      __$$GameRoomModelImplCopyWithImpl<_$GameRoomModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameRoomModelImplToJson(
      this,
    );
  }
}

abstract class _GameRoomModel implements GameRoomModel {
  const factory _GameRoomModel(
      {required final String id,
      required final String roomCode,
      required final String hostId,
      required final String gameMode,
      required final String status,
      required final String visibility,
      required final List<PlayerStateModel> players,
      final int maxPlayers,
      final int currentRound,
      final int totalRounds,
      final int roundTimeLimit,
      final String? currentWordId,
      final DateTime? roundStartTime,
      final DateTime? roundEndTime,
      final List<String> categories,
      final String difficulty,
      final bool allowHints,
      final int hintsPerRound,
      final bool allowPowerUps,
      final int entryFee,
      final String entryCurrency,
      final Map<String, dynamic> prizes,
      required final DateTime createdAt,
      final DateTime? startedAt,
      final DateTime? finishedAt,
      final Map<String, dynamic> settings}) = _$GameRoomModelImpl;

  factory _GameRoomModel.fromJson(Map<String, dynamic> json) =
      _$GameRoomModelImpl.fromJson;

  @override
  String get id;
  @override
  String get roomCode;
  @override
  String get hostId;
  @override
  String get gameMode;
  @override
  String get status;
  @override
  String get visibility;
  @override
  List<PlayerStateModel> get players;
  @override
  int get maxPlayers;
  @override
  int get currentRound;
  @override
  int get totalRounds;
  @override
  int get roundTimeLimit;
  @override
  String? get currentWordId;
  @override
  DateTime? get roundStartTime;
  @override
  DateTime? get roundEndTime;
  @override
  List<String> get categories;
  @override
  String get difficulty;
  @override
  bool get allowHints;
  @override
  int get hintsPerRound;
  @override
  bool get allowPowerUps;
  @override
  int get entryFee;
  @override
  String get entryCurrency;
  @override
  Map<String, dynamic> get prizes;
  @override
  DateTime get createdAt;
  @override
  DateTime? get startedAt;
  @override
  DateTime? get finishedAt;
  @override
  Map<String, dynamic> get settings;

  /// Create a copy of GameRoomModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameRoomModelImplCopyWith<_$GameRoomModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
