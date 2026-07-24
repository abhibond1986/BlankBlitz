// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnswerModel _$AnswerModelFromJson(Map<String, dynamic> json) {
  return _AnswerModel.fromJson(json);
}

/// @nodoc
mixin _$AnswerModel {
  String get id => throw _privateConstructorUsedError;
  String get gameRoomId => throw _privateConstructorUsedError;
  String get wordId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get roundNumber => throw _privateConstructorUsedError;
  int get scoreEarned => throw _privateConstructorUsedError;
  int get timeTakenMs => throw _privateConstructorUsedError;
  int get hintsUsed => throw _privateConstructorUsedError;
  List<String> get powerUpsUsed => throw _privateConstructorUsedError;
  bool get isFirstCorrect => throw _privateConstructorUsedError;
  int? get rank => throw _privateConstructorUsedError;
  DateTime get submittedAt => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  /// Serializes this AnswerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnswerModelCopyWith<AnswerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerModelCopyWith<$Res> {
  factory $AnswerModelCopyWith(
          AnswerModel value, $Res Function(AnswerModel) then) =
      _$AnswerModelCopyWithImpl<$Res, AnswerModel>;
  @useResult
  $Res call(
      {String id,
      String gameRoomId,
      String wordId,
      String userId,
      String answer,
      String status,
      int roundNumber,
      int scoreEarned,
      int timeTakenMs,
      int hintsUsed,
      List<String> powerUpsUsed,
      bool isFirstCorrect,
      int? rank,
      DateTime submittedAt,
      Map<String, dynamic> metadata});
}

