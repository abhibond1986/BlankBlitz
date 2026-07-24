// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HintDataModel _$HintDataModelFromJson(Map<String, dynamic> json) {
  return _HintDataModel.fromJson(json);
}

/// @nodoc
mixin _$HintDataModel {
  String get type => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  int get cost => throw _privateConstructorUsedError;

  /// Serializes this HintDataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HintDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HintDataModelCopyWith<HintDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HintDataModelCopyWith<$Res> {
  factory $HintDataModelCopyWith(
          HintDataModel value, $Res Function(HintDataModel) then) =
      _$HintDataModelCopyWithImpl<$Res, HintDataModel>;
  @useResult
  $Res call({String type, String content, int cost});
}

/// @nodoc
class _$HintDataModelCopyWithImpl<$Res, $Val extends HintDataModel>
    implements $HintDataModelCopyWith<$Res> {
  _$HintDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HintDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? content = null,
    Object? cost = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HintDataModelImplCopyWith<$Res>
    implements $HintDataModelCopyWith<$Res> {
  factory _$$HintDataModelImplCopyWith(
          _$HintDataModelImpl value, $Res Function(_$HintDataModelImpl) then) =
      __$$HintDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String content, int cost});
}

/// @nodoc
class __$$HintDataModelImplCopyWithImpl<$Res>
    extends _$HintDataModelCopyWithImpl<$Res, _$HintDataModelImpl>
    implements _$$HintDataModelImplCopyWith<$Res> {
  __$$HintDataModelImplCopyWithImpl(
      _$HintDataModelImpl _value, $Res Function(_$HintDataModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of HintDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? content = null,
    Object? cost = null,
  }) {
    return _then(_$HintDataModelImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HintDataModelImpl implements _HintDataModel {
  const _$HintDataModelImpl(
      {required this.type, required this.content, this.cost = 10});

  factory _$HintDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HintDataModelImplFromJson(json);

  @override
  final String type;
  @override
  final String content;
  @override
  @JsonKey()
  final int cost;

  @override
  String toString() {
    return 'HintDataModel(type: $type, content: $content, cost: $cost)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HintDataModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.cost, cost) || other.cost == cost));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, content, cost);

  /// Create a copy of HintDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HintDataModelImplCopyWith<_$HintDataModelImpl> get copyWith =>
      __$$HintDataModelImplCopyWithImpl<_$HintDataModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HintDataModelImplToJson(
      this,
    );
  }
}

abstract class _HintDataModel implements HintDataModel {
  const factory _HintDataModel(
      {required final String type,
      required final String content,
      final int cost}) = _$HintDataModelImpl;

  factory _HintDataModel.fromJson(Map<String, dynamic> json) =
      _$HintDataModelImpl.fromJson;

  @override
  String get type;
  @override
  String get content;
  @override
  int get cost;

  /// Create a copy of HintDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HintDataModelImplCopyWith<_$HintDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WordModel _$WordModelFromJson(Map<String, dynamic> json) {
  return _WordModel.fromJson(json);
}

/// @nodoc
mixin _$WordModel {
  String get id => throw _privateConstructorUsedError;
  String get word => throw _privateConstructorUsedError;
  String get displayPattern => throw _privateConstructorUsedError;
  List<int> get blankedIndices => throw _privateConstructorUsedError;
  String get difficulty => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;
  String? get definition => throw _privateConstructorUsedError;
  List<String> get synonyms => throw _privateConstructorUsedError;
  List<String> get relatedWords => throw _privateConstructorUsedError;
  List<HintDataModel> get hints => throw _privateConstructorUsedError;
  int get baseScore => throw _privateConstructorUsedError;
  int get timeBonus => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this WordModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WordModelCopyWith<WordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordModelCopyWith<$Res> {
  factory $WordModelCopyWith(WordModel value, $Res Function(WordModel) then) =
      _$WordModelCopyWithImpl<$Res, WordModel>;
  @useResult
  $Res call(
      {String id,
      String word,
      String displayPattern,
      List<int> blankedIndices,
      String difficulty,
      List<String> categories,
      String? definition,
      List<String> synonyms,
      List<String> relatedWords,
      List<HintDataModel> hints,
      int baseScore,
      int timeBonus,
      String language,
      Map<String, dynamic> metadata,
      DateTime createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$WordModelCopyWithImpl<$Res, $Val extends WordModel>
    implements $WordModelCopyWith<$Res> {
  _$WordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? word = null,
    Object? displayPattern = null,
    Object? blankedIndices = null,
    Object? difficulty = null,
    Object? categories = null,
    Object? definition = freezed,
    Object? synonyms = null,
    Object? relatedWords = null,
    Object? hints = null,
    Object? baseScore = null,
    Object? timeBonus = null,
    Object? language = null,
    Object? metadata = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      displayPattern: null == displayPattern
          ? _value.displayPattern
          : displayPattern // ignore: cast_nullable_to_non_nullable
              as String,
      blankedIndices: null == blankedIndices
          ? _value.blankedIndices
          : blankedIndices // ignore: cast_nullable_to_non_nullable
              as List<int>,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      definition: freezed == definition
          ? _value.definition
          : definition // ignore: cast_nullable_to_non_nullable
              as String?,
      synonyms: null == synonyms
          ? _value.synonyms
          : synonyms // ignore: cast_nullable_to_non_nullable
              as List<String>,
      relatedWords: null == relatedWords
          ? _value.relatedWords
          : relatedWords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      hints: null == hints
          ? _value.hints
          : hints // ignore: cast_nullable_to_non_nullable
              as List<HintDataModel>,
      baseScore: null == baseScore
          ? _value.baseScore
          : baseScore // ignore: cast_nullable_to_non_nullable
              as int,
      timeBonus: null == timeBonus
          ? _value.timeBonus
          : timeBonus // ignore: cast_nullable_to_non_nullable
              as int,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
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
abstract class _$$WordModelImplCopyWith<$Res>
    implements $WordModelCopyWith<$Res> {
  factory _$$WordModelImplCopyWith(
          _$WordModelImpl value, $Res Function(_$WordModelImpl) then) =
      __$$WordModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String word,
      String displayPattern,
      List<int> blankedIndices,
      String difficulty,
      List<String> categories,
      String? definition,
      List<String> synonyms,
      List<String> relatedWords,
      List<HintDataModel> hints,
      int baseScore,
      int timeBonus,
      String language,
      Map<String, dynamic> metadata,
      DateTime createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$WordModelImplCopyWithImpl<$Res>
    extends _$WordModelCopyWithImpl<$Res, _$WordModelImpl>
    implements _$$WordModelImplCopyWith<$Res> {
  __$$WordModelImplCopyWithImpl(
      _$WordModelImpl _value, $Res Function(_$WordModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? word = null,
    Object? displayPattern = null,
    Object? blankedIndices = null,
    Object? difficulty = null,
    Object? categories = null,
    Object? definition = freezed,
    Object? synonyms = null,
    Object? relatedWords = null,
    Object? hints = null,
    Object? baseScore = null,
    Object? timeBonus = null,
    Object? language = null,
    Object? metadata = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$WordModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      displayPattern: null == displayPattern
          ? _value.displayPattern
          : displayPattern // ignore: cast_nullable_to_non_nullable
              as String,
      blankedIndices: null == blankedIndices
          ? _value._blankedIndices
          : blankedIndices // ignore: cast_nullable_to_non_nullable
              as List<int>,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      definition: freezed == definition
          ? _value.definition
          : definition // ignore: cast_nullable_to_non_nullable
              as String?,
      synonyms: null == synonyms
          ? _value._synonyms
          : synonyms // ignore: cast_nullable_to_non_nullable
              as List<String>,
      relatedWords: null == relatedWords
          ? _value._relatedWords
          : relatedWords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      hints: null == hints
          ? _value._hints
          : hints // ignore: cast_nullable_to_non_nullable
              as List<HintDataModel>,
      baseScore: null == baseScore
          ? _value.baseScore
          : baseScore // ignore: cast_nullable_to_non_nullable
              as int,
      timeBonus: null == timeBonus
          ? _value.timeBonus
          : timeBonus // ignore: cast_nullable_to_non_nullable
              as int,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
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
class _$WordModelImpl implements _WordModel {
  const _$WordModelImpl(
      {required this.id,
      required this.word,
      required this.displayPattern,
      required final List<int> blankedIndices,
      required this.difficulty,
      final List<String> categories = const [],
      this.definition,
      final List<String> synonyms = const [],
      final List<String> relatedWords = const [],
      final List<HintDataModel> hints = const [],
      this.baseScore = 100,
      this.timeBonus = 50,
      this.language = 'en',
      final Map<String, dynamic> metadata = const {},
      required this.createdAt,
      this.updatedAt})
      : _blankedIndices = blankedIndices,
        _categories = categories,
        _synonyms = synonyms,
        _relatedWords = relatedWords,
        _hints = hints,
        _metadata = metadata;

  factory _$WordModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WordModelImplFromJson(json);

  @override
  final String id;
  @override
  final String word;
  @override
  final String displayPattern;
  final List<int> _blankedIndices;
  @override
  List<int> get blankedIndices {
    if (_blankedIndices is EqualUnmodifiableListView) return _blankedIndices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blankedIndices);
  }

  @override
  final String difficulty;
  final List<String> _categories;
  @override
  @JsonKey()
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final String? definition;
  final List<String> _synonyms;
  @override
  @JsonKey()
  List<String> get synonyms {
    if (_synonyms is EqualUnmodifiableListView) return _synonyms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_synonyms);
  }

  final List<String> _relatedWords;
  @override
  @JsonKey()
  List<String> get relatedWords {
    if (_relatedWords is EqualUnmodifiableListView) return _relatedWords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_relatedWords);
  }

  final List<HintDataModel> _hints;
  @override
  @JsonKey()
  List<HintDataModel> get hints {
    if (_hints is EqualUnmodifiableListView) return _hints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hints);
  }

  @override
  @JsonKey()
  final int baseScore;
  @override
  @JsonKey()
  final int timeBonus;
  @override
  @JsonKey()
  final String language;
  final Map<String, dynamic> _metadata;
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'WordModel(id: $id, word: $word, displayPattern: $displayPattern, blankedIndices: $blankedIndices, difficulty: $difficulty, categories: $categories, definition: $definition, synonyms: $synonyms, relatedWords: $relatedWords, hints: $hints, baseScore: $baseScore, timeBonus: $timeBonus, language: $language, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.displayPattern, displayPattern) ||
                other.displayPattern == displayPattern) &&
            const DeepCollectionEquality()
                .equals(other._blankedIndices, _blankedIndices) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.definition, definition) ||
                other.definition == definition) &&
            const DeepCollectionEquality().equals(other._synonyms, _synonyms) &&
            const DeepCollectionEquality()
                .equals(other._relatedWords, _relatedWords) &&
            const DeepCollectionEquality().equals(other._hints, _hints) &&
            (identical(other.baseScore, baseScore) ||
                other.baseScore == baseScore) &&
            (identical(other.timeBonus, timeBonus) ||
                other.timeBonus == timeBonus) &&
            (identical(other.language, language) ||
                other.language == language) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      word,
      displayPattern,
      const DeepCollectionEquality().hash(_blankedIndices),
      difficulty,
      const DeepCollectionEquality().hash(_categories),
      definition,
      const DeepCollectionEquality().hash(_synonyms),
      const DeepCollectionEquality().hash(_relatedWords),
      const DeepCollectionEquality().hash(_hints),
      baseScore,
      timeBonus,
      language,
      const DeepCollectionEquality().hash(_metadata),
      createdAt,
      updatedAt);

  /// Create a copy of WordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WordModelImplCopyWith<_$WordModelImpl> get copyWith =>
      __$$WordModelImplCopyWithImpl<_$WordModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WordModelImplToJson(
      this,
    );
  }
}

abstract class _WordModel implements WordModel {
  const factory _WordModel(
      {required final String id,
      required final String word,
      required final String displayPattern,
      required final List<int> blankedIndices,
      required final String difficulty,
      final List<String> categories,
      final String? definition,
      final List<String> synonyms,
      final List<String> relatedWords,
      final List<HintDataModel> hints,
      final int baseScore,
      final int timeBonus,
      final String language,
      final Map<String, dynamic> metadata,
      required final DateTime createdAt,
      final DateTime? updatedAt}) = _$WordModelImpl;

  factory _WordModel.fromJson(Map<String, dynamic> json) =
      _$WordModelImpl.fromJson;

  @override
  String get id;
  @override
  String get word;
  @override
  String get displayPattern;
  @override
  List<int> get blankedIndices;
  @override
  String get difficulty;
  @override
  List<String> get categories;
  @override
  String? get definition;
  @override
  List<String> get synonyms;
  @override
  List<String> get relatedWords;
  @override
  List<HintDataModel> get hints;
  @override
  int get baseScore;
  @override
  int get timeBonus;
  @override
  String get language;
  @override
  Map<String, dynamic> get metadata;
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of WordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WordModelImplCopyWith<_$WordModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
