// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scroll_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ScrollModel {
  BannerState get bannerState => throw _privateConstructorUsedError;
  ProfileViewState get profileViewState => throw _privateConstructorUsedError;

  /// Create a copy of ScrollModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScrollModelCopyWith<ScrollModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScrollModelCopyWith<$Res> {
  factory $ScrollModelCopyWith(
          ScrollModel value, $Res Function(ScrollModel) then) =
      _$ScrollModelCopyWithImpl<$Res, ScrollModel>;
  @useResult
  $Res call({BannerState bannerState, ProfileViewState profileViewState});
}

/// @nodoc
class _$ScrollModelCopyWithImpl<$Res, $Val extends ScrollModel>
    implements $ScrollModelCopyWith<$Res> {
  _$ScrollModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScrollModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bannerState = null,
    Object? profileViewState = null,
  }) {
    return _then(_value.copyWith(
      bannerState: null == bannerState
          ? _value.bannerState
          : bannerState // ignore: cast_nullable_to_non_nullable
              as BannerState,
      profileViewState: null == profileViewState
          ? _value.profileViewState
          : profileViewState // ignore: cast_nullable_to_non_nullable
              as ProfileViewState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScrollModelImplCopyWith<$Res>
    implements $ScrollModelCopyWith<$Res> {
  factory _$$ScrollModelImplCopyWith(
          _$ScrollModelImpl value, $Res Function(_$ScrollModelImpl) then) =
      __$$ScrollModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BannerState bannerState, ProfileViewState profileViewState});
}

/// @nodoc
class __$$ScrollModelImplCopyWithImpl<$Res>
    extends _$ScrollModelCopyWithImpl<$Res, _$ScrollModelImpl>
    implements _$$ScrollModelImplCopyWith<$Res> {
  __$$ScrollModelImplCopyWithImpl(
      _$ScrollModelImpl _value, $Res Function(_$ScrollModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScrollModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bannerState = null,
    Object? profileViewState = null,
  }) {
    return _then(_$ScrollModelImpl(
      bannerState: null == bannerState
          ? _value.bannerState
          : bannerState // ignore: cast_nullable_to_non_nullable
              as BannerState,
      profileViewState: null == profileViewState
          ? _value.profileViewState
          : profileViewState // ignore: cast_nullable_to_non_nullable
              as ProfileViewState,
    ));
  }
}

/// @nodoc

class _$ScrollModelImpl implements _ScrollModel {
  const _$ScrollModelImpl(
      {this.bannerState = BannerState.inactive,
      this.profileViewState = ProfileViewState.inactive});

  @override
  @JsonKey()
  final BannerState bannerState;
  @override
  @JsonKey()
  final ProfileViewState profileViewState;

  @override
  String toString() {
    return 'ScrollModel(bannerState: $bannerState, profileViewState: $profileViewState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScrollModelImpl &&
            (identical(other.bannerState, bannerState) ||
                other.bannerState == bannerState) &&
            (identical(other.profileViewState, profileViewState) ||
                other.profileViewState == profileViewState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bannerState, profileViewState);

  /// Create a copy of ScrollModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScrollModelImplCopyWith<_$ScrollModelImpl> get copyWith =>
      __$$ScrollModelImplCopyWithImpl<_$ScrollModelImpl>(this, _$identity);
}

abstract class _ScrollModel implements ScrollModel {
  const factory _ScrollModel(
      {final BannerState bannerState,
      final ProfileViewState profileViewState}) = _$ScrollModelImpl;

  @override
  BannerState get bannerState;
  @override
  ProfileViewState get profileViewState;

  /// Create a copy of ScrollModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScrollModelImplCopyWith<_$ScrollModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