/// @nodoc
class _$AnswerModelCopyWithImpl<$Res, $Val extends AnswerModel>
    implements $AnswerModelCopyWith<$Res> {
  _$AnswerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? gameRoomId = null,
    Object? wordId = null,
    Object? userId = null,
    Object? answer = null,
    Object? status = null,
    Object? roundNumber = null,
    Object? scoreEarned = null,
    Object? timeTakenMs = null,
    Object? hintsUsed = null,
    Object? powerUpsUsed = null,
    Object? isFirstCorrect = null,
    Object? rank = freezed,
    Object? submittedAt = null,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      gameRoomId: null == gameRoomId
          ? _value.gameRoomId
          : gameRoomId // ignore: cast_nullable_to_non_nullable
              as String,
      wordId: null == wordId
          ? _value.wordId
          : wordId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      roundNumber: null == roundNumber
          ? _value.roundNumber
          : roundNumber // ignore: cast_nullable_to_non_nullable
              as int,
      scoreEarned: null == scoreEarned
          ? _value.scoreEarned
          : scoreEarned // ignore: cast_nullable_to_non_nullable
              as int,
      timeTakenMs: null == timeTakenMs
          ? _value.timeTakenMs
          : timeTakenMs // ignore: cast_nullable_to_non_nullable
              as int,
      hintsUsed: null == hintsUsed
          ? _value.hintsUsed
          : hintsUsed // ignore: cast_nullable_to_non_nullable
              as int,
      powerUpsUsed: null == powerUpsUsed
          ? _value.powerUpsUsed
          : powerUpsUsed // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isFirstCorrect: null == isFirstCorrect
          ? _value.isFirstCorrect
          : isFirstCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
      submittedAt: null == submittedAt
          ? _value.submittedAt
          : submittedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnswerModelImplCopyWith<$Res>
    implements $AnswerModelCopyWith<$Res> {
  factory _$$AnswerModelImplCopyWith(
          _$AnswerModelImpl value, $Res Function(_$AnswerModelImpl) then) =
      __$$AnswerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String gameRoomId,
      String wordId,
      String userId,
      String answer,
      String status,
      int roundNumber,
      int scoreEarned,
      int timeTakenMs,
      int hintsUsed,
      List<String> powerUpsUsed,
      bool isFirstCorrect,
      int? rank,
      DateTime submittedAt,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$$AnswerModelImplCopyWithImpl<$Res>
    extends _$AnswerModelCopyWithImpl<$Res, _$AnswerModelImpl>
    implements _$$AnswerModelImplCopyWith<$Res> {
  __$$AnswerModelImplCopyWithImpl(
      _$AnswerModelImpl _value, $Res Function(_$AnswerModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? gameRoomId = null,
    Object? wordId = null,
    Object? userId = null,
    Object? answer = null,
    Object? status = null,
    Object? roundNumber = null,
    Object? scoreEarned = null,
    Object? timeTakenMs = null,
    Object? hintsUsed = null,
    Object? powerUpsUsed = null,
    Object? isFirstCorrect = null,
    Object? rank = freezed,
    Object? submittedAt = null,
    Object? metadata = null,
  }) {
    return _then(_$AnswerModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      gameRoomId: null == gameRoomId
          ? _value.gameRoomId
          : gameRoomId // ignore: cast_nullable_to_non_nullable
              as String,
      wordId: null == wordId
          ? _value.wordId
          : wordId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      roundNumber: null == roundNumber
          ? _value.roundNumber
          : roundNumber // ignore: cast_nullable_to_non_nullable
              as int,
      scoreEarned: null == scoreEarned
          ? _value.scoreEarned
          : scoreEarned // ignore: cast_nullable_to_non_nullable
              as int,
      timeTakenMs: null == timeTakenMs
          ? _value.timeTakenMs
          : timeTakenMs // ignore: cast_nullable_to_non_nullable
              as int,
      hintsUsed: null == hintsUsed
          ? _value.hintsUsed
          : hintsUsed // ignore: cast_nullable_to_non_nullable
              as int,
      powerUpsUsed: null == powerUpsUsed
          ? _value._powerUpsUsed
          : powerUpsUsed // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isFirstCorrect: null == isFirstCorrect
          ? _value.isFirstCorrect
          : isFirstCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
      submittedAt: null == submittedAt
          ? _value.submittedAt
          : submittedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnswerModelImpl implements _AnswerModel {
  const _$AnswerModelImpl(
      {required this.id,
      required this.gameRoomId,
      required this.wordId,
      required this.userId,
      required this.answer,
      required this.status,
      required this.roundNumber,
      this.scoreEarned = 0,
      required this.timeTakenMs,
      this.hintsUsed = 0,
      final List<String> powerUpsUsed = const [],
      this.isFirstCorrect = false,
      this.rank,
      required this.submittedAt,
      final Map<String, dynamic> metadata = const {}})
      : _powerUpsUsed = powerUpsUsed,
        _metadata = metadata;

  factory _$AnswerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnswerModelImplFromJson(json);

  @override
  final String id;
  @override
  final String gameRoomId;
  @override
  final String wordId;
  @override
  final String userId;
  @override
  final String answer;
  @override
  final String status;
  @override
  final int roundNumber;
  @override
  @JsonKey()
  final int scoreEarned;
  @override
  final int timeTakenMs;
  @override
  @JsonKey()
  final int hintsUsed;
  final List<String> _powerUpsUsed;
  @override
  @JsonKey()
  List<String> get powerUpsUsed {
    if (_powerUpsUsed is EqualUnmodifiableListView) return _powerUpsUsed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_powerUpsUsed);
  }

  @override
  @JsonKey()
  final bool isFirstCorrect;
  @override
  final int? rank;
  @override
  final DateTime submittedAt;
  final Map<String, dynamic> _metadata;
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  String toString() {
    return 'AnswerModel(id: $id, gameRoomId: $gameRoomId, wordId: $wordId, userId: $userId, answer: $answer, status: $status, roundNumber: $roundNumber, scoreEarned: $scoreEarned, timeTakenMs: $timeTakenMs, hintsUsed: $hintsUsed, powerUpsUsed: $powerUpsUsed, isFirstCorrect: $isFirstCorrect, rank: $rank, submittedAt: $submittedAt, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.gameRoomId, gameRoomId) ||
                other.gameRoomId == gameRoomId) &&
            (identical(other.wordId, wordId) || other.wordId == wordId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.roundNumber, roundNumber) ||
                other.roundNumber == roundNumber) &&
            (identical(other.scoreEarned, scoreEarned) ||
                other.scoreEarned == scoreEarned) &&
            (identical(other.timeTakenMs, timeTakenMs) ||
                other.timeTakenMs == timeTakenMs) &&
            (identical(other.hintsUsed, hintsUsed) ||
                other.hintsUsed == hintsUsed) &&
            const DeepCollectionEquality()
                .equals(other._powerUpsUsed, _powerUpsUsed) &&
            (identical(other.isFirstCorrect, isFirstCorrect) ||
                other.isFirstCorrect == isFirstCorrect) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.submittedAt, submittedAt) ||
                other.submittedAt == submittedAt) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      gameRoomId,
      wordId,
      userId,
      answer,
      status,
      roundNumber,
      scoreEarned,
      timeTakenMs,
      hintsUsed,
      const DeepCollectionEquality().hash(_powerUpsUsed),
      isFirstCorrect,
      rank,
      submittedAt,
      const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of AnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerModelImplCopyWith<_$AnswerModelImpl> get copyWith =>
      __$$AnswerModelImplCopyWithImpl<_$AnswerModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnswerModelImplToJson(
      this,
    );
  }
}

