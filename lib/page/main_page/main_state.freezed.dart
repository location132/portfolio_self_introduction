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
  MainPageStatus get status => throw _privateConstructorUsedError;
  int get stateNameIndex => throw _privateConstructorUsedError;
  String get stateBannerText => throw _privateConstructorUsedError;

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
      {MainPageStatus status, int stateNameIndex, String stateBannerText});
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
    Object? status = null,
    Object? stateNameIndex = null,
    Object? stateBannerText = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MainPageStatus,
      stateNameIndex: null == stateNameIndex
          ? _value.stateNameIndex
          : stateNameIndex // ignore: cast_nullable_to_non_nullable
              as int,
      stateBannerText: null == stateBannerText
          ? _value.stateBannerText
          : stateBannerText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
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
      {MainPageStatus status, int stateNameIndex, String stateBannerText});
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
    Object? status = null,
    Object? stateNameIndex = null,
    Object? stateBannerText = null,
  }) {
    return _then(_$MainPageStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MainPageStatus,
      stateNameIndex: null == stateNameIndex
          ? _value.stateNameIndex
          : stateNameIndex // ignore: cast_nullable_to_non_nullable
              as int,
      stateBannerText: null == stateBannerText
          ? _value.stateBannerText
          : stateBannerText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MainPageStateImpl extends _MainPageState {
  const _$MainPageStateImpl(
      {this.status = MainPageStatus.initial,
      this.stateNameIndex = 0,
      this.stateBannerText = ''})
      : super._();

  @override
  @JsonKey()
  final MainPageStatus status;
  @override
  @JsonKey()
  final int stateNameIndex;
  @override
  @JsonKey()
  final String stateBannerText;

  @override
  String toString() {
    return 'MainPageState(status: $status, stateNameIndex: $stateNameIndex, stateBannerText: $stateBannerText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainPageStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.stateNameIndex, stateNameIndex) ||
                other.stateNameIndex == stateNameIndex) &&
            (identical(other.stateBannerText, stateBannerText) ||
                other.stateBannerText == stateBannerText));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, stateNameIndex, stateBannerText);

  /// Create a copy of MainPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MainPageStateImplCopyWith<_$MainPageStateImpl> get copyWith =>
      __$$MainPageStateImplCopyWithImpl<_$MainPageStateImpl>(this, _$identity);
}

abstract class _MainPageState extends MainPageState {
  const factory _MainPageState(
      {final MainPageStatus status,
      final int stateNameIndex,
      final String stateBannerText}) = _$MainPageStateImpl;
  const _MainPageState._() : super._();

  @override
  MainPageStatus get status;
  @override
  int get stateNameIndex;
  @override
  String get stateBannerText;

  /// Create a copy of MainPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MainPageStateImplCopyWith<_$MainPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
