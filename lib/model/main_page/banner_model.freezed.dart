// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BannerModel {
  bool get isPlayerActive => throw _privateConstructorUsedError;
  bool get player => throw _privateConstructorUsedError;
  int get currentTitleIndex => throw _privateConstructorUsedError;
  bool get isTitleChanging => throw _privateConstructorUsedError;
  bool get isButtonVisible => throw _privateConstructorUsedError;
  bool get isBannerActive => throw _privateConstructorUsedError;

  /// Create a copy of BannerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BannerModelCopyWith<BannerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerModelCopyWith<$Res> {
  factory $BannerModelCopyWith(
    BannerModel value,
    $Res Function(BannerModel) then,
  ) = _$BannerModelCopyWithImpl<$Res, BannerModel>;
  @useResult
  $Res call({
    bool isPlayerActive,
    bool player,
    int currentTitleIndex,
    bool isTitleChanging,
    bool isButtonVisible,
    bool isBannerActive,
  });
}

/// @nodoc
class _$BannerModelCopyWithImpl<$Res, $Val extends BannerModel>
    implements $BannerModelCopyWith<$Res> {
  _$BannerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BannerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPlayerActive = null,
    Object? player = null,
    Object? currentTitleIndex = null,
    Object? isTitleChanging = null,
    Object? isButtonVisible = null,
    Object? isBannerActive = null,
  }) {
    return _then(
      _value.copyWith(
            isPlayerActive:
                null == isPlayerActive
                    ? _value.isPlayerActive
                    : isPlayerActive // ignore: cast_nullable_to_non_nullable
                        as bool,
            player:
                null == player
                    ? _value.player
                    : player // ignore: cast_nullable_to_non_nullable
                        as bool,
            currentTitleIndex:
                null == currentTitleIndex
                    ? _value.currentTitleIndex
                    : currentTitleIndex // ignore: cast_nullable_to_non_nullable
                        as int,
            isTitleChanging:
                null == isTitleChanging
                    ? _value.isTitleChanging
                    : isTitleChanging // ignore: cast_nullable_to_non_nullable
                        as bool,
            isButtonVisible:
                null == isButtonVisible
                    ? _value.isButtonVisible
                    : isButtonVisible // ignore: cast_nullable_to_non_nullable
                        as bool,
            isBannerActive:
                null == isBannerActive
                    ? _value.isBannerActive
                    : isBannerActive // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BannerModelImplCopyWith<$Res>
    implements $BannerModelCopyWith<$Res> {
  factory _$$BannerModelImplCopyWith(
    _$BannerModelImpl value,
    $Res Function(_$BannerModelImpl) then,
  ) = __$$BannerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isPlayerActive,
    bool player,
    int currentTitleIndex,
    bool isTitleChanging,
    bool isButtonVisible,
    bool isBannerActive,
  });
}

/// @nodoc
class __$$BannerModelImplCopyWithImpl<$Res>
    extends _$BannerModelCopyWithImpl<$Res, _$BannerModelImpl>
    implements _$$BannerModelImplCopyWith<$Res> {
  __$$BannerModelImplCopyWithImpl(
    _$BannerModelImpl _value,
    $Res Function(_$BannerModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BannerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPlayerActive = null,
    Object? player = null,
    Object? currentTitleIndex = null,
    Object? isTitleChanging = null,
    Object? isButtonVisible = null,
    Object? isBannerActive = null,
  }) {
    return _then(
      _$BannerModelImpl(
        isPlayerActive:
            null == isPlayerActive
                ? _value.isPlayerActive
                : isPlayerActive // ignore: cast_nullable_to_non_nullable
                    as bool,
        player:
            null == player
                ? _value.player
                : player // ignore: cast_nullable_to_non_nullable
                    as bool,
        currentTitleIndex:
            null == currentTitleIndex
                ? _value.currentTitleIndex
                : currentTitleIndex // ignore: cast_nullable_to_non_nullable
                    as int,
        isTitleChanging:
            null == isTitleChanging
                ? _value.isTitleChanging
                : isTitleChanging // ignore: cast_nullable_to_non_nullable
                    as bool,
        isButtonVisible:
            null == isButtonVisible
                ? _value.isButtonVisible
                : isButtonVisible // ignore: cast_nullable_to_non_nullable
                    as bool,
        isBannerActive:
            null == isBannerActive
                ? _value.isBannerActive
                : isBannerActive // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$BannerModelImpl implements _BannerModel {
  const _$BannerModelImpl({
    this.isPlayerActive = false,
    this.player = false,
    this.currentTitleIndex = 0,
    this.isTitleChanging = false,
    this.isButtonVisible = false,
    this.isBannerActive = false,
  });

  @override
  @JsonKey()
  final bool isPlayerActive;
  @override
  @JsonKey()
  final bool player;
  @override
  @JsonKey()
  final int currentTitleIndex;
  @override
  @JsonKey()
  final bool isTitleChanging;
  @override
  @JsonKey()
  final bool isButtonVisible;
  @override
  @JsonKey()
  final bool isBannerActive;

  @override
  String toString() {
    return 'BannerModel(isPlayerActive: $isPlayerActive, player: $player, currentTitleIndex: $currentTitleIndex, isTitleChanging: $isTitleChanging, isButtonVisible: $isButtonVisible, isBannerActive: $isBannerActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BannerModelImpl &&
            (identical(other.isPlayerActive, isPlayerActive) ||
                other.isPlayerActive == isPlayerActive) &&
            (identical(other.player, player) || other.player == player) &&
            (identical(other.currentTitleIndex, currentTitleIndex) ||
                other.currentTitleIndex == currentTitleIndex) &&
            (identical(other.isTitleChanging, isTitleChanging) ||
                other.isTitleChanging == isTitleChanging) &&
            (identical(other.isButtonVisible, isButtonVisible) ||
                other.isButtonVisible == isButtonVisible) &&
            (identical(other.isBannerActive, isBannerActive) ||
                other.isBannerActive == isBannerActive));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isPlayerActive,
    player,
    currentTitleIndex,
    isTitleChanging,
    isButtonVisible,
    isBannerActive,
  );

  /// Create a copy of BannerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BannerModelImplCopyWith<_$BannerModelImpl> get copyWith =>
      __$$BannerModelImplCopyWithImpl<_$BannerModelImpl>(this, _$identity);
}

abstract class _BannerModel implements BannerModel {
  const factory _BannerModel({
    final bool isPlayerActive,
    final bool player,
    final int currentTitleIndex,
    final bool isTitleChanging,
    final bool isButtonVisible,
    final bool isBannerActive,
  }) = _$BannerModelImpl;

  @override
  bool get isPlayerActive;
  @override
  bool get player;
  @override
  int get currentTitleIndex;
  @override
  bool get isTitleChanging;
  @override
  bool get isButtonVisible;
  @override
  bool get isBannerActive;

  /// Create a copy of BannerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BannerModelImplCopyWith<_$BannerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
