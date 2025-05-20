// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mobile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MobileState {
  String get test => throw _privateConstructorUsedError;

  /// Create a copy of MobileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MobileStateCopyWith<MobileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MobileStateCopyWith<$Res> {
  factory $MobileStateCopyWith(
          MobileState value, $Res Function(MobileState) then) =
      _$MobileStateCopyWithImpl<$Res, MobileState>;
  @useResult
  $Res call({String test});
}

/// @nodoc
class _$MobileStateCopyWithImpl<$Res, $Val extends MobileState>
    implements $MobileStateCopyWith<$Res> {
  _$MobileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MobileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? test = null,
  }) {
    return _then(_value.copyWith(
      test: null == test
          ? _value.test
          : test // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MobileStateImplCopyWith<$Res>
    implements $MobileStateCopyWith<$Res> {
  factory _$$MobileStateImplCopyWith(
          _$MobileStateImpl value, $Res Function(_$MobileStateImpl) then) =
      __$$MobileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String test});
}

/// @nodoc
class __$$MobileStateImplCopyWithImpl<$Res>
    extends _$MobileStateCopyWithImpl<$Res, _$MobileStateImpl>
    implements _$$MobileStateImplCopyWith<$Res> {
  __$$MobileStateImplCopyWithImpl(
      _$MobileStateImpl _value, $Res Function(_$MobileStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MobileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? test = null,
  }) {
    return _then(_$MobileStateImpl(
      test: null == test
          ? _value.test
          : test // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MobileStateImpl implements _MobileState {
  const _$MobileStateImpl({this.test = ''});

  @override
  @JsonKey()
  final String test;

  @override
  String toString() {
    return 'MobileState(test: $test)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MobileStateImpl &&
            (identical(other.test, test) || other.test == test));
  }

  @override
  int get hashCode => Object.hash(runtimeType, test);

  /// Create a copy of MobileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MobileStateImplCopyWith<_$MobileStateImpl> get copyWith =>
      __$$MobileStateImplCopyWithImpl<_$MobileStateImpl>(this, _$identity);
}

abstract class _MobileState implements MobileState {
  const factory _MobileState({final String test}) = _$MobileStateImpl;

  @override
  String get test;

  /// Create a copy of MobileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MobileStateImplCopyWith<_$MobileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
