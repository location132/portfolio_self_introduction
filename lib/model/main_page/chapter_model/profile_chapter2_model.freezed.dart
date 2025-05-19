// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_chapter2_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileChapter2Model {
  bool get isTextPartReverseActive => throw _privateConstructorUsedError;
  bool get isImagePartReverseActive => throw _privateConstructorUsedError;

  /// Create a copy of ProfileChapter2Model
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileChapter2ModelCopyWith<ProfileChapter2Model> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileChapter2ModelCopyWith<$Res> {
  factory $ProfileChapter2ModelCopyWith(ProfileChapter2Model value,
          $Res Function(ProfileChapter2Model) then) =
      _$ProfileChapter2ModelCopyWithImpl<$Res, ProfileChapter2Model>;
  @useResult
  $Res call({bool isTextPartReverseActive, bool isImagePartReverseActive});
}

/// @nodoc
class _$ProfileChapter2ModelCopyWithImpl<$Res,
        $Val extends ProfileChapter2Model>
    implements $ProfileChapter2ModelCopyWith<$Res> {
  _$ProfileChapter2ModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileChapter2Model
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isTextPartReverseActive = null,
    Object? isImagePartReverseActive = null,
  }) {
    return _then(_value.copyWith(
      isTextPartReverseActive: null == isTextPartReverseActive
          ? _value.isTextPartReverseActive
          : isTextPartReverseActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isImagePartReverseActive: null == isImagePartReverseActive
          ? _value.isImagePartReverseActive
          : isImagePartReverseActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileChapter2ModelImplCopyWith<$Res>
    implements $ProfileChapter2ModelCopyWith<$Res> {
  factory _$$ProfileChapter2ModelImplCopyWith(_$ProfileChapter2ModelImpl value,
          $Res Function(_$ProfileChapter2ModelImpl) then) =
      __$$ProfileChapter2ModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isTextPartReverseActive, bool isImagePartReverseActive});
}

/// @nodoc
class __$$ProfileChapter2ModelImplCopyWithImpl<$Res>
    extends _$ProfileChapter2ModelCopyWithImpl<$Res, _$ProfileChapter2ModelImpl>
    implements _$$ProfileChapter2ModelImplCopyWith<$Res> {
  __$$ProfileChapter2ModelImplCopyWithImpl(_$ProfileChapter2ModelImpl _value,
      $Res Function(_$ProfileChapter2ModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileChapter2Model
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isTextPartReverseActive = null,
    Object? isImagePartReverseActive = null,
  }) {
    return _then(_$ProfileChapter2ModelImpl(
      isTextPartReverseActive: null == isTextPartReverseActive
          ? _value.isTextPartReverseActive
          : isTextPartReverseActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isImagePartReverseActive: null == isImagePartReverseActive
          ? _value.isImagePartReverseActive
          : isImagePartReverseActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ProfileChapter2ModelImpl implements _ProfileChapter2Model {
  const _$ProfileChapter2ModelImpl(
      {this.isTextPartReverseActive = false,
      this.isImagePartReverseActive = false});

  @override
  @JsonKey()
  final bool isTextPartReverseActive;
  @override
  @JsonKey()
  final bool isImagePartReverseActive;

  @override
  String toString() {
    return 'ProfileChapter2Model(isTextPartReverseActive: $isTextPartReverseActive, isImagePartReverseActive: $isImagePartReverseActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileChapter2ModelImpl &&
            (identical(
                    other.isTextPartReverseActive, isTextPartReverseActive) ||
                other.isTextPartReverseActive == isTextPartReverseActive) &&
            (identical(
                    other.isImagePartReverseActive, isImagePartReverseActive) ||
                other.isImagePartReverseActive == isImagePartReverseActive));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isTextPartReverseActive, isImagePartReverseActive);

  /// Create a copy of ProfileChapter2Model
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileChapter2ModelImplCopyWith<_$ProfileChapter2ModelImpl>
      get copyWith =>
          __$$ProfileChapter2ModelImplCopyWithImpl<_$ProfileChapter2ModelImpl>(
              this, _$identity);
}

abstract class _ProfileChapter2Model implements ProfileChapter2Model {
  const factory _ProfileChapter2Model(
      {final bool isTextPartReverseActive,
      final bool isImagePartReverseActive}) = _$ProfileChapter2ModelImpl;

  @override
  bool get isTextPartReverseActive;
  @override
  bool get isImagePartReverseActive;

  /// Create a copy of ProfileChapter2Model
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileChapter2ModelImplCopyWith<_$ProfileChapter2ModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
