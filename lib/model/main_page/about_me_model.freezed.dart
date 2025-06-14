// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'about_me_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AboutMeModel {
  bool get isContentActive => throw _privateConstructorUsedError;

  /// Create a copy of AboutMeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AboutMeModelCopyWith<AboutMeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AboutMeModelCopyWith<$Res> {
  factory $AboutMeModelCopyWith(
    AboutMeModel value,
    $Res Function(AboutMeModel) then,
  ) = _$AboutMeModelCopyWithImpl<$Res, AboutMeModel>;
  @useResult
  $Res call({bool isContentActive});
}

/// @nodoc
class _$AboutMeModelCopyWithImpl<$Res, $Val extends AboutMeModel>
    implements $AboutMeModelCopyWith<$Res> {
  _$AboutMeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AboutMeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isContentActive = null}) {
    return _then(
      _value.copyWith(
            isContentActive:
                null == isContentActive
                    ? _value.isContentActive
                    : isContentActive // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AboutMeModelImplCopyWith<$Res>
    implements $AboutMeModelCopyWith<$Res> {
  factory _$$AboutMeModelImplCopyWith(
    _$AboutMeModelImpl value,
    $Res Function(_$AboutMeModelImpl) then,
  ) = __$$AboutMeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isContentActive});
}

/// @nodoc
class __$$AboutMeModelImplCopyWithImpl<$Res>
    extends _$AboutMeModelCopyWithImpl<$Res, _$AboutMeModelImpl>
    implements _$$AboutMeModelImplCopyWith<$Res> {
  __$$AboutMeModelImplCopyWithImpl(
    _$AboutMeModelImpl _value,
    $Res Function(_$AboutMeModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AboutMeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isContentActive = null}) {
    return _then(
      _$AboutMeModelImpl(
        isContentActive:
            null == isContentActive
                ? _value.isContentActive
                : isContentActive // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$AboutMeModelImpl implements _AboutMeModel {
  const _$AboutMeModelImpl({this.isContentActive = false});

  @override
  @JsonKey()
  final bool isContentActive;

  @override
  String toString() {
    return 'AboutMeModel(isContentActive: $isContentActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AboutMeModelImpl &&
            (identical(other.isContentActive, isContentActive) ||
                other.isContentActive == isContentActive));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isContentActive);

  /// Create a copy of AboutMeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AboutMeModelImplCopyWith<_$AboutMeModelImpl> get copyWith =>
      __$$AboutMeModelImplCopyWithImpl<_$AboutMeModelImpl>(this, _$identity);
}

abstract class _AboutMeModel implements AboutMeModel {
  const factory _AboutMeModel({final bool isContentActive}) =
      _$AboutMeModelImpl;

  @override
  bool get isContentActive;

  /// Create a copy of AboutMeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AboutMeModelImplCopyWith<_$AboutMeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
