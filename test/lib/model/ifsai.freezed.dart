// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ifsai.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Ifsai {
  bool get isServerConnected => throw _privateConstructorUsedError;
  String? get appVersion => throw _privateConstructorUsedError;
  String? get marketDataVersion => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IfsaiCopyWith<Ifsai> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IfsaiCopyWith<$Res> {
  factory $IfsaiCopyWith(Ifsai value, $Res Function(Ifsai) then) =
      _$IfsaiCopyWithImpl<$Res, Ifsai>;
  @useResult
  $Res call(
      {bool isServerConnected, String? appVersion, String? marketDataVersion});
}

/// @nodoc
class _$IfsaiCopyWithImpl<$Res, $Val extends Ifsai>
    implements $IfsaiCopyWith<$Res> {
  _$IfsaiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isServerConnected = null,
    Object? appVersion = freezed,
    Object? marketDataVersion = freezed,
  }) {
    return _then(_value.copyWith(
      isServerConnected: null == isServerConnected
          ? _value.isServerConnected
          : isServerConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      marketDataVersion: freezed == marketDataVersion
          ? _value.marketDataVersion
          : marketDataVersion // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IfsaiImplCopyWith<$Res> implements $IfsaiCopyWith<$Res> {
  factory _$$IfsaiImplCopyWith(
          _$IfsaiImpl value, $Res Function(_$IfsaiImpl) then) =
      __$$IfsaiImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isServerConnected, String? appVersion, String? marketDataVersion});
}

/// @nodoc
class __$$IfsaiImplCopyWithImpl<$Res>
    extends _$IfsaiCopyWithImpl<$Res, _$IfsaiImpl>
    implements _$$IfsaiImplCopyWith<$Res> {
  __$$IfsaiImplCopyWithImpl(
      _$IfsaiImpl _value, $Res Function(_$IfsaiImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isServerConnected = null,
    Object? appVersion = freezed,
    Object? marketDataVersion = freezed,
  }) {
    return _then(_$IfsaiImpl(
      isServerConnected: null == isServerConnected
          ? _value.isServerConnected
          : isServerConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      marketDataVersion: freezed == marketDataVersion
          ? _value.marketDataVersion
          : marketDataVersion // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$IfsaiImpl implements _Ifsai {
  const _$IfsaiImpl(
      {required this.isServerConnected,
      this.appVersion,
      this.marketDataVersion});

  @override
  final bool isServerConnected;
  @override
  final String? appVersion;
  @override
  final String? marketDataVersion;

  @override
  String toString() {
    return 'Ifsai(isServerConnected: $isServerConnected, appVersion: $appVersion, marketDataVersion: $marketDataVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IfsaiImpl &&
            (identical(other.isServerConnected, isServerConnected) ||
                other.isServerConnected == isServerConnected) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.marketDataVersion, marketDataVersion) ||
                other.marketDataVersion == marketDataVersion));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isServerConnected, appVersion, marketDataVersion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IfsaiImplCopyWith<_$IfsaiImpl> get copyWith =>
      __$$IfsaiImplCopyWithImpl<_$IfsaiImpl>(this, _$identity);
}

abstract class _Ifsai implements Ifsai {
  const factory _Ifsai(
      {required final bool isServerConnected,
      final String? appVersion,
      final String? marketDataVersion}) = _$IfsaiImpl;

  @override
  bool get isServerConnected;
  @override
  String? get appVersion;
  @override
  String? get marketDataVersion;
  @override
  @JsonKey(ignore: true)
  _$$IfsaiImplCopyWith<_$IfsaiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
