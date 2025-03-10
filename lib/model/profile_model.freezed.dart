// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileViewModel {
  ProfileViewStatus get status => throw _privateConstructorUsedError;
  bool get isProfileCard => throw _privateConstructorUsedError;
  bool get animationStart => throw _privateConstructorUsedError;
  bool get aboutSection1 => throw _privateConstructorUsedError;
  bool get aboutSection2 => throw _privateConstructorUsedError;
  bool get aboutSection3 => throw _privateConstructorUsedError;

  /// Create a copy of ProfileViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileViewModelCopyWith<ProfileViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileViewModelCopyWith<$Res> {
  factory $ProfileViewModelCopyWith(
          ProfileViewModel value, $Res Function(ProfileViewModel) then) =
      _$ProfileViewModelCopyWithImpl<$Res, ProfileViewModel>;
  @useResult
  $Res call(
      {ProfileViewStatus status,
      bool isProfileCard,
      bool animationStart,
      bool aboutSection1,
      bool aboutSection2,
      bool aboutSection3});
}

/// @nodoc
class _$ProfileViewModelCopyWithImpl<$Res, $Val extends ProfileViewModel>
    implements $ProfileViewModelCopyWith<$Res> {
  _$ProfileViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? isProfileCard = null,
    Object? animationStart = null,
    Object? aboutSection1 = null,
    Object? aboutSection2 = null,
    Object? aboutSection3 = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProfileViewStatus,
      isProfileCard: null == isProfileCard
          ? _value.isProfileCard
          : isProfileCard // ignore: cast_nullable_to_non_nullable
              as bool,
      animationStart: null == animationStart
          ? _value.animationStart
          : animationStart // ignore: cast_nullable_to_non_nullable
              as bool,
      aboutSection1: null == aboutSection1
          ? _value.aboutSection1
          : aboutSection1 // ignore: cast_nullable_to_non_nullable
              as bool,
      aboutSection2: null == aboutSection2
          ? _value.aboutSection2
          : aboutSection2 // ignore: cast_nullable_to_non_nullable
              as bool,
      aboutSection3: null == aboutSection3
          ? _value.aboutSection3
          : aboutSection3 // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileViewModelImplCopyWith<$Res>
    implements $ProfileViewModelCopyWith<$Res> {
  factory _$$ProfileViewModelImplCopyWith(_$ProfileViewModelImpl value,
          $Res Function(_$ProfileViewModelImpl) then) =
      __$$ProfileViewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ProfileViewStatus status,
      bool isProfileCard,
      bool animationStart,
      bool aboutSection1,
      bool aboutSection2,
      bool aboutSection3});
}

/// @nodoc
class __$$ProfileViewModelImplCopyWithImpl<$Res>
    extends _$ProfileViewModelCopyWithImpl<$Res, _$ProfileViewModelImpl>
    implements _$$ProfileViewModelImplCopyWith<$Res> {
  __$$ProfileViewModelImplCopyWithImpl(_$ProfileViewModelImpl _value,
      $Res Function(_$ProfileViewModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? isProfileCard = null,
    Object? animationStart = null,
    Object? aboutSection1 = null,
    Object? aboutSection2 = null,
    Object? aboutSection3 = null,
  }) {
    return _then(_$ProfileViewModelImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProfileViewStatus,
      isProfileCard: null == isProfileCard
          ? _value.isProfileCard
          : isProfileCard // ignore: cast_nullable_to_non_nullable
              as bool,
      animationStart: null == animationStart
          ? _value.animationStart
          : animationStart // ignore: cast_nullable_to_non_nullable
              as bool,
      aboutSection1: null == aboutSection1
          ? _value.aboutSection1
          : aboutSection1 // ignore: cast_nullable_to_non_nullable
              as bool,
      aboutSection2: null == aboutSection2
          ? _value.aboutSection2
          : aboutSection2 // ignore: cast_nullable_to_non_nullable
              as bool,
      aboutSection3: null == aboutSection3
          ? _value.aboutSection3
          : aboutSection3 // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ProfileViewModelImpl implements _ProfileViewModel {
  const _$ProfileViewModelImpl(
      {this.status = ProfileViewStatus.init,
      this.isProfileCard = false,
      this.animationStart = false,
      this.aboutSection1 = false,
      this.aboutSection2 = false,
      this.aboutSection3 = false});

  @override
  @JsonKey()
  final ProfileViewStatus status;
  @override
  @JsonKey()
  final bool isProfileCard;
  @override
  @JsonKey()
  final bool animationStart;
  @override
  @JsonKey()
  final bool aboutSection1;
  @override
  @JsonKey()
  final bool aboutSection2;
  @override
  @JsonKey()
  final bool aboutSection3;

  @override
  String toString() {
    return 'ProfileViewModel(status: $status, isProfileCard: $isProfileCard, animationStart: $animationStart, aboutSection1: $aboutSection1, aboutSection2: $aboutSection2, aboutSection3: $aboutSection3)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileViewModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isProfileCard, isProfileCard) ||
                other.isProfileCard == isProfileCard) &&
            (identical(other.animationStart, animationStart) ||
                other.animationStart == animationStart) &&
            (identical(other.aboutSection1, aboutSection1) ||
                other.aboutSection1 == aboutSection1) &&
            (identical(other.aboutSection2, aboutSection2) ||
                other.aboutSection2 == aboutSection2) &&
            (identical(other.aboutSection3, aboutSection3) ||
                other.aboutSection3 == aboutSection3));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, isProfileCard,
      animationStart, aboutSection1, aboutSection2, aboutSection3);

  /// Create a copy of ProfileViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileViewModelImplCopyWith<_$ProfileViewModelImpl> get copyWith =>
      __$$ProfileViewModelImplCopyWithImpl<_$ProfileViewModelImpl>(
          this, _$identity);
}

abstract class _ProfileViewModel implements ProfileViewModel {
  const factory _ProfileViewModel(
      {final ProfileViewStatus status,
      final bool isProfileCard,
      final bool animationStart,
      final bool aboutSection1,
      final bool aboutSection2,
      final bool aboutSection3}) = _$ProfileViewModelImpl;

  @override
  ProfileViewStatus get status;
  @override
  bool get isProfileCard;
  @override
  bool get animationStart;
  @override
  bool get aboutSection1;
  @override
  bool get aboutSection2;
  @override
  bool get aboutSection3;

  /// Create a copy of ProfileViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileViewModelImplCopyWith<_$ProfileViewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
