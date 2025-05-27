// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detailMe_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DetailMeModel {
  bool get isDetailMe => throw _privateConstructorUsedError;
  bool get isDetailMeRiveStart => throw _privateConstructorUsedError;

  /// Create a copy of DetailMeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailMeModelCopyWith<DetailMeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailMeModelCopyWith<$Res> {
  factory $DetailMeModelCopyWith(
    DetailMeModel value,
    $Res Function(DetailMeModel) then,
  ) = _$DetailMeModelCopyWithImpl<$Res, DetailMeModel>;
  @useResult
  $Res call({bool isDetailMe, bool isDetailMeRiveStart});
}

/// @nodoc
class _$DetailMeModelCopyWithImpl<$Res, $Val extends DetailMeModel>
    implements $DetailMeModelCopyWith<$Res> {
  _$DetailMeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailMeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isDetailMe = null, Object? isDetailMeRiveStart = null}) {
    return _then(
      _value.copyWith(
            isDetailMe:
                null == isDetailMe
                    ? _value.isDetailMe
                    : isDetailMe // ignore: cast_nullable_to_non_nullable
                        as bool,
            isDetailMeRiveStart:
                null == isDetailMeRiveStart
                    ? _value.isDetailMeRiveStart
                    : isDetailMeRiveStart // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DetailMeModelImplCopyWith<$Res>
    implements $DetailMeModelCopyWith<$Res> {
  factory _$$DetailMeModelImplCopyWith(
    _$DetailMeModelImpl value,
    $Res Function(_$DetailMeModelImpl) then,
  ) = __$$DetailMeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isDetailMe, bool isDetailMeRiveStart});
}

/// @nodoc
class __$$DetailMeModelImplCopyWithImpl<$Res>
    extends _$DetailMeModelCopyWithImpl<$Res, _$DetailMeModelImpl>
    implements _$$DetailMeModelImplCopyWith<$Res> {
  __$$DetailMeModelImplCopyWithImpl(
    _$DetailMeModelImpl _value,
    $Res Function(_$DetailMeModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DetailMeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isDetailMe = null, Object? isDetailMeRiveStart = null}) {
    return _then(
      _$DetailMeModelImpl(
        isDetailMe:
            null == isDetailMe
                ? _value.isDetailMe
                : isDetailMe // ignore: cast_nullable_to_non_nullable
                    as bool,
        isDetailMeRiveStart:
            null == isDetailMeRiveStart
                ? _value.isDetailMeRiveStart
                : isDetailMeRiveStart // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$DetailMeModelImpl implements _DetailMeModel {
  const _$DetailMeModelImpl({
    this.isDetailMe = false,
    this.isDetailMeRiveStart = false,
  });

  @override
  @JsonKey()
  final bool isDetailMe;
  @override
  @JsonKey()
  final bool isDetailMeRiveStart;

  @override
  String toString() {
    return 'DetailMeModel(isDetailMe: $isDetailMe, isDetailMeRiveStart: $isDetailMeRiveStart)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailMeModelImpl &&
            (identical(other.isDetailMe, isDetailMe) ||
                other.isDetailMe == isDetailMe) &&
            (identical(other.isDetailMeRiveStart, isDetailMeRiveStart) ||
                other.isDetailMeRiveStart == isDetailMeRiveStart));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDetailMe, isDetailMeRiveStart);

  /// Create a copy of DetailMeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailMeModelImplCopyWith<_$DetailMeModelImpl> get copyWith =>
      __$$DetailMeModelImplCopyWithImpl<_$DetailMeModelImpl>(this, _$identity);
}

abstract class _DetailMeModel implements DetailMeModel {
  const factory _DetailMeModel({
    final bool isDetailMe,
    final bool isDetailMeRiveStart,
  }) = _$DetailMeModelImpl;

  @override
  bool get isDetailMe;
  @override
  bool get isDetailMeRiveStart;

  /// Create a copy of DetailMeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailMeModelImplCopyWith<_$DetailMeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
