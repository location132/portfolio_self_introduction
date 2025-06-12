// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ifsai_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$IfsaiState {
  bool get isScrollEnabled => throw _privateConstructorUsedError;
  ScrollController? get scrollController =>
      throw _privateConstructorUsedError; // 스크롤 애니메이션 관련 상태
  double get titleScale => throw _privateConstructorUsedError;
  double get titleOpacity => throw _privateConstructorUsedError;
  double get mainTitleOpacity => throw _privateConstructorUsedError;
  double get descriptionOpacity => throw _privateConstructorUsedError;

  /// Create a copy of IfsaiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IfsaiStateCopyWith<IfsaiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IfsaiStateCopyWith<$Res> {
  factory $IfsaiStateCopyWith(
    IfsaiState value,
    $Res Function(IfsaiState) then,
  ) = _$IfsaiStateCopyWithImpl<$Res, IfsaiState>;
  @useResult
  $Res call({
    bool isScrollEnabled,
    ScrollController? scrollController,
    double titleScale,
    double titleOpacity,
    double mainTitleOpacity,
    double descriptionOpacity,
  });
}

/// @nodoc
class _$IfsaiStateCopyWithImpl<$Res, $Val extends IfsaiState>
    implements $IfsaiStateCopyWith<$Res> {
  _$IfsaiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IfsaiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isScrollEnabled = null,
    Object? scrollController = freezed,
    Object? titleScale = null,
    Object? titleOpacity = null,
    Object? mainTitleOpacity = null,
    Object? descriptionOpacity = null,
  }) {
    return _then(
      _value.copyWith(
            isScrollEnabled:
                null == isScrollEnabled
                    ? _value.isScrollEnabled
                    : isScrollEnabled // ignore: cast_nullable_to_non_nullable
                        as bool,
            scrollController:
                freezed == scrollController
                    ? _value.scrollController
                    : scrollController // ignore: cast_nullable_to_non_nullable
                        as ScrollController?,
            titleScale:
                null == titleScale
                    ? _value.titleScale
                    : titleScale // ignore: cast_nullable_to_non_nullable
                        as double,
            titleOpacity:
                null == titleOpacity
                    ? _value.titleOpacity
                    : titleOpacity // ignore: cast_nullable_to_non_nullable
                        as double,
            mainTitleOpacity:
                null == mainTitleOpacity
                    ? _value.mainTitleOpacity
                    : mainTitleOpacity // ignore: cast_nullable_to_non_nullable
                        as double,
            descriptionOpacity:
                null == descriptionOpacity
                    ? _value.descriptionOpacity
                    : descriptionOpacity // ignore: cast_nullable_to_non_nullable
                        as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$IfsaiStateImplCopyWith<$Res>
    implements $IfsaiStateCopyWith<$Res> {
  factory _$$IfsaiStateImplCopyWith(
    _$IfsaiStateImpl value,
    $Res Function(_$IfsaiStateImpl) then,
  ) = __$$IfsaiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isScrollEnabled,
    ScrollController? scrollController,
    double titleScale,
    double titleOpacity,
    double mainTitleOpacity,
    double descriptionOpacity,
  });
}

/// @nodoc
class __$$IfsaiStateImplCopyWithImpl<$Res>
    extends _$IfsaiStateCopyWithImpl<$Res, _$IfsaiStateImpl>
    implements _$$IfsaiStateImplCopyWith<$Res> {
  __$$IfsaiStateImplCopyWithImpl(
    _$IfsaiStateImpl _value,
    $Res Function(_$IfsaiStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IfsaiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isScrollEnabled = null,
    Object? scrollController = freezed,
    Object? titleScale = null,
    Object? titleOpacity = null,
    Object? mainTitleOpacity = null,
    Object? descriptionOpacity = null,
  }) {
    return _then(
      _$IfsaiStateImpl(
        isScrollEnabled:
            null == isScrollEnabled
                ? _value.isScrollEnabled
                : isScrollEnabled // ignore: cast_nullable_to_non_nullable
                    as bool,
        scrollController:
            freezed == scrollController
                ? _value.scrollController
                : scrollController // ignore: cast_nullable_to_non_nullable
                    as ScrollController?,
        titleScale:
            null == titleScale
                ? _value.titleScale
                : titleScale // ignore: cast_nullable_to_non_nullable
                    as double,
        titleOpacity:
            null == titleOpacity
                ? _value.titleOpacity
                : titleOpacity // ignore: cast_nullable_to_non_nullable
                    as double,
        mainTitleOpacity:
            null == mainTitleOpacity
                ? _value.mainTitleOpacity
                : mainTitleOpacity // ignore: cast_nullable_to_non_nullable
                    as double,
        descriptionOpacity:
            null == descriptionOpacity
                ? _value.descriptionOpacity
                : descriptionOpacity // ignore: cast_nullable_to_non_nullable
                    as double,
      ),
    );
  }
}

/// @nodoc

class _$IfsaiStateImpl implements _IfsaiState {
  const _$IfsaiStateImpl({
    this.isScrollEnabled = false,
    this.scrollController,
    this.titleScale = 1.0,
    this.titleOpacity = 1.0,
    this.mainTitleOpacity = 0.0,
    this.descriptionOpacity = 0.0,
  });

  @override
  @JsonKey()
  final bool isScrollEnabled;
  @override
  final ScrollController? scrollController;
  // 스크롤 애니메이션 관련 상태
  @override
  @JsonKey()
  final double titleScale;
  @override
  @JsonKey()
  final double titleOpacity;
  @override
  @JsonKey()
  final double mainTitleOpacity;
  @override
  @JsonKey()
  final double descriptionOpacity;

  @override
  String toString() {
    return 'IfsaiState(isScrollEnabled: $isScrollEnabled, scrollController: $scrollController, titleScale: $titleScale, titleOpacity: $titleOpacity, mainTitleOpacity: $mainTitleOpacity, descriptionOpacity: $descriptionOpacity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IfsaiStateImpl &&
            (identical(other.isScrollEnabled, isScrollEnabled) ||
                other.isScrollEnabled == isScrollEnabled) &&
            (identical(other.scrollController, scrollController) ||
                other.scrollController == scrollController) &&
            (identical(other.titleScale, titleScale) ||
                other.titleScale == titleScale) &&
            (identical(other.titleOpacity, titleOpacity) ||
                other.titleOpacity == titleOpacity) &&
            (identical(other.mainTitleOpacity, mainTitleOpacity) ||
                other.mainTitleOpacity == mainTitleOpacity) &&
            (identical(other.descriptionOpacity, descriptionOpacity) ||
                other.descriptionOpacity == descriptionOpacity));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isScrollEnabled,
    scrollController,
    titleScale,
    titleOpacity,
    mainTitleOpacity,
    descriptionOpacity,
  );

  /// Create a copy of IfsaiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IfsaiStateImplCopyWith<_$IfsaiStateImpl> get copyWith =>
      __$$IfsaiStateImplCopyWithImpl<_$IfsaiStateImpl>(this, _$identity);
}

abstract class _IfsaiState implements IfsaiState {
  const factory _IfsaiState({
    final bool isScrollEnabled,
    final ScrollController? scrollController,
    final double titleScale,
    final double titleOpacity,
    final double mainTitleOpacity,
    final double descriptionOpacity,
  }) = _$IfsaiStateImpl;

  @override
  bool get isScrollEnabled;
  @override
  ScrollController? get scrollController; // 스크롤 애니메이션 관련 상태
  @override
  double get titleScale;
  @override
  double get titleOpacity;
  @override
  double get mainTitleOpacity;
  @override
  double get descriptionOpacity;

  /// Create a copy of IfsaiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IfsaiStateImplCopyWith<_$IfsaiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
