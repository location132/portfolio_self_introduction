// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ChapterModel {
  bool get isBlackBackgroundColor => throw _privateConstructorUsedError;
  bool get isChapterActive => throw _privateConstructorUsedError;
  int get currentTitleIndex => throw _privateConstructorUsedError;
  bool get isManuallyChanged => throw _privateConstructorUsedError;

  /// Create a copy of ChapterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChapterModelCopyWith<ChapterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterModelCopyWith<$Res> {
  factory $ChapterModelCopyWith(
    ChapterModel value,
    $Res Function(ChapterModel) then,
  ) = _$ChapterModelCopyWithImpl<$Res, ChapterModel>;
  @useResult
  $Res call({
    bool isBlackBackgroundColor,
    bool isChapterActive,
    int currentTitleIndex,
    bool isManuallyChanged,
  });
}

/// @nodoc
class _$ChapterModelCopyWithImpl<$Res, $Val extends ChapterModel>
    implements $ChapterModelCopyWith<$Res> {
  _$ChapterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChapterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBlackBackgroundColor = null,
    Object? isChapterActive = null,
    Object? currentTitleIndex = null,
    Object? isManuallyChanged = null,
  }) {
    return _then(
      _value.copyWith(
            isBlackBackgroundColor:
                null == isBlackBackgroundColor
                    ? _value.isBlackBackgroundColor
                    : isBlackBackgroundColor // ignore: cast_nullable_to_non_nullable
                        as bool,
            isChapterActive:
                null == isChapterActive
                    ? _value.isChapterActive
                    : isChapterActive // ignore: cast_nullable_to_non_nullable
                        as bool,
            currentTitleIndex:
                null == currentTitleIndex
                    ? _value.currentTitleIndex
                    : currentTitleIndex // ignore: cast_nullable_to_non_nullable
                        as int,
            isManuallyChanged:
                null == isManuallyChanged
                    ? _value.isManuallyChanged
                    : isManuallyChanged // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChapterModelImplCopyWith<$Res>
    implements $ChapterModelCopyWith<$Res> {
  factory _$$ChapterModelImplCopyWith(
    _$ChapterModelImpl value,
    $Res Function(_$ChapterModelImpl) then,
  ) = __$$ChapterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isBlackBackgroundColor,
    bool isChapterActive,
    int currentTitleIndex,
    bool isManuallyChanged,
  });
}

/// @nodoc
class __$$ChapterModelImplCopyWithImpl<$Res>
    extends _$ChapterModelCopyWithImpl<$Res, _$ChapterModelImpl>
    implements _$$ChapterModelImplCopyWith<$Res> {
  __$$ChapterModelImplCopyWithImpl(
    _$ChapterModelImpl _value,
    $Res Function(_$ChapterModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChapterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBlackBackgroundColor = null,
    Object? isChapterActive = null,
    Object? currentTitleIndex = null,
    Object? isManuallyChanged = null,
  }) {
    return _then(
      _$ChapterModelImpl(
        isBlackBackgroundColor:
            null == isBlackBackgroundColor
                ? _value.isBlackBackgroundColor
                : isBlackBackgroundColor // ignore: cast_nullable_to_non_nullable
                    as bool,
        isChapterActive:
            null == isChapterActive
                ? _value.isChapterActive
                : isChapterActive // ignore: cast_nullable_to_non_nullable
                    as bool,
        currentTitleIndex:
            null == currentTitleIndex
                ? _value.currentTitleIndex
                : currentTitleIndex // ignore: cast_nullable_to_non_nullable
                    as int,
        isManuallyChanged:
            null == isManuallyChanged
                ? _value.isManuallyChanged
                : isManuallyChanged // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$ChapterModelImpl implements _ChapterModel {
  const _$ChapterModelImpl({
    this.isBlackBackgroundColor = false,
    this.isChapterActive = false,
    this.currentTitleIndex = 0,
    this.isManuallyChanged = false,
  });

  @override
  @JsonKey()
  final bool isBlackBackgroundColor;
  @override
  @JsonKey()
  final bool isChapterActive;
  @override
  @JsonKey()
  final int currentTitleIndex;
  @override
  @JsonKey()
  final bool isManuallyChanged;

  @override
  String toString() {
    return 'ChapterModel(isBlackBackgroundColor: $isBlackBackgroundColor, isChapterActive: $isChapterActive, currentTitleIndex: $currentTitleIndex, isManuallyChanged: $isManuallyChanged)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChapterModelImpl &&
            (identical(other.isBlackBackgroundColor, isBlackBackgroundColor) ||
                other.isBlackBackgroundColor == isBlackBackgroundColor) &&
            (identical(other.isChapterActive, isChapterActive) ||
                other.isChapterActive == isChapterActive) &&
            (identical(other.currentTitleIndex, currentTitleIndex) ||
                other.currentTitleIndex == currentTitleIndex) &&
            (identical(other.isManuallyChanged, isManuallyChanged) ||
                other.isManuallyChanged == isManuallyChanged));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isBlackBackgroundColor,
    isChapterActive,
    currentTitleIndex,
    isManuallyChanged,
  );

  /// Create a copy of ChapterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChapterModelImplCopyWith<_$ChapterModelImpl> get copyWith =>
      __$$ChapterModelImplCopyWithImpl<_$ChapterModelImpl>(this, _$identity);
}

abstract class _ChapterModel implements ChapterModel {
  const factory _ChapterModel({
    final bool isBlackBackgroundColor,
    final bool isChapterActive,
    final int currentTitleIndex,
    final bool isManuallyChanged,
  }) = _$ChapterModelImpl;

  @override
  bool get isBlackBackgroundColor;
  @override
  bool get isChapterActive;
  @override
  int get currentTitleIndex;
  @override
  bool get isManuallyChanged;

  /// Create a copy of ChapterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChapterModelImplCopyWith<_$ChapterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
