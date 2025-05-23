// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'description_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DescriptionModel {
  IntroDescriptionState get introDescriptionState =>
      throw _privateConstructorUsedError; //--------------------------------
  BannerDescriptionState get bannerDescriptionState =>
      throw _privateConstructorUsedError; //--------------------------------
  ProfileDescriptionState get profileDescriptionState =>
      throw _privateConstructorUsedError; //--------------------------------
  SkillDescriptionState get skillDescriptionState =>
      throw _privateConstructorUsedError;

  /// Create a copy of DescriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DescriptionModelCopyWith<DescriptionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DescriptionModelCopyWith<$Res> {
  factory $DescriptionModelCopyWith(
    DescriptionModel value,
    $Res Function(DescriptionModel) then,
  ) = _$DescriptionModelCopyWithImpl<$Res, DescriptionModel>;
  @useResult
  $Res call({
    IntroDescriptionState introDescriptionState,
    BannerDescriptionState bannerDescriptionState,
    ProfileDescriptionState profileDescriptionState,
    SkillDescriptionState skillDescriptionState,
  });
}

/// @nodoc
class _$DescriptionModelCopyWithImpl<$Res, $Val extends DescriptionModel>
    implements $DescriptionModelCopyWith<$Res> {
  _$DescriptionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DescriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? introDescriptionState = null,
    Object? bannerDescriptionState = null,
    Object? profileDescriptionState = null,
    Object? skillDescriptionState = null,
  }) {
    return _then(
      _value.copyWith(
            introDescriptionState:
                null == introDescriptionState
                    ? _value.introDescriptionState
                    : introDescriptionState // ignore: cast_nullable_to_non_nullable
                        as IntroDescriptionState,
            bannerDescriptionState:
                null == bannerDescriptionState
                    ? _value.bannerDescriptionState
                    : bannerDescriptionState // ignore: cast_nullable_to_non_nullable
                        as BannerDescriptionState,
            profileDescriptionState:
                null == profileDescriptionState
                    ? _value.profileDescriptionState
                    : profileDescriptionState // ignore: cast_nullable_to_non_nullable
                        as ProfileDescriptionState,
            skillDescriptionState:
                null == skillDescriptionState
                    ? _value.skillDescriptionState
                    : skillDescriptionState // ignore: cast_nullable_to_non_nullable
                        as SkillDescriptionState,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DescriptionModelImplCopyWith<$Res>
    implements $DescriptionModelCopyWith<$Res> {
  factory _$$DescriptionModelImplCopyWith(
    _$DescriptionModelImpl value,
    $Res Function(_$DescriptionModelImpl) then,
  ) = __$$DescriptionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    IntroDescriptionState introDescriptionState,
    BannerDescriptionState bannerDescriptionState,
    ProfileDescriptionState profileDescriptionState,
    SkillDescriptionState skillDescriptionState,
  });
}

/// @nodoc
class __$$DescriptionModelImplCopyWithImpl<$Res>
    extends _$DescriptionModelCopyWithImpl<$Res, _$DescriptionModelImpl>
    implements _$$DescriptionModelImplCopyWith<$Res> {
  __$$DescriptionModelImplCopyWithImpl(
    _$DescriptionModelImpl _value,
    $Res Function(_$DescriptionModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DescriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? introDescriptionState = null,
    Object? bannerDescriptionState = null,
    Object? profileDescriptionState = null,
    Object? skillDescriptionState = null,
  }) {
    return _then(
      _$DescriptionModelImpl(
        introDescriptionState:
            null == introDescriptionState
                ? _value.introDescriptionState
                : introDescriptionState // ignore: cast_nullable_to_non_nullable
                    as IntroDescriptionState,
        bannerDescriptionState:
            null == bannerDescriptionState
                ? _value.bannerDescriptionState
                : bannerDescriptionState // ignore: cast_nullable_to_non_nullable
                    as BannerDescriptionState,
        profileDescriptionState:
            null == profileDescriptionState
                ? _value.profileDescriptionState
                : profileDescriptionState // ignore: cast_nullable_to_non_nullable
                    as ProfileDescriptionState,
        skillDescriptionState:
            null == skillDescriptionState
                ? _value.skillDescriptionState
                : skillDescriptionState // ignore: cast_nullable_to_non_nullable
                    as SkillDescriptionState,
      ),
    );
  }
}

/// @nodoc

class _$DescriptionModelImpl implements _DescriptionModel {
  const _$DescriptionModelImpl({
    this.introDescriptionState = IntroDescriptionState.inactive,
    this.bannerDescriptionState = BannerDescriptionState.inactive,
    this.profileDescriptionState = ProfileDescriptionState.inactive,
    this.skillDescriptionState = SkillDescriptionState.inactive,
  });

  @override
  @JsonKey()
  final IntroDescriptionState introDescriptionState;
  //--------------------------------
  @override
  @JsonKey()
  final BannerDescriptionState bannerDescriptionState;
  //--------------------------------
  @override
  @JsonKey()
  final ProfileDescriptionState profileDescriptionState;
  //--------------------------------
  @override
  @JsonKey()
  final SkillDescriptionState skillDescriptionState;

  @override
  String toString() {
    return 'DescriptionModel(introDescriptionState: $introDescriptionState, bannerDescriptionState: $bannerDescriptionState, profileDescriptionState: $profileDescriptionState, skillDescriptionState: $skillDescriptionState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DescriptionModelImpl &&
            (identical(other.introDescriptionState, introDescriptionState) ||
                other.introDescriptionState == introDescriptionState) &&
            (identical(other.bannerDescriptionState, bannerDescriptionState) ||
                other.bannerDescriptionState == bannerDescriptionState) &&
            (identical(
                  other.profileDescriptionState,
                  profileDescriptionState,
                ) ||
                other.profileDescriptionState == profileDescriptionState) &&
            (identical(other.skillDescriptionState, skillDescriptionState) ||
                other.skillDescriptionState == skillDescriptionState));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    introDescriptionState,
    bannerDescriptionState,
    profileDescriptionState,
    skillDescriptionState,
  );

  /// Create a copy of DescriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DescriptionModelImplCopyWith<_$DescriptionModelImpl> get copyWith =>
      __$$DescriptionModelImplCopyWithImpl<_$DescriptionModelImpl>(
        this,
        _$identity,
      );
}

abstract class _DescriptionModel implements DescriptionModel {
  const factory _DescriptionModel({
    final IntroDescriptionState introDescriptionState,
    final BannerDescriptionState bannerDescriptionState,
    final ProfileDescriptionState profileDescriptionState,
    final SkillDescriptionState skillDescriptionState,
  }) = _$DescriptionModelImpl;

  @override
  IntroDescriptionState get introDescriptionState; //--------------------------------
  @override
  BannerDescriptionState get bannerDescriptionState; //--------------------------------
  @override
  ProfileDescriptionState get profileDescriptionState; //--------------------------------
  @override
  SkillDescriptionState get skillDescriptionState;

  /// Create a copy of DescriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DescriptionModelImplCopyWith<_$DescriptionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
