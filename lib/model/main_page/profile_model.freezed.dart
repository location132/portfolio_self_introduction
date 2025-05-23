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
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ProfileModel {
  int get scrollCount => throw _privateConstructorUsedError; //현재 페이지 번호
  int get finalCount => throw _privateConstructorUsedError; //사용자가 본 최종 페이지 번호
  int get previousCount =>
      throw _privateConstructorUsedError; //사용자가 본 이전 페이지 번호
  bool get isChapterSkip => throw _privateConstructorUsedError; //사용자의 챕터 스킵 여부
  // 사용자가 1번 화면에서 터치를 했을 때, 관리하는 상태 변수
  bool get isUserClick => throw _privateConstructorUsedError; //챕터 모델
  ProfileChapter2Model get profileChapter2Model =>
      throw _privateConstructorUsedError;

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileModelCopyWith<ProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileModelCopyWith<$Res> {
  factory $ProfileModelCopyWith(
    ProfileModel value,
    $Res Function(ProfileModel) then,
  ) = _$ProfileModelCopyWithImpl<$Res, ProfileModel>;
  @useResult
  $Res call({
    int scrollCount,
    int finalCount,
    int previousCount,
    bool isChapterSkip,
    bool isUserClick,
    ProfileChapter2Model profileChapter2Model,
  });

  $ProfileChapter2ModelCopyWith<$Res> get profileChapter2Model;
}

/// @nodoc
class _$ProfileModelCopyWithImpl<$Res, $Val extends ProfileModel>
    implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scrollCount = null,
    Object? finalCount = null,
    Object? previousCount = null,
    Object? isChapterSkip = null,
    Object? isUserClick = null,
    Object? profileChapter2Model = null,
  }) {
    return _then(
      _value.copyWith(
            scrollCount:
                null == scrollCount
                    ? _value.scrollCount
                    : scrollCount // ignore: cast_nullable_to_non_nullable
                        as int,
            finalCount:
                null == finalCount
                    ? _value.finalCount
                    : finalCount // ignore: cast_nullable_to_non_nullable
                        as int,
            previousCount:
                null == previousCount
                    ? _value.previousCount
                    : previousCount // ignore: cast_nullable_to_non_nullable
                        as int,
            isChapterSkip:
                null == isChapterSkip
                    ? _value.isChapterSkip
                    : isChapterSkip // ignore: cast_nullable_to_non_nullable
                        as bool,
            isUserClick:
                null == isUserClick
                    ? _value.isUserClick
                    : isUserClick // ignore: cast_nullable_to_non_nullable
                        as bool,
            profileChapter2Model:
                null == profileChapter2Model
                    ? _value.profileChapter2Model
                    : profileChapter2Model // ignore: cast_nullable_to_non_nullable
                        as ProfileChapter2Model,
          )
          as $Val,
    );
  }

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileChapter2ModelCopyWith<$Res> get profileChapter2Model {
    return $ProfileChapter2ModelCopyWith<$Res>(_value.profileChapter2Model, (
      value,
    ) {
      return _then(_value.copyWith(profileChapter2Model: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileModelImplCopyWith<$Res>
    implements $ProfileModelCopyWith<$Res> {
  factory _$$ProfileModelImplCopyWith(
    _$ProfileModelImpl value,
    $Res Function(_$ProfileModelImpl) then,
  ) = __$$ProfileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int scrollCount,
    int finalCount,
    int previousCount,
    bool isChapterSkip,
    bool isUserClick,
    ProfileChapter2Model profileChapter2Model,
  });

  @override
  $ProfileChapter2ModelCopyWith<$Res> get profileChapter2Model;
}

/// @nodoc
class __$$ProfileModelImplCopyWithImpl<$Res>
    extends _$ProfileModelCopyWithImpl<$Res, _$ProfileModelImpl>
    implements _$$ProfileModelImplCopyWith<$Res> {
  __$$ProfileModelImplCopyWithImpl(
    _$ProfileModelImpl _value,
    $Res Function(_$ProfileModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scrollCount = null,
    Object? finalCount = null,
    Object? previousCount = null,
    Object? isChapterSkip = null,
    Object? isUserClick = null,
    Object? profileChapter2Model = null,
  }) {
    return _then(
      _$ProfileModelImpl(
        scrollCount:
            null == scrollCount
                ? _value.scrollCount
                : scrollCount // ignore: cast_nullable_to_non_nullable
                    as int,
        finalCount:
            null == finalCount
                ? _value.finalCount
                : finalCount // ignore: cast_nullable_to_non_nullable
                    as int,
        previousCount:
            null == previousCount
                ? _value.previousCount
                : previousCount // ignore: cast_nullable_to_non_nullable
                    as int,
        isChapterSkip:
            null == isChapterSkip
                ? _value.isChapterSkip
                : isChapterSkip // ignore: cast_nullable_to_non_nullable
                    as bool,
        isUserClick:
            null == isUserClick
                ? _value.isUserClick
                : isUserClick // ignore: cast_nullable_to_non_nullable
                    as bool,
        profileChapter2Model:
            null == profileChapter2Model
                ? _value.profileChapter2Model
                : profileChapter2Model // ignore: cast_nullable_to_non_nullable
                    as ProfileChapter2Model,
      ),
    );
  }
}

/// @nodoc

class _$ProfileModelImpl implements _ProfileModel {
  const _$ProfileModelImpl({
    this.scrollCount = 0,
    this.finalCount = 0,
    this.previousCount = 0,
    this.isChapterSkip = false,
    this.isUserClick = false,
    this.profileChapter2Model = const ProfileChapter2Model(),
  });

  @override
  @JsonKey()
  final int scrollCount;
  //현재 페이지 번호
  @override
  @JsonKey()
  final int finalCount;
  //사용자가 본 최종 페이지 번호
  @override
  @JsonKey()
  final int previousCount;
  //사용자가 본 이전 페이지 번호
  @override
  @JsonKey()
  final bool isChapterSkip;
  //사용자의 챕터 스킵 여부
  // 사용자가 1번 화면에서 터치를 했을 때, 관리하는 상태 변수
  @override
  @JsonKey()
  final bool isUserClick;
  //챕터 모델
  @override
  @JsonKey()
  final ProfileChapter2Model profileChapter2Model;

  @override
  String toString() {
    return 'ProfileModel(scrollCount: $scrollCount, finalCount: $finalCount, previousCount: $previousCount, isChapterSkip: $isChapterSkip, isUserClick: $isUserClick, profileChapter2Model: $profileChapter2Model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileModelImpl &&
            (identical(other.scrollCount, scrollCount) ||
                other.scrollCount == scrollCount) &&
            (identical(other.finalCount, finalCount) ||
                other.finalCount == finalCount) &&
            (identical(other.previousCount, previousCount) ||
                other.previousCount == previousCount) &&
            (identical(other.isChapterSkip, isChapterSkip) ||
                other.isChapterSkip == isChapterSkip) &&
            (identical(other.isUserClick, isUserClick) ||
                other.isUserClick == isUserClick) &&
            (identical(other.profileChapter2Model, profileChapter2Model) ||
                other.profileChapter2Model == profileChapter2Model));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    scrollCount,
    finalCount,
    previousCount,
    isChapterSkip,
    isUserClick,
    profileChapter2Model,
  );

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileModelImplCopyWith<_$ProfileModelImpl> get copyWith =>
      __$$ProfileModelImplCopyWithImpl<_$ProfileModelImpl>(this, _$identity);
}

abstract class _ProfileModel implements ProfileModel {
  const factory _ProfileModel({
    final int scrollCount,
    final int finalCount,
    final int previousCount,
    final bool isChapterSkip,
    final bool isUserClick,
    final ProfileChapter2Model profileChapter2Model,
  }) = _$ProfileModelImpl;

  @override
  int get scrollCount; //현재 페이지 번호
  @override
  int get finalCount; //사용자가 본 최종 페이지 번호
  @override
  int get previousCount; //사용자가 본 이전 페이지 번호
  @override
  bool get isChapterSkip; //사용자의 챕터 스킵 여부
  // 사용자가 1번 화면에서 터치를 했을 때, 관리하는 상태 변수
  @override
  bool get isUserClick; //챕터 모델
  @override
  ProfileChapter2Model get profileChapter2Model;

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileModelImplCopyWith<_$ProfileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
