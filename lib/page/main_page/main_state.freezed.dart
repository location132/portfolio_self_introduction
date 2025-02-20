// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MainPageState {
//StartAnimation 컨트롤러
  StartAnimation? get startAnimation =>
      throw _privateConstructorUsedError; //스크롤 컨트롤러
  ScrollController? get scrollController => throw _privateConstructorUsedError;
  bool get isScrolled => throw _privateConstructorUsedError;
  bool get isAnimationEnd => throw _privateConstructorUsedError;
  MainPageStatus get status => throw _privateConstructorUsedError;

  /// Create a copy of MainPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MainPageStateCopyWith<MainPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainPageStateCopyWith<$Res> {
  factory $MainPageStateCopyWith(
          MainPageState value, $Res Function(MainPageState) then) =
      _$MainPageStateCopyWithImpl<$Res, MainPageState>;
  @useResult
  $Res call(
      {StartAnimation? startAnimation,
      ScrollController? scrollController,
      bool isScrolled,
      bool isAnimationEnd,
      MainPageStatus status});

  $StartAnimationCopyWith<$Res>? get startAnimation;
}

/// @nodoc
class _$MainPageStateCopyWithImpl<$Res, $Val extends MainPageState>
    implements $MainPageStateCopyWith<$Res> {
  _$MainPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MainPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startAnimation = freezed,
    Object? scrollController = freezed,
    Object? isScrolled = null,
    Object? isAnimationEnd = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      startAnimation: freezed == startAnimation
          ? _value.startAnimation
          : startAnimation // ignore: cast_nullable_to_non_nullable
              as StartAnimation?,
      scrollController: freezed == scrollController
          ? _value.scrollController
          : scrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController?,
      isScrolled: null == isScrolled
          ? _value.isScrolled
          : isScrolled // ignore: cast_nullable_to_non_nullable
              as bool,
      isAnimationEnd: null == isAnimationEnd
          ? _value.isAnimationEnd
          : isAnimationEnd // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MainPageStatus,
    ) as $Val);
  }

  /// Create a copy of MainPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StartAnimationCopyWith<$Res>? get startAnimation {
    if (_value.startAnimation == null) {
      return null;
    }

    return $StartAnimationCopyWith<$Res>(_value.startAnimation!, (value) {
      return _then(_value.copyWith(startAnimation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MainPageStateImplCopyWith<$Res>
    implements $MainPageStateCopyWith<$Res> {
  factory _$$MainPageStateImplCopyWith(
          _$MainPageStateImpl value, $Res Function(_$MainPageStateImpl) then) =
      __$$MainPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StartAnimation? startAnimation,
      ScrollController? scrollController,
      bool isScrolled,
      bool isAnimationEnd,
      MainPageStatus status});

  @override
  $StartAnimationCopyWith<$Res>? get startAnimation;
}

/// @nodoc
class __$$MainPageStateImplCopyWithImpl<$Res>
    extends _$MainPageStateCopyWithImpl<$Res, _$MainPageStateImpl>
    implements _$$MainPageStateImplCopyWith<$Res> {
  __$$MainPageStateImplCopyWithImpl(
      _$MainPageStateImpl _value, $Res Function(_$MainPageStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startAnimation = freezed,
    Object? scrollController = freezed,
    Object? isScrolled = null,
    Object? isAnimationEnd = null,
    Object? status = null,
  }) {
    return _then(_$MainPageStateImpl(
      startAnimation: freezed == startAnimation
          ? _value.startAnimation
          : startAnimation // ignore: cast_nullable_to_non_nullable
              as StartAnimation?,
      scrollController: freezed == scrollController
          ? _value.scrollController
          : scrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController?,
      isScrolled: null == isScrolled
          ? _value.isScrolled
          : isScrolled // ignore: cast_nullable_to_non_nullable
              as bool,
      isAnimationEnd: null == isAnimationEnd
          ? _value.isAnimationEnd
          : isAnimationEnd // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MainPageStatus,
    ));
  }
}

/// @nodoc

class _$MainPageStateImpl extends _MainPageState {
  const _$MainPageStateImpl(
      {this.startAnimation,
      this.scrollController,
      this.isScrolled = false,
      this.isAnimationEnd = false,
      this.status = MainPageStatus.initial})
      : super._();

//StartAnimation 컨트롤러
  @override
  final StartAnimation? startAnimation;
//스크롤 컨트롤러
  @override
  final ScrollController? scrollController;
  @override
  @JsonKey()
  final bool isScrolled;
  @override
  @JsonKey()
  final bool isAnimationEnd;
  @override
  @JsonKey()
  final MainPageStatus status;

  @override
  String toString() {
    return 'MainPageState(startAnimation: $startAnimation, scrollController: $scrollController, isScrolled: $isScrolled, isAnimationEnd: $isAnimationEnd, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainPageStateImpl &&
            (identical(other.startAnimation, startAnimation) ||
                other.startAnimation == startAnimation) &&
            (identical(other.scrollController, scrollController) ||
                other.scrollController == scrollController) &&
            (identical(other.isScrolled, isScrolled) ||
                other.isScrolled == isScrolled) &&
            (identical(other.isAnimationEnd, isAnimationEnd) ||
                other.isAnimationEnd == isAnimationEnd) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startAnimation, scrollController,
      isScrolled, isAnimationEnd, status);

  /// Create a copy of MainPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MainPageStateImplCopyWith<_$MainPageStateImpl> get copyWith =>
      __$$MainPageStateImplCopyWithImpl<_$MainPageStateImpl>(this, _$identity);
}

abstract class _MainPageState extends MainPageState {
  const factory _MainPageState(
      {final StartAnimation? startAnimation,
      final ScrollController? scrollController,
      final bool isScrolled,
      final bool isAnimationEnd,
      final MainPageStatus status}) = _$MainPageStateImpl;
  const _MainPageState._() : super._();

//StartAnimation 컨트롤러
  @override
  StartAnimation? get startAnimation; //스크롤 컨트롤러
  @override
  ScrollController? get scrollController;
  @override
  bool get isScrolled;
  @override
  bool get isAnimationEnd;
  @override
  MainPageStatus get status;

  /// Create a copy of MainPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MainPageStateImplCopyWith<_$MainPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
