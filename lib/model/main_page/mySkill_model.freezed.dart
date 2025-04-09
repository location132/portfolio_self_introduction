// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mySkill_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MySkillModel {
  MySkillViewStatus get status => throw _privateConstructorUsedError;

  /// Create a copy of MySkillModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MySkillModelCopyWith<MySkillModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MySkillModelCopyWith<$Res> {
  factory $MySkillModelCopyWith(
          MySkillModel value, $Res Function(MySkillModel) then) =
      _$MySkillModelCopyWithImpl<$Res, MySkillModel>;
  @useResult
  $Res call({MySkillViewStatus status});
}

/// @nodoc
class _$MySkillModelCopyWithImpl<$Res, $Val extends MySkillModel>
    implements $MySkillModelCopyWith<$Res> {
  _$MySkillModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MySkillModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MySkillViewStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MySkillModelImplCopyWith<$Res>
    implements $MySkillModelCopyWith<$Res> {
  factory _$$MySkillModelImplCopyWith(
          _$MySkillModelImpl value, $Res Function(_$MySkillModelImpl) then) =
      __$$MySkillModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MySkillViewStatus status});
}

/// @nodoc
class __$$MySkillModelImplCopyWithImpl<$Res>
    extends _$MySkillModelCopyWithImpl<$Res, _$MySkillModelImpl>
    implements _$$MySkillModelImplCopyWith<$Res> {
  __$$MySkillModelImplCopyWithImpl(
      _$MySkillModelImpl _value, $Res Function(_$MySkillModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MySkillModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$MySkillModelImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MySkillViewStatus,
    ));
  }
}

/// @nodoc

class _$MySkillModelImpl implements _MySkillModel {
  const _$MySkillModelImpl({this.status = MySkillViewStatus.init});

  @override
  @JsonKey()
  final MySkillViewStatus status;

  @override
  String toString() {
    return 'MySkillModel(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MySkillModelImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  /// Create a copy of MySkillModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MySkillModelImplCopyWith<_$MySkillModelImpl> get copyWith =>
      __$$MySkillModelImplCopyWithImpl<_$MySkillModelImpl>(this, _$identity);
}

abstract class _MySkillModel implements MySkillModel {
  const factory _MySkillModel({final MySkillViewStatus status}) =
      _$MySkillModelImpl;

  @override
  MySkillViewStatus get status;

  /// Create a copy of MySkillModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MySkillModelImplCopyWith<_$MySkillModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