abstract class _AnswerModel implements AnswerModel {
  const factory _AnswerModel(
      {required final String id,
      required final String gameRoomId,
      required final String wordId,
      required final String userId,
      required final String answer,
      required final String status,
      required final int roundNumber,
      final int scoreEarned,
      required final int timeTakenMs,
      final int hintsUsed,
      final List<String> powerUpsUsed,
      final bool isFirstCorrect,
      final int? rank,
      required final DateTime submittedAt,
      final Map<String, dynamic> metadata}) = _$AnswerModelImpl;

  factory _AnswerModel.fromJson(Map<String, dynamic> json) =
      _$AnswerModelImpl.fromJson;

  @override
  String get id;
  @override
  String get gameRoomId;
  @override
  String get wordId;
  @override
  String get userId;
  @override
  String get answer;
  @override
  String get status;
  @override
  int get roundNumber;
  @override
  int get scoreEarned;
  @override
  int get timeTakenMs;
  @override
  int get hintsUsed;
  @override
  List<String> get powerUpsUsed;
  @override
  bool get isFirstCorrect;
  @override
  int? get rank;
  @override
  DateTime get submittedAt;
  @override
  Map<String, dynamic> get metadata;

  /// Create a copy of AnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnswerModelImplCopyWith<_$AnswerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RoundResultModel _$RoundResultModelFromJson(Map<String, dynamic> json) {
  return _RoundResultModel.fromJson(json);
}

/// @nodoc
mixin _$RoundResultModel {
  int get roundNumber => throw _privateConstructorUsedError;
  String get wordId => throw _privateConstructorUsedError;
  String get correctWord => throw _privateConstructorUsedError;
  List<AnswerModel> get answers => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;

  /// Serializes this RoundResultModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RoundResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RoundResultModelCopyWith<RoundResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoundResultModelCopyWith<$Res> {
  factory $RoundResultModelCopyWith(
          RoundResultModel value, $Res Function(RoundResultModel) then) =
      _$RoundResultModelCopyWithImpl<$Res, RoundResultModel>;
  @useResult
  $Res call(
      {int roundNumber,
      String wordId,
      String correctWord,
      List<AnswerModel> answers,
      DateTime startTime,
      DateTime endTime});
}

