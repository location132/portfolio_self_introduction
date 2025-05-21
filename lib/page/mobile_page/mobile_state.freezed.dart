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
  InitModel get initModel => throw _privateConstructorUsedError;
  IntroModel get introModel => throw _privateConstructorUsedError;
  ScrollModel get scrollModel => throw _privateConstructorUsedError;

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
  $Res call(
      {InitModel initModel, IntroModel introModel, ScrollModel scrollModel});

  $InitModelCopyWith<$Res> get initModel;
  $IntroModelCopyWith<$Res> get introModel;
  $ScrollModelCopyWith<$Res> get scrollModel;
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
    Object? initModel = null,
    Object? introModel = null,
    Object? scrollModel = null,
  }) {
    return _then(_value.copyWith(
      initModel: null == initModel
          ? _value.initModel
          : initModel // ignore: cast_nullable_to_non_nullable
              as InitModel,
      introModel: null == introModel
          ? _value.introModel
          : introModel // ignore: cast_nullable_to_non_nullable
              as IntroModel,
      scrollModel: null == scrollModel
          ? _value.scrollModel
          : scrollModel // ignore: cast_nullable_to_non_nullable
              as ScrollModel,
    ) as $Val);
  }

  /// Create a copy of MobileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InitModelCopyWith<$Res> get initModel {
    return $InitModelCopyWith<$Res>(_value.initModel, (value) {
      return _then(_value.copyWith(initModel: value) as $Val);
    });
  }

  /// Create a copy of MobileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IntroModelCopyWith<$Res> get introModel {
    return $IntroModelCopyWith<$Res>(_value.introModel, (value) {
      return _then(_value.copyWith(introModel: value) as $Val);
    });
  }

  /// Create a copy of MobileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ScrollModelCopyWith<$Res> get scrollModel {
    return $ScrollModelCopyWith<$Res>(_value.scrollModel, (value) {
      return _then(_value.copyWith(scrollModel: value) as $Val);
    });
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
  $Res call(
      {InitModel initModel, IntroModel introModel, ScrollModel scrollModel});

  @override
  $InitModelCopyWith<$Res> get initModel;
  @override
  $IntroModelCopyWith<$Res> get introModel;
  @override
  $ScrollModelCopyWith<$Res> get scrollModel;
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
    Object? initModel = null,
    Object? introModel = null,
    Object? scrollModel = null,
  }) {
    return _then(_$MobileStateImpl(
      initModel: null == initModel
          ? _value.initModel
          : initModel // ignore: cast_nullable_to_non_nullable
              as InitModel,
      introModel: null == introModel
          ? _value.introModel
          : introModel // ignore: cast_nullable_to_non_nullable
              as IntroModel,
      scrollModel: null == scrollModel
          ? _value.scrollModel
          : scrollModel // ignore: cast_nullable_to_non_nullable
              as ScrollModel,
    ));
  }
}

/// @nodoc

class _$MobileStateImpl implements _MobileState {
  const _$MobileStateImpl(
      {this.initModel = const InitModel(),
      this.introModel = const IntroModel(),
      this.scrollModel = const ScrollModel()});

  @override
  @JsonKey()
  final InitModel initModel;
  @override
  @JsonKey()
  final IntroModel introModel;
  @override
  @JsonKey()
  final ScrollModel scrollModel;

  @override
  String toString() {
    return 'MobileState(initModel: $initModel, introModel: $introModel, scrollModel: $scrollModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MobileStateImpl &&
            (identical(other.initModel, initModel) ||
                other.initModel == initModel) &&
            (identical(other.introModel, introModel) ||
                other.introModel == introModel) &&
            (identical(other.scrollModel, scrollModel) ||
                other.scrollModel == scrollModel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, initModel, introModel, scrollModel);

  /// Create a copy of MobileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MobileStateImplCopyWith<_$MobileStateImpl> get copyWith =>
      __$$MobileStateImplCopyWithImpl<_$MobileStateImpl>(this, _$identity);
}

abstract class _MobileState implements MobileState {
  const factory _MobileState(
      {final InitModel initModel,
      final IntroModel introModel,
      final ScrollModel scrollModel}) = _$MobileStateImpl;

  @override
  InitModel get initModel;
  @override
  IntroModel get introModel;
  @override
  ScrollModel get scrollModel;

  /// Create a copy of MobileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MobileStateImplCopyWith<_$MobileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
