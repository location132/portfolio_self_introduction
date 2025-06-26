// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'about_me_rive_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RiveAboutMeState {
  bool get isMenuClicked => throw _privateConstructorUsedError;

  /// Create a copy of RiveAboutMeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RiveAboutMeStateCopyWith<RiveAboutMeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RiveAboutMeStateCopyWith<$Res> {
  factory $RiveAboutMeStateCopyWith(
    RiveAboutMeState value,
    $Res Function(RiveAboutMeState) then,
  ) = _$RiveAboutMeStateCopyWithImpl<$Res, RiveAboutMeState>;
  @useResult
  $Res call({bool isMenuClicked});
}

/// @nodoc
class _$RiveAboutMeStateCopyWithImpl<$Res, $Val extends RiveAboutMeState>
    implements $RiveAboutMeStateCopyWith<$Res> {
  _$RiveAboutMeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RiveAboutMeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isMenuClicked = null}) {
    return _then(
      _value.copyWith(
            isMenuClicked:
                null == isMenuClicked
                    ? _value.isMenuClicked
                    : isMenuClicked // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GsShopStateImplCopyWith<$Res>
    implements $RiveAboutMeStateCopyWith<$Res> {
  factory _$$GsShopStateImplCopyWith(
    _$GsShopStateImpl value,
    $Res Function(_$GsShopStateImpl) then,
  ) = __$$GsShopStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isMenuClicked});
}

/// @nodoc
class __$$GsShopStateImplCopyWithImpl<$Res>
    extends _$RiveAboutMeStateCopyWithImpl<$Res, _$GsShopStateImpl>
    implements _$$GsShopStateImplCopyWith<$Res> {
  __$$GsShopStateImplCopyWithImpl(
    _$GsShopStateImpl _value,
    $Res Function(_$GsShopStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RiveAboutMeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isMenuClicked = null}) {
    return _then(
      _$GsShopStateImpl(
        isMenuClicked:
            null == isMenuClicked
                ? _value.isMenuClicked
                : isMenuClicked // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$GsShopStateImpl implements _GsShopState {
  const _$GsShopStateImpl({this.isMenuClicked = false});

  @override
  @JsonKey()
  final bool isMenuClicked;

  @override
  String toString() {
    return 'RiveAboutMeState(isMenuClicked: $isMenuClicked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GsShopStateImpl &&
            (identical(other.isMenuClicked, isMenuClicked) ||
                other.isMenuClicked == isMenuClicked));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isMenuClicked);

  /// Create a copy of RiveAboutMeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GsShopStateImplCopyWith<_$GsShopStateImpl> get copyWith =>
      __$$GsShopStateImplCopyWithImpl<_$GsShopStateImpl>(this, _$identity);
}

abstract class _GsShopState implements RiveAboutMeState {
  const factory _GsShopState({final bool isMenuClicked}) = _$GsShopStateImpl;

  @override
  bool get isMenuClicked;

  /// Create a copy of RiveAboutMeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GsShopStateImplCopyWith<_$GsShopStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
