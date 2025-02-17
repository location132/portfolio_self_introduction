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
  List<AnimationController> get controllers =>
      throw _privateConstructorUsedError;
  List<Animation<double>> get animations => throw _privateConstructorUsedError;
  List<String> get words => throw _privateConstructorUsedError;
  bool get endAnimation => throw _privateConstructorUsedError; //스크롤 컨트롤러
  ScrollController? get scrollController => throw _privateConstructorUsedError;
  bool get isScrolled => throw _privateConstructorUsedError;
  bool get isAnimationStart => throw _privateConstructorUsedError;
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
      {List<AnimationController> controllers,
      List<Animation<double>> animations,
      List<String> words,
      bool endAnimation,
      ScrollController? scrollController,
      bool isScrolled,
      bool isAnimationStart,
      MainPageStatus status});
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
    Object? controllers = null,
    Object? animations = null,
    Object? words = null,
    Object? endAnimation = null,
    Object? scrollController = freezed,
    Object? isScrolled = null,
    Object? isAnimationStart = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      controllers: null == controllers
          ? _value.controllers
          : controllers // ignore: cast_nullable_to_non_nullable
              as List<AnimationController>,
      animations: null == animations
          ? _value.animations
          : animations // ignore: cast_nullable_to_non_nullable
              as List<Animation<double>>,
      words: null == words
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<String>,
      endAnimation: null == endAnimation
          ? _value.endAnimation
          : endAnimation // ignore: cast_nullable_to_non_nullable
              as bool,
      scrollController: freezed == scrollController
          ? _value.scrollController
          : scrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController?,
      isScrolled: null == isScrolled
          ? _value.isScrolled
          : isScrolled // ignore: cast_nullable_to_non_nullable
              as bool,
      isAnimationStart: null == isAnimationStart
          ? _value.isAnimationStart
          : isAnimationStart // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MainPageStatus,
    ) as $Val);
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
      {List<AnimationController> controllers,
      List<Animation<double>> animations,
      List<String> words,
      bool endAnimation,
      ScrollController? scrollController,
      bool isScrolled,
      bool isAnimationStart,
      MainPageStatus status});
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
    Object? controllers = null,
    Object? animations = null,
    Object? words = null,
    Object? endAnimation = null,
    Object? scrollController = freezed,
    Object? isScrolled = null,
    Object? isAnimationStart = null,
    Object? status = null,
  }) {
    return _then(_$MainPageStateImpl(
      controllers: null == controllers
          ? _value._controllers
          : controllers // ignore: cast_nullable_to_non_nullable
              as List<AnimationController>,
      animations: null == animations
          ? _value._animations
          : animations // ignore: cast_nullable_to_non_nullable
              as List<Animation<double>>,
      words: null == words
          ? _value._words
          : words // ignore: cast_nullable_to_non_nullable
              as List<String>,
      endAnimation: null == endAnimation
          ? _value.endAnimation
          : endAnimation // ignore: cast_nullable_to_non_nullable
              as bool,
      scrollController: freezed == scrollController
          ? _value.scrollController
          : scrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController?,
      isScrolled: null == isScrolled
          ? _value.isScrolled
          : isScrolled // ignore: cast_nullable_to_non_nullable
              as bool,
      isAnimationStart: null == isAnimationStart
          ? _value.isAnimationStart
          : isAnimationStart // ignore: cast_nullable_to_non_nullable
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
      {final List<AnimationController> controllers = const [],
      final List<Animation<double>> animations = const [],
      final List<String> words = const [],
      this.endAnimation = false,
      this.scrollController,
      this.isScrolled = false,
      this.isAnimationStart = false,
      this.status = MainPageStatus.initial})
      : _controllers = controllers,
        _animations = animations,
        _words = words,
        super._();

//StartAnimation 컨트롤러
  final List<AnimationController> _controllers;
//StartAnimation 컨트롤러
  @override
  @JsonKey()
  List<AnimationController> get controllers {
    if (_controllers is EqualUnmodifiableListView) return _controllers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_controllers);
  }

  final List<Animation<double>> _animations;
  @override
  @JsonKey()
  List<Animation<double>> get animations {
    if (_animations is EqualUnmodifiableListView) return _animations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_animations);
  }

  final List<String> _words;
  @override
  @JsonKey()
  List<String> get words {
    if (_words is EqualUnmodifiableListView) return _words;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_words);
  }

  @override
  @JsonKey()
  final bool endAnimation;
//스크롤 컨트롤러
  @override
  final ScrollController? scrollController;
  @override
  @JsonKey()
  final bool isScrolled;
  @override
  @JsonKey()
  final bool isAnimationStart;
  @override
  @JsonKey()
  final MainPageStatus status;

  @override
  String toString() {
    return 'MainPageState(controllers: $controllers, animations: $animations, words: $words, endAnimation: $endAnimation, scrollController: $scrollController, isScrolled: $isScrolled, isAnimationStart: $isAnimationStart, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainPageStateImpl &&
            const DeepCollectionEquality()
                .equals(other._controllers, _controllers) &&
            const DeepCollectionEquality()
                .equals(other._animations, _animations) &&
            const DeepCollectionEquality().equals(other._words, _words) &&
            (identical(other.endAnimation, endAnimation) ||
                other.endAnimation == endAnimation) &&
            (identical(other.scrollController, scrollController) ||
                other.scrollController == scrollController) &&
            (identical(other.isScrolled, isScrolled) ||
                other.isScrolled == isScrolled) &&
            (identical(other.isAnimationStart, isAnimationStart) ||
                other.isAnimationStart == isAnimationStart) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_controllers),
      const DeepCollectionEquality().hash(_animations),
      const DeepCollectionEquality().hash(_words),
      endAnimation,
      scrollController,
      isScrolled,
      isAnimationStart,
      status);

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
      {final List<AnimationController> controllers,
      final List<Animation<double>> animations,
      final List<String> words,
      final bool endAnimation,
      final ScrollController? scrollController,
      final bool isScrolled,
      final bool isAnimationStart,
      final MainPageStatus status}) = _$MainPageStateImpl;
  const _MainPageState._() : super._();

//StartAnimation 컨트롤러
  @override
  List<AnimationController> get controllers;
  @override
  List<Animation<double>> get animations;
  @override
  List<String> get words;
  @override
  bool get endAnimation; //스크롤 컨트롤러
  @override
  ScrollController? get scrollController;
  @override
  bool get isScrolled;
  @override
  bool get isAnimationStart;
  @override
  MainPageStatus get status;

  /// Create a copy of MainPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MainPageStateImplCopyWith<_$MainPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
