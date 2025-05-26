// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'init_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$InitModel {
  // 초기화 상태
  InitState get initState => throw _privateConstructorUsedError; // 프로필 뷰 높이
  double get mainViewHeight => throw _privateConstructorUsedError; // 로딩 남은시간()
  int get remainingTime => throw _privateConstructorUsedError; // 브라우저 확인
  bool get isChromeBrowser => throw _privateConstructorUsedError; //모바일 init 확인
  bool get isMobileInit =>
      throw _privateConstructorUsedError; // 모바일 화면 폴드, 또는 웹
  bool get isMobileFoldable => throw _privateConstructorUsedError;

  /// Create a copy of InitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InitModelCopyWith<InitModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitModelCopyWith<$Res> {
  factory $InitModelCopyWith(InitModel value, $Res Function(InitModel) then) =
      _$InitModelCopyWithImpl<$Res, InitModel>;
  @useResult
  $Res call({
    InitState initState,
    double mainViewHeight,
    int remainingTime,
    bool isChromeBrowser,
    bool isMobileInit,
    bool isMobileFoldable,
  });
}

/// @nodoc
class _$InitModelCopyWithImpl<$Res, $Val extends InitModel>
    implements $InitModelCopyWith<$Res> {
  _$InitModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InitModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initState = null,
    Object? mainViewHeight = null,
    Object? remainingTime = null,
    Object? isChromeBrowser = null,
    Object? isMobileInit = null,
    Object? isMobileFoldable = null,
  }) {
    return _then(
      _value.copyWith(
            initState:
                null == initState
                    ? _value.initState
                    : initState // ignore: cast_nullable_to_non_nullable
                        as InitState,
            mainViewHeight:
                null == mainViewHeight
                    ? _value.mainViewHeight
                    : mainViewHeight // ignore: cast_nullable_to_non_nullable
                        as double,
            remainingTime:
                null == remainingTime
                    ? _value.remainingTime
                    : remainingTime // ignore: cast_nullable_to_non_nullable
                        as int,
            isChromeBrowser:
                null == isChromeBrowser
                    ? _value.isChromeBrowser
                    : isChromeBrowser // ignore: cast_nullable_to_non_nullable
                        as bool,
            isMobileInit:
                null == isMobileInit
                    ? _value.isMobileInit
                    : isMobileInit // ignore: cast_nullable_to_non_nullable
                        as bool,
            isMobileFoldable:
                null == isMobileFoldable
                    ? _value.isMobileFoldable
                    : isMobileFoldable // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InitModelImplCopyWith<$Res>
    implements $InitModelCopyWith<$Res> {
  factory _$$InitModelImplCopyWith(
    _$InitModelImpl value,
    $Res Function(_$InitModelImpl) then,
  ) = __$$InitModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    InitState initState,
    double mainViewHeight,
    int remainingTime,
    bool isChromeBrowser,
    bool isMobileInit,
    bool isMobileFoldable,
  });
}

/// @nodoc
class __$$InitModelImplCopyWithImpl<$Res>
    extends _$InitModelCopyWithImpl<$Res, _$InitModelImpl>
    implements _$$InitModelImplCopyWith<$Res> {
  __$$InitModelImplCopyWithImpl(
    _$InitModelImpl _value,
    $Res Function(_$InitModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InitModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initState = null,
    Object? mainViewHeight = null,
    Object? remainingTime = null,
    Object? isChromeBrowser = null,
    Object? isMobileInit = null,
    Object? isMobileFoldable = null,
  }) {
    return _then(
      _$InitModelImpl(
        initState:
            null == initState
                ? _value.initState
                : initState // ignore: cast_nullable_to_non_nullable
                    as InitState,
        mainViewHeight:
            null == mainViewHeight
                ? _value.mainViewHeight
                : mainViewHeight // ignore: cast_nullable_to_non_nullable
                    as double,
        remainingTime:
            null == remainingTime
                ? _value.remainingTime
                : remainingTime // ignore: cast_nullable_to_non_nullable
                    as int,
        isChromeBrowser:
            null == isChromeBrowser
                ? _value.isChromeBrowser
                : isChromeBrowser // ignore: cast_nullable_to_non_nullable
                    as bool,
        isMobileInit:
            null == isMobileInit
                ? _value.isMobileInit
                : isMobileInit // ignore: cast_nullable_to_non_nullable
                    as bool,
        isMobileFoldable:
            null == isMobileFoldable
                ? _value.isMobileFoldable
                : isMobileFoldable // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$InitModelImpl implements _InitModel {
  const _$InitModelImpl({
    this.initState = InitState.inactive,
    this.mainViewHeight = 0.0,
    this.remainingTime = 4,
    this.isChromeBrowser = false,
    this.isMobileInit = false,
    this.isMobileFoldable = false,
  });

  // 초기화 상태
  @override
  @JsonKey()
  final InitState initState;
  // 프로필 뷰 높이
  @override
  @JsonKey()
  final double mainViewHeight;
  // 로딩 남은시간()
  @override
  @JsonKey()
  final int remainingTime;
  // 브라우저 확인
  @override
  @JsonKey()
  final bool isChromeBrowser;
  //모바일 init 확인
  @override
  @JsonKey()
  final bool isMobileInit;
  // 모바일 화면 폴드, 또는 웹
  @override
  @JsonKey()
  final bool isMobileFoldable;

  @override
  String toString() {
    return 'InitModel(initState: $initState, mainViewHeight: $mainViewHeight, remainingTime: $remainingTime, isChromeBrowser: $isChromeBrowser, isMobileInit: $isMobileInit, isMobileFoldable: $isMobileFoldable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitModelImpl &&
            (identical(other.initState, initState) ||
                other.initState == initState) &&
            (identical(other.mainViewHeight, mainViewHeight) ||
                other.mainViewHeight == mainViewHeight) &&
            (identical(other.remainingTime, remainingTime) ||
                other.remainingTime == remainingTime) &&
            (identical(other.isChromeBrowser, isChromeBrowser) ||
                other.isChromeBrowser == isChromeBrowser) &&
            (identical(other.isMobileInit, isMobileInit) ||
                other.isMobileInit == isMobileInit) &&
            (identical(other.isMobileFoldable, isMobileFoldable) ||
                other.isMobileFoldable == isMobileFoldable));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    initState,
    mainViewHeight,
    remainingTime,
    isChromeBrowser,
    isMobileInit,
    isMobileFoldable,
  );

  /// Create a copy of InitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitModelImplCopyWith<_$InitModelImpl> get copyWith =>
      __$$InitModelImplCopyWithImpl<_$InitModelImpl>(this, _$identity);
}

abstract class _InitModel implements InitModel {
  const factory _InitModel({
    final InitState initState,
    final double mainViewHeight,
    final int remainingTime,
    final bool isChromeBrowser,
    final bool isMobileInit,
    final bool isMobileFoldable,
  }) = _$InitModelImpl;

  // 초기화 상태
  @override
  InitState get initState; // 프로필 뷰 높이
  @override
  double get mainViewHeight; // 로딩 남은시간()
  @override
  int get remainingTime; // 브라우저 확인
  @override
  bool get isChromeBrowser; //모바일 init 확인
  @override
  bool get isMobileInit; // 모바일 화면 폴드, 또는 웹
  @override
  bool get isMobileFoldable;

  /// Create a copy of InitModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitModelImplCopyWith<_$InitModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