/// @nodoc
class _$RoundResultModelCopyWithImpl<$Res, $Val extends RoundResultModel>
    implements $RoundResultModelCopyWith<$Res> {
  _$RoundResultModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RoundResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roundNumber = null,
    Object? wordId = null,
    Object? correctWord = null,
    Object? answers = null,
    Object? startTime = null,
    Object? endTime = null,
  }) {
    return _then(_value.copyWith(
      roundNumber: null == roundNumber
          ? _value.roundNumber
          : roundNumber // ignore: cast_nullable_to_non_nullable
              as int,
      wordId: null == wordId
          ? _value.wordId
          : wordId // ignore: cast_nullable_to_non_nullable
              as String,
      correctWord: null == correctWord
          ? _value.correctWord
          : correctWord // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<AnswerModel>,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoundResultModelImplCopyWith<$Res>
    implements $RoundResultModelCopyWith<$Res> {
  factory _$$RoundResultModelImplCopyWith(_$RoundResultModelImpl value,
          $Res Function(_$RoundResultModelImpl) then) =
      __$$RoundResultModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int roundNumber,
      String wordId,
      String correctWord,
      List<AnswerModel> answers,
      DateTime startTime,
      DateTime endTime});
}

/// @nodoc
class __$$RoundResultModelImplCopyWithImpl<$Res>
    extends _$RoundResultModelCopyWithImpl<$Res, _$RoundResultModelImpl>
    implements _$$RoundResultModelImplCopyWith<$Res> {
  __$$RoundResultModelImplCopyWithImpl(_$RoundResultModelImpl _value,
      $Res Function(_$RoundResultModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RoundResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roundNumber = null,
    Object? wordId = null,
    Object? correctWord = null,
    Object? answers = null,
    Object? startTime = null,
    Object? endTime = null,
  }) {
    return _then(_$RoundResultModelImpl(
      roundNumber: null == roundNumber
          ? _value.roundNumber
          : roundNumber // ignore: cast_nullable_to_non_nullable
              as int,
      wordId: null == wordId
          ? _value.wordId
          : wordId // ignore: cast_nullable_to_non_nullable
              as String,
      correctWord: null == correctWord
          ? _value.correctWord
          : correctWord // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<AnswerModel>,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoundResultModelImpl implements _RoundResultModel {
  const _$RoundResultModelImpl(
      {required this.roundNumber,
      required this.wordId,
      required this.correctWord,
      required final List<AnswerModel> answers,
      required this.startTime,
      required this.endTime})
      : _answers = answers;

  factory _$RoundResultModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoundResultModelImplFromJson(json);

  @override
  final int roundNumber;
  @override
  final String wordId;
  @override
  final String correctWord;
  final List<AnswerModel> _answers;
  @override
  List<AnswerModel> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  final DateTime startTime;
  @override
  final DateTime endTime;

  @override
  String toString() {
    return 'RoundResultModel(roundNumber: $roundNumber, wordId: $wordId, correctWord: $correctWord, answers: $answers, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoundResultModelImpl &&
            (identical(other.roundNumber, roundNumber) ||
                other.roundNumber == roundNumber) &&
            (identical(other.wordId, wordId) || other.wordId == wordId) &&
            (identical(other.correctWord, correctWord) ||
                other.correctWord == correctWord) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, roundNumber, wordId, correctWord,
      const DeepCollectionEquality().hash(_answers), startTime, endTime);

  /// Create a copy of RoundResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoundResultModelImplCopyWith<_$RoundResultModelImpl> get copyWith =>
      __$$RoundResultModelImplCopyWithImpl<_$RoundResultModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoundResultModelImplToJson(
      this,
    );
  }
}

abstract class _RoundResultModel implements RoundResultModel {
  const factory _RoundResultModel(
      {required final int roundNumber,
      required final String wordId,
      required final String correctWord,
      required final List<AnswerModel> answers,
      required final DateTime startTime,
      required final DateTime endTime}) = _$RoundResultModelImpl;

  factory _RoundResultModel.fromJson(Map<String, dynamic> json) =
      _$RoundResultModelImpl.fromJson;

  @override
  int get roundNumber;
  @override
  String get wordId;
  @override
  String get correctWord;
  @override
  List<AnswerModel> get answers;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;

  /// Create a copy of RoundResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoundResultModelImplCopyWith<_$RoundResultModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
