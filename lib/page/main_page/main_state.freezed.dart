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
  StartAnimationModel? get startAnimation =>
      throw _privateConstructorUsedError; //mySkill 모델
  MySkillModel get mySkillModel =>
      throw _privateConstructorUsedError; //DescriptionModel
  DescriptionModel get descriptionModel =>
      throw _privateConstructorUsedError; //ScrollModel
  ScrollModel get scrollModel =>
      throw _privateConstructorUsedError; //ProfileModel
  ProfileModel get profileModel =>
      throw _privateConstructorUsedError; // 프로필 뷰 높이
  double get mainViewHeight => throw _privateConstructorUsedError;
  int get remainingTime => throw _privateConstructorUsedError;

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
      {StartAnimationModel? startAnimation,
      MySkillModel mySkillModel,
      DescriptionModel descriptionModel,
      ScrollModel scrollModel,
      ProfileModel profileModel,
      double mainViewHeight,
      int remainingTime});

  $StartAnimationModelCopyWith<$Res>? get startAnimation;
  $MySkillModelCopyWith<$Res> get mySkillModel;
  $DescriptionModelCopyWith<$Res> get descriptionModel;
  $ScrollModelCopyWith<$Res> get scrollModel;
  $ProfileModelCopyWith<$Res> get profileModel;
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
    Object? mySkillModel = null,
    Object? descriptionModel = null,
    Object? scrollModel = null,
    Object? profileModel = null,
    Object? mainViewHeight = null,
    Object? remainingTime = null,
  }) {
    return _then(_value.copyWith(
      startAnimation: freezed == startAnimation
          ? _value.startAnimation
          : startAnimation // ignore: cast_nullable_to_non_nullable
              as StartAnimationModel?,
      mySkillModel: null == mySkillModel
          ? _value.mySkillModel
          : mySkillModel // ignore: cast_nullable_to_non_nullable
              as MySkillModel,
      descriptionModel: null == descriptionModel
          ? _value.descriptionModel
          : descriptionModel // ignore: cast_nullable_to_non_nullable
              as DescriptionModel,
      scrollModel: null == scrollModel
          ? _value.scrollModel
          : scrollModel // ignore: cast_nullable_to_non_nullable
              as ScrollModel,
      profileModel: null == profileModel
          ? _value.profileModel
          : profileModel // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
      mainViewHeight: null == mainViewHeight
          ? _value.mainViewHeight
          : mainViewHeight // ignore: cast_nullable_to_non_nullable
              as double,
      remainingTime: null == remainingTime
          ? _value.remainingTime
          : remainingTime // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of MainPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StartAnimationModelCopyWith<$Res>? get startAnimation {
    if (_value.startAnimation == null) {
      return null;
    }

    return $StartAnimationModelCopyWith<$Res>(_value.startAnimation!, (value) {
      return _then(_value.copyWith(startAnimation: value) as $Val);
    });
  }

  /// Create a copy of MainPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MySkillModelCopyWith<$Res> get mySkillModel {
    return $MySkillModelCopyWith<$Res>(_value.mySkillModel, (value) {
      return _then(_value.copyWith(mySkillModel: value) as $Val);
    });
  }

  /// Create a copy of MainPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DescriptionModelCopyWith<$Res> get descriptionModel {
    return $DescriptionModelCopyWith<$Res>(_value.descriptionModel, (value) {
      return _then(_value.copyWith(descriptionModel: value) as $Val);
    });
  }

  /// Create a copy of MainPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ScrollModelCopyWith<$Res> get scrollModel {
    return $ScrollModelCopyWith<$Res>(_value.scrollModel, (value) {
      return _then(_value.copyWith(scrollModel: value) as $Val);
    });
  }

  /// Create a copy of MainPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileModelCopyWith<$Res> get profileModel {
    return $ProfileModelCopyWith<$Res>(_value.profileModel, (value) {
      return _then(_value.copyWith(profileModel: value) as $Val);
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
      {StartAnimationModel? startAnimation,
      MySkillModel mySkillModel,
      DescriptionModel descriptionModel,
      ScrollModel scrollModel,
      ProfileModel profileModel,
      double mainViewHeight,
      int remainingTime});

  @override
  $StartAnimationModelCopyWith<$Res>? get startAnimation;
  @override
  $MySkillModelCopyWith<$Res> get mySkillModel;
  @override
  $DescriptionModelCopyWith<$Res> get descriptionModel;
  @override
  $ScrollModelCopyWith<$Res> get scrollModel;
  @override
  $ProfileModelCopyWith<$Res> get profileModel;
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
    Object? mySkillModel = null,
    Object? descriptionModel = null,
    Object? scrollModel = null,
    Object? profileModel = null,
    Object? mainViewHeight = null,
    Object? remainingTime = null,
  }) {
    return _then(_$MainPageStateImpl(
      startAnimation: freezed == startAnimation
          ? _value.startAnimation
          : startAnimation // ignore: cast_nullable_to_non_nullable
              as StartAnimationModel?,
      mySkillModel: null == mySkillModel
          ? _value.mySkillModel
          : mySkillModel // ignore: cast_nullable_to_non_nullable
              as MySkillModel,
      descriptionModel: null == descriptionModel
          ? _value.descriptionModel
          : descriptionModel // ignore: cast_nullable_to_non_nullable
              as DescriptionModel,
      scrollModel: null == scrollModel
          ? _value.scrollModel
          : scrollModel // ignore: cast_nullable_to_non_nullable
              as ScrollModel,
      profileModel: null == profileModel
          ? _value.profileModel
          : profileModel // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
      mainViewHeight: null == mainViewHeight
          ? _value.mainViewHeight
          : mainViewHeight // ignore: cast_nullable_to_non_nullable
              as double,
      remainingTime: null == remainingTime
          ? _value.remainingTime
          : remainingTime // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$MainPageStateImpl implements _MainPageState {
  const _$MainPageStateImpl(
      {this.startAnimation,
      this.mySkillModel = const MySkillModel(),
      this.descriptionModel = const DescriptionModel(),
      this.scrollModel = const ScrollModel(),
      this.profileModel = const ProfileModel(),
      this.mainViewHeight = 0.0,
      this.remainingTime = 0});

//StartAnimation 컨트롤러
  @override
  final StartAnimationModel? startAnimation;
//mySkill 모델
  @override
  @JsonKey()
  final MySkillModel mySkillModel;
//DescriptionModel
  @override
  @JsonKey()
  final DescriptionModel descriptionModel;
//ScrollModel
  @override
  @JsonKey()
  final ScrollModel scrollModel;
//ProfileModel
  @override
  @JsonKey()
  final ProfileModel profileModel;
// 프로필 뷰 높이
  @override
  @JsonKey()
  final double mainViewHeight;
  @override
  @JsonKey()
  final int remainingTime;

  @override
  String toString() {
    return 'MainPageState(startAnimation: $startAnimation, mySkillModel: $mySkillModel, descriptionModel: $descriptionModel, scrollModel: $scrollModel, profileModel: $profileModel, mainViewHeight: $mainViewHeight, remainingTime: $remainingTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainPageStateImpl &&
            (identical(other.startAnimation, startAnimation) ||
                other.startAnimation == startAnimation) &&
            (identical(other.mySkillModel, mySkillModel) ||
                other.mySkillModel == mySkillModel) &&
            (identical(other.descriptionModel, descriptionModel) ||
                other.descriptionModel == descriptionModel) &&
            (identical(other.scrollModel, scrollModel) ||
                other.scrollModel == scrollModel) &&
            (identical(other.profileModel, profileModel) ||
                other.profileModel == profileModel) &&
            (identical(other.mainViewHeight, mainViewHeight) ||
                other.mainViewHeight == mainViewHeight) &&
            (identical(other.remainingTime, remainingTime) ||
                other.remainingTime == remainingTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      startAnimation,
      mySkillModel,
      descriptionModel,
      scrollModel,
      profileModel,
      mainViewHeight,
      remainingTime);

  /// Create a copy of MainPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MainPageStateImplCopyWith<_$MainPageStateImpl> get copyWith =>
      __$$MainPageStateImplCopyWithImpl<_$MainPageStateImpl>(this, _$identity);
}

abstract class _MainPageState implements MainPageState {
  const factory _MainPageState(
      {final StartAnimationModel? startAnimation,
      final MySkillModel mySkillModel,
      final DescriptionModel descriptionModel,
      final ScrollModel scrollModel,
      final ProfileModel profileModel,
      final double mainViewHeight,
      final int remainingTime}) = _$MainPageStateImpl;

//StartAnimation 컨트롤러
  @override
  StartAnimationModel? get startAnimation; //mySkill 모델
  @override
  MySkillModel get mySkillModel; //DescriptionModel
  @override
  DescriptionModel get descriptionModel; //ScrollModel
  @override
  ScrollModel get scrollModel; //ProfileModel
  @override
  ProfileModel get profileModel; // 프로필 뷰 높이
  @override
  double get mainViewHeight;
  @override
  int get remainingTime;

  /// Create a copy of MainPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MainPageStateImplCopyWith<_$MainPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
