// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'start_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StartState {
  ScreenState get screenState => throw _privateConstructorUsedError;
  Ifsai? get ifsai => throw _privateConstructorUsedError;
  bool get isNeedUpdateApp => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StartStateCopyWith<StartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartStateCopyWith<$Res> {
  factory $StartStateCopyWith(
          StartState value, $Res Function(StartState) then) =
      _$StartStateCopyWithImpl<$Res, StartState>;
  @useResult
  $Res call({ScreenState screenState, Ifsai? ifsai, bool isNeedUpdateApp});

  $IfsaiCopyWith<$Res>? get ifsai;
}

/// @nodoc
class _$StartStateCopyWithImpl<$Res, $Val extends StartState>
    implements $StartStateCopyWith<$Res> {
  _$StartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screenState = null,
    Object? ifsai = freezed,
    Object? isNeedUpdateApp = null,
  }) {
    return _then(_value.copyWith(
      screenState: null == screenState
          ? _value.screenState
          : screenState // ignore: cast_nullable_to_non_nullable
              as ScreenState,
      ifsai: freezed == ifsai
          ? _value.ifsai
          : ifsai // ignore: cast_nullable_to_non_nullable
              as Ifsai?,
      isNeedUpdateApp: null == isNeedUpdateApp
          ? _value.isNeedUpdateApp
          : isNeedUpdateApp // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $IfsaiCopyWith<$Res>? get ifsai {
    if (_value.ifsai == null) {
      return null;
    }

    return $IfsaiCopyWith<$Res>(_value.ifsai!, (value) {
      return _then(_value.copyWith(ifsai: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StartStateImplCopyWith<$Res>
    implements $StartStateCopyWith<$Res> {
  factory _$$StartStateImplCopyWith(
          _$StartStateImpl value, $Res Function(_$StartStateImpl) then) =
      __$$StartStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ScreenState screenState, Ifsai? ifsai, bool isNeedUpdateApp});

  @override
  $IfsaiCopyWith<$Res>? get ifsai;
}

/// @nodoc
class __$$StartStateImplCopyWithImpl<$Res>
    extends _$StartStateCopyWithImpl<$Res, _$StartStateImpl>
    implements _$$StartStateImplCopyWith<$Res> {
  __$$StartStateImplCopyWithImpl(
      _$StartStateImpl _value, $Res Function(_$StartStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screenState = null,
    Object? ifsai = freezed,
    Object? isNeedUpdateApp = null,
  }) {
    return _then(_$StartStateImpl(
      screenState: null == screenState
          ? _value.screenState
          : screenState // ignore: cast_nullable_to_non_nullable
              as ScreenState,
      ifsai: freezed == ifsai
          ? _value.ifsai
          : ifsai // ignore: cast_nullable_to_non_nullable
              as Ifsai?,
      isNeedUpdateApp: null == isNeedUpdateApp
          ? _value.isNeedUpdateApp
          : isNeedUpdateApp // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$StartStateImpl implements _StartState {
  const _$StartStateImpl(
      {this.screenState = ScreenState.loading,
      this.ifsai,
      this.isNeedUpdateApp = false});

  @override
  @JsonKey()
  final ScreenState screenState;
  @override
  final Ifsai? ifsai;
  @override
  @JsonKey()
  final bool isNeedUpdateApp;

  @override
  String toString() {
    return 'StartState(screenState: $screenState, ifsai: $ifsai, isNeedUpdateApp: $isNeedUpdateApp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartStateImpl &&
            (identical(other.screenState, screenState) ||
                other.screenState == screenState) &&
            (identical(other.ifsai, ifsai) || other.ifsai == ifsai) &&
            (identical(other.isNeedUpdateApp, isNeedUpdateApp) ||
                other.isNeedUpdateApp == isNeedUpdateApp));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, screenState, ifsai, isNeedUpdateApp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartStateImplCopyWith<_$StartStateImpl> get copyWith =>
      __$$StartStateImplCopyWithImpl<_$StartStateImpl>(this, _$identity);
}

abstract class _StartState implements StartState {
  const factory _StartState(
      {final ScreenState screenState,
      final Ifsai? ifsai,
      final bool isNeedUpdateApp}) = _$StartStateImpl;

  @override
  ScreenState get screenState;
  @override
  Ifsai? get ifsai;
  @override
  bool get isNeedUpdateApp;
  @override
  @JsonKey(ignore: true)
  _$$StartStateImplCopyWith<_$StartStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
