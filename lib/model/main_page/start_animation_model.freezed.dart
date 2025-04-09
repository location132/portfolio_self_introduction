// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'start_animation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StartAnimationModel {
  List<AnimationController> get controllers =>
      throw _privateConstructorUsedError;
  List<Animation<double>> get animations => throw _privateConstructorUsedError;
  List<String> get words => throw _privateConstructorUsedError;
  bool get endAnimation => throw _privateConstructorUsedError;
  TextConstants? get textConstants => throw _privateConstructorUsedError;

  /// Create a copy of StartAnimationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StartAnimationModelCopyWith<StartAnimationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartAnimationModelCopyWith<$Res> {
  factory $StartAnimationModelCopyWith(
          StartAnimationModel value, $Res Function(StartAnimationModel) then) =
      _$StartAnimationModelCopyWithImpl<$Res, StartAnimationModel>;
  @useResult
  $Res call(
      {List<AnimationController> controllers,
      List<Animation<double>> animations,
      List<String> words,
      bool endAnimation,
      TextConstants? textConstants});
}

/// @nodoc
class _$StartAnimationModelCopyWithImpl<$Res, $Val extends StartAnimationModel>
    implements $StartAnimationModelCopyWith<$Res> {
  _$StartAnimationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StartAnimationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controllers = null,
    Object? animations = null,
    Object? words = null,
    Object? endAnimation = null,
    Object? textConstants = freezed,
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
      textConstants: freezed == textConstants
          ? _value.textConstants
          : textConstants // ignore: cast_nullable_to_non_nullable
              as TextConstants?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StartAnimationModelImplCopyWith<$Res>
    implements $StartAnimationModelCopyWith<$Res> {
  factory _$$StartAnimationModelImplCopyWith(_$StartAnimationModelImpl value,
          $Res Function(_$StartAnimationModelImpl) then) =
      __$$StartAnimationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<AnimationController> controllers,
      List<Animation<double>> animations,
      List<String> words,
      bool endAnimation,
      TextConstants? textConstants});
}

/// @nodoc
class __$$StartAnimationModelImplCopyWithImpl<$Res>
    extends _$StartAnimationModelCopyWithImpl<$Res, _$StartAnimationModelImpl>
    implements _$$StartAnimationModelImplCopyWith<$Res> {
  __$$StartAnimationModelImplCopyWithImpl(_$StartAnimationModelImpl _value,
      $Res Function(_$StartAnimationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StartAnimationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controllers = null,
    Object? animations = null,
    Object? words = null,
    Object? endAnimation = null,
    Object? textConstants = freezed,
  }) {
    return _then(_$StartAnimationModelImpl(
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
      textConstants: freezed == textConstants
          ? _value.textConstants
          : textConstants // ignore: cast_nullable_to_non_nullable
              as TextConstants?,
    ));
  }
}

/// @nodoc

class _$StartAnimationModelImpl implements _StartAnimationModel {
  const _$StartAnimationModelImpl(
      {final List<AnimationController> controllers = const [],
      final List<Animation<double>> animations = const [],
      final List<String> words = const [],
      this.endAnimation = false,
      this.textConstants})
      : _controllers = controllers,
        _animations = animations,
        _words = words;

  final List<AnimationController> _controllers;
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
  @override
  final TextConstants? textConstants;

  @override
  String toString() {
    return 'StartAnimationModel(controllers: $controllers, animations: $animations, words: $words, endAnimation: $endAnimation, textConstants: $textConstants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartAnimationModelImpl &&
            const DeepCollectionEquality()
                .equals(other._controllers, _controllers) &&
            const DeepCollectionEquality()
                .equals(other._animations, _animations) &&
            const DeepCollectionEquality().equals(other._words, _words) &&
            (identical(other.endAnimation, endAnimation) ||
                other.endAnimation == endAnimation) &&
            (identical(other.textConstants, textConstants) ||
                other.textConstants == textConstants));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_controllers),
      const DeepCollectionEquality().hash(_animations),
      const DeepCollectionEquality().hash(_words),
      endAnimation,
      textConstants);

  /// Create a copy of StartAnimationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StartAnimationModelImplCopyWith<_$StartAnimationModelImpl> get copyWith =>
      __$$StartAnimationModelImplCopyWithImpl<_$StartAnimationModelImpl>(
          this, _$identity);
}

abstract class _StartAnimationModel implements StartAnimationModel {
  const factory _StartAnimationModel(
      {final List<AnimationController> controllers,
      final List<Animation<double>> animations,
      final List<String> words,
      final bool endAnimation,
      final TextConstants? textConstants}) = _$StartAnimationModelImpl;

  @override
  List<AnimationController> get controllers;
  @override
  List<Animation<double>> get animations;
  @override
  List<String> get words;
  @override
  bool get endAnimation;
  @override
  TextConstants? get textConstants;

  /// Create a copy of StartAnimationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StartAnimationModelImplCopyWith<_$StartAnimationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
