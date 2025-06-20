// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'start_remote_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StartIfsaiResponse _$StartIfsaiResponseFromJson(Map<String, dynamic> json) {
  return _StartIfsaiResponse.fromJson(json);
}

/// @nodoc
mixin _$StartIfsaiResponse {
  bool get isServerConnected => throw _privateConstructorUsedError;
  String? get appVersion => throw _privateConstructorUsedError;
  String? get marketDataVersion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StartIfsaiResponseCopyWith<StartIfsaiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartIfsaiResponseCopyWith<$Res> {
  factory $StartIfsaiResponseCopyWith(
          StartIfsaiResponse value, $Res Function(StartIfsaiResponse) then) =
      _$StartIfsaiResponseCopyWithImpl<$Res, StartIfsaiResponse>;
  @useResult
  $Res call(
      {bool isServerConnected, String? appVersion, String? marketDataVersion});
}

/// @nodoc
class _$StartIfsaiResponseCopyWithImpl<$Res, $Val extends StartIfsaiResponse>
    implements $StartIfsaiResponseCopyWith<$Res> {
  _$StartIfsaiResponseCopyWithImpl(this._value, this._then);

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
abstract class _$$StartIfsaiResponseImplCopyWith<$Res>
    implements $StartIfsaiResponseCopyWith<$Res> {
  factory _$$StartIfsaiResponseImplCopyWith(_$StartIfsaiResponseImpl value,
          $Res Function(_$StartIfsaiResponseImpl) then) =
      __$$StartIfsaiResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isServerConnected, String? appVersion, String? marketDataVersion});
}

/// @nodoc
class __$$StartIfsaiResponseImplCopyWithImpl<$Res>
    extends _$StartIfsaiResponseCopyWithImpl<$Res, _$StartIfsaiResponseImpl>
    implements _$$StartIfsaiResponseImplCopyWith<$Res> {
  __$$StartIfsaiResponseImplCopyWithImpl(_$StartIfsaiResponseImpl _value,
      $Res Function(_$StartIfsaiResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isServerConnected = null,
    Object? appVersion = freezed,
    Object? marketDataVersion = freezed,
  }) {
    return _then(_$StartIfsaiResponseImpl(
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
@JsonSerializable()
class _$StartIfsaiResponseImpl extends _StartIfsaiResponse {
  const _$StartIfsaiResponseImpl(
      {required this.isServerConnected,
      this.appVersion,
      this.marketDataVersion})
      : super._();

  factory _$StartIfsaiResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$StartIfsaiResponseImplFromJson(json);

  @override
  final bool isServerConnected;
  @override
  final String? appVersion;
  @override
  final String? marketDataVersion;

  @override
  String toString() {
    return 'StartIfsaiResponse(isServerConnected: $isServerConnected, appVersion: $appVersion, marketDataVersion: $marketDataVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartIfsaiResponseImpl &&
            (identical(other.isServerConnected, isServerConnected) ||
                other.isServerConnected == isServerConnected) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.marketDataVersion, marketDataVersion) ||
                other.marketDataVersion == marketDataVersion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, isServerConnected, appVersion, marketDataVersion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartIfsaiResponseImplCopyWith<_$StartIfsaiResponseImpl> get copyWith =>
      __$$StartIfsaiResponseImplCopyWithImpl<_$StartIfsaiResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StartIfsaiResponseImplToJson(
      this,
    );
  }
}

abstract class _StartIfsaiResponse extends StartIfsaiResponse {
  const factory _StartIfsaiResponse(
      {required final bool isServerConnected,
      final String? appVersion,
      final String? marketDataVersion}) = _$StartIfsaiResponseImpl;
  const _StartIfsaiResponse._() : super._();

  factory _StartIfsaiResponse.fromJson(Map<String, dynamic> json) =
      _$StartIfsaiResponseImpl.fromJson;

  @override
  bool get isServerConnected;
  @override
  String? get appVersion;
  @override
  String? get marketDataVersion;
  @override
  @JsonKey(ignore: true)
  _$$StartIfsaiResponseImplCopyWith<_$StartIfsaiResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
