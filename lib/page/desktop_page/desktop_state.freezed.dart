// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'desktop_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DesktopState {
  //StartAnimation 컨트롤러
  StartAnimationModel? get startAnimation =>
      throw _privateConstructorUsedError; //BannerModel
  BannerModel get bannerModel =>
      throw _privateConstructorUsedError; //mySkill 모델
  MySkillModel get mySkillModel =>
      throw _privateConstructorUsedError; //ChapterModel
  ChapterModel get chapterModel =>
      throw _privateConstructorUsedError; //ScrollModel
  ScrollModel get scrollModel => throw _privateConstructorUsedError; //InitModel
  InitModel get initModel => throw _privateConstructorUsedError; //DetailMeModel
  DetailMeModel get detailMeModel =>
      throw _privateConstructorUsedError; //ProjectModel
  ProjectModel get projectModel => throw _privateConstructorUsedError;

  /// Create a copy of DesktopState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DesktopStateCopyWith<DesktopState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DesktopStateCopyWith<$Res> {
  factory $DesktopStateCopyWith(
    DesktopState value,
    $Res Function(DesktopState) then,
  ) = _$DesktopStateCopyWithImpl<$Res, DesktopState>;
  @useResult
  $Res call({
    StartAnimationModel? startAnimation,
    BannerModel bannerModel,
    MySkillModel mySkillModel,
    ChapterModel chapterModel,
    ScrollModel scrollModel,
    InitModel initModel,
    DetailMeModel detailMeModel,
    ProjectModel projectModel,
  });

  $StartAnimationModelCopyWith<$Res>? get startAnimation;
  $BannerModelCopyWith<$Res> get bannerModel;
  $MySkillModelCopyWith<$Res> get mySkillModel;
  $ChapterModelCopyWith<$Res> get chapterModel;
  $ScrollModelCopyWith<$Res> get scrollModel;
  $InitModelCopyWith<$Res> get initModel;
  $DetailMeModelCopyWith<$Res> get detailMeModel;
  $ProjectModelCopyWith<$Res> get projectModel;
}

/// @nodoc
class _$DesktopStateCopyWithImpl<$Res, $Val extends DesktopState>
    implements $DesktopStateCopyWith<$Res> {
  _$DesktopStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DesktopState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startAnimation = freezed,
    Object? bannerModel = null,
    Object? mySkillModel = null,
    Object? chapterModel = null,
    Object? scrollModel = null,
    Object? initModel = null,
    Object? detailMeModel = null,
    Object? projectModel = null,
  }) {
    return _then(
      _value.copyWith(
            startAnimation:
                freezed == startAnimation
                    ? _value.startAnimation
                    : startAnimation // ignore: cast_nullable_to_non_nullable
                        as StartAnimationModel?,
            bannerModel:
                null == bannerModel
                    ? _value.bannerModel
                    : bannerModel // ignore: cast_nullable_to_non_nullable
                        as BannerModel,
            mySkillModel:
                null == mySkillModel
                    ? _value.mySkillModel
                    : mySkillModel // ignore: cast_nullable_to_non_nullable
                        as MySkillModel,
            chapterModel:
                null == chapterModel
                    ? _value.chapterModel
                    : chapterModel // ignore: cast_nullable_to_non_nullable
                        as ChapterModel,
            scrollModel:
                null == scrollModel
                    ? _value.scrollModel
                    : scrollModel // ignore: cast_nullable_to_non_nullable
                        as ScrollModel,
            initModel:
                null == initModel
                    ? _value.initModel
                    : initModel // ignore: cast_nullable_to_non_nullable
                        as InitModel,
            detailMeModel:
                null == detailMeModel
                    ? _value.detailMeModel
                    : detailMeModel // ignore: cast_nullable_to_non_nullable
                        as DetailMeModel,
            projectModel:
                null == projectModel
                    ? _value.projectModel
                    : projectModel // ignore: cast_nullable_to_non_nullable
                        as ProjectModel,
          )
          as $Val,
    );
  }

  /// Create a copy of DesktopState
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

  /// Create a copy of DesktopState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BannerModelCopyWith<$Res> get bannerModel {
    return $BannerModelCopyWith<$Res>(_value.bannerModel, (value) {
      return _then(_value.copyWith(bannerModel: value) as $Val);
    });
  }

  /// Create a copy of DesktopState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MySkillModelCopyWith<$Res> get mySkillModel {
    return $MySkillModelCopyWith<$Res>(_value.mySkillModel, (value) {
      return _then(_value.copyWith(mySkillModel: value) as $Val);
    });
  }

  /// Create a copy of DesktopState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChapterModelCopyWith<$Res> get chapterModel {
    return $ChapterModelCopyWith<$Res>(_value.chapterModel, (value) {
      return _then(_value.copyWith(chapterModel: value) as $Val);
    });
  }

  /// Create a copy of DesktopState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ScrollModelCopyWith<$Res> get scrollModel {
    return $ScrollModelCopyWith<$Res>(_value.scrollModel, (value) {
      return _then(_value.copyWith(scrollModel: value) as $Val);
    });
  }

  /// Create a copy of DesktopState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InitModelCopyWith<$Res> get initModel {
    return $InitModelCopyWith<$Res>(_value.initModel, (value) {
      return _then(_value.copyWith(initModel: value) as $Val);
    });
  }

  /// Create a copy of DesktopState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DetailMeModelCopyWith<$Res> get detailMeModel {
    return $DetailMeModelCopyWith<$Res>(_value.detailMeModel, (value) {
      return _then(_value.copyWith(detailMeModel: value) as $Val);
    });
  }

  /// Create a copy of DesktopState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProjectModelCopyWith<$Res> get projectModel {
    return $ProjectModelCopyWith<$Res>(_value.projectModel, (value) {
      return _then(_value.copyWith(projectModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DesktopStateImplCopyWith<$Res>
    implements $DesktopStateCopyWith<$Res> {
  factory _$$DesktopStateImplCopyWith(
    _$DesktopStateImpl value,
    $Res Function(_$DesktopStateImpl) then,
  ) = __$$DesktopStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    StartAnimationModel? startAnimation,
    BannerModel bannerModel,
    MySkillModel mySkillModel,
    ChapterModel chapterModel,
    ScrollModel scrollModel,
    InitModel initModel,
    DetailMeModel detailMeModel,
    ProjectModel projectModel,
  });

  @override
  $StartAnimationModelCopyWith<$Res>? get startAnimation;
  @override
  $BannerModelCopyWith<$Res> get bannerModel;
  @override
  $MySkillModelCopyWith<$Res> get mySkillModel;
  @override
  $ChapterModelCopyWith<$Res> get chapterModel;
  @override
  $ScrollModelCopyWith<$Res> get scrollModel;
  @override
  $InitModelCopyWith<$Res> get initModel;
  @override
  $DetailMeModelCopyWith<$Res> get detailMeModel;
  @override
  $ProjectModelCopyWith<$Res> get projectModel;
}

/// @nodoc
class __$$DesktopStateImplCopyWithImpl<$Res>
    extends _$DesktopStateCopyWithImpl<$Res, _$DesktopStateImpl>
    implements _$$DesktopStateImplCopyWith<$Res> {
  __$$DesktopStateImplCopyWithImpl(
    _$DesktopStateImpl _value,
    $Res Function(_$DesktopStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DesktopState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startAnimation = freezed,
    Object? bannerModel = null,
    Object? mySkillModel = null,
    Object? chapterModel = null,
    Object? scrollModel = null,
    Object? initModel = null,
    Object? detailMeModel = null,
    Object? projectModel = null,
  }) {
    return _then(
      _$DesktopStateImpl(
        startAnimation:
            freezed == startAnimation
                ? _value.startAnimation
                : startAnimation // ignore: cast_nullable_to_non_nullable
                    as StartAnimationModel?,
        bannerModel:
            null == bannerModel
                ? _value.bannerModel
                : bannerModel // ignore: cast_nullable_to_non_nullable
                    as BannerModel,
        mySkillModel:
            null == mySkillModel
                ? _value.mySkillModel
                : mySkillModel // ignore: cast_nullable_to_non_nullable
                    as MySkillModel,
        chapterModel:
            null == chapterModel
                ? _value.chapterModel
                : chapterModel // ignore: cast_nullable_to_non_nullable
                    as ChapterModel,
        scrollModel:
            null == scrollModel
                ? _value.scrollModel
                : scrollModel // ignore: cast_nullable_to_non_nullable
                    as ScrollModel,
        initModel:
            null == initModel
                ? _value.initModel
                : initModel // ignore: cast_nullable_to_non_nullable
                    as InitModel,
        detailMeModel:
            null == detailMeModel
                ? _value.detailMeModel
                : detailMeModel // ignore: cast_nullable_to_non_nullable
                    as DetailMeModel,
        projectModel:
            null == projectModel
                ? _value.projectModel
                : projectModel // ignore: cast_nullable_to_non_nullable
                    as ProjectModel,
      ),
    );
  }
}

/// @nodoc

class _$DesktopStateImpl implements _DesktopState {
  const _$DesktopStateImpl({
    this.startAnimation,
    this.bannerModel = const BannerModel(),
    this.mySkillModel = const MySkillModel(),
    this.chapterModel = const ChapterModel(),
    this.scrollModel = const ScrollModel(),
    this.initModel = const InitModel(),
    this.detailMeModel = const DetailMeModel(),
    this.projectModel = const ProjectModel(),
  });

  //StartAnimation 컨트롤러
  @override
  final StartAnimationModel? startAnimation;
  //BannerModel
  @override
  @JsonKey()
  final BannerModel bannerModel;
  //mySkill 모델
  @override
  @JsonKey()
  final MySkillModel mySkillModel;
  //ChapterModel
  @override
  @JsonKey()
  final ChapterModel chapterModel;
  //ScrollModel
  @override
  @JsonKey()
  final ScrollModel scrollModel;
  //InitModel
  @override
  @JsonKey()
  final InitModel initModel;
  //DetailMeModel
  @override
  @JsonKey()
  final DetailMeModel detailMeModel;
  //ProjectModel
  @override
  @JsonKey()
  final ProjectModel projectModel;

  @override
  String toString() {
    return 'DesktopState(startAnimation: $startAnimation, bannerModel: $bannerModel, mySkillModel: $mySkillModel, chapterModel: $chapterModel, scrollModel: $scrollModel, initModel: $initModel, detailMeModel: $detailMeModel, projectModel: $projectModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DesktopStateImpl &&
            (identical(other.startAnimation, startAnimation) ||
                other.startAnimation == startAnimation) &&
            (identical(other.bannerModel, bannerModel) ||
                other.bannerModel == bannerModel) &&
            (identical(other.mySkillModel, mySkillModel) ||
                other.mySkillModel == mySkillModel) &&
            (identical(other.chapterModel, chapterModel) ||
                other.chapterModel == chapterModel) &&
            (identical(other.scrollModel, scrollModel) ||
                other.scrollModel == scrollModel) &&
            (identical(other.initModel, initModel) ||
                other.initModel == initModel) &&
            (identical(other.detailMeModel, detailMeModel) ||
                other.detailMeModel == detailMeModel) &&
            (identical(other.projectModel, projectModel) ||
                other.projectModel == projectModel));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    startAnimation,
    bannerModel,
    mySkillModel,
    chapterModel,
    scrollModel,
    initModel,
    detailMeModel,
    projectModel,
  );

  /// Create a copy of DesktopState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DesktopStateImplCopyWith<_$DesktopStateImpl> get copyWith =>
      __$$DesktopStateImplCopyWithImpl<_$DesktopStateImpl>(this, _$identity);
}

abstract class _DesktopState implements DesktopState {
  const factory _DesktopState({
    final StartAnimationModel? startAnimation,
    final BannerModel bannerModel,
    final MySkillModel mySkillModel,
    final ChapterModel chapterModel,
    final ScrollModel scrollModel,
    final InitModel initModel,
    final DetailMeModel detailMeModel,
    final ProjectModel projectModel,
  }) = _$DesktopStateImpl;

  //StartAnimation 컨트롤러
  @override
  StartAnimationModel? get startAnimation; //BannerModel
  @override
  BannerModel get bannerModel; //mySkill 모델
  @override
  MySkillModel get mySkillModel; //ChapterModel
  @override
  ChapterModel get chapterModel; //ScrollModel
  @override
  ScrollModel get scrollModel; //InitModel
  @override
  InitModel get initModel; //DetailMeModel
  @override
  DetailMeModel get detailMeModel; //ProjectModel
  @override
  ProjectModel get projectModel;

  /// Create a copy of DesktopState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DesktopStateImplCopyWith<_$DesktopStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
