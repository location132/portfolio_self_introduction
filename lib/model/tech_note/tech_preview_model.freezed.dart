// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tech_preview_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TechPreviewModel {
  String get title => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  String get keyValue => throw _privateConstructorUsedError;

  /// Create a copy of TechPreviewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TechPreviewModelCopyWith<TechPreviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TechPreviewModelCopyWith<$Res> {
  factory $TechPreviewModelCopyWith(
    TechPreviewModel value,
    $Res Function(TechPreviewModel) then,
  ) = _$TechPreviewModelCopyWithImpl<$Res, TechPreviewModel>;
  @useResult
  $Res call({String title, String imagePath, String keyValue});
}

/// @nodoc
class _$TechPreviewModelCopyWithImpl<$Res, $Val extends TechPreviewModel>
    implements $TechPreviewModelCopyWith<$Res> {
  _$TechPreviewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TechPreviewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? imagePath = null,
    Object? keyValue = null,
  }) {
    return _then(
      _value.copyWith(
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            imagePath:
                null == imagePath
                    ? _value.imagePath
                    : imagePath // ignore: cast_nullable_to_non_nullable
                        as String,
            keyValue:
                null == keyValue
                    ? _value.keyValue
                    : keyValue // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TechPreviewModelImplCopyWith<$Res>
    implements $TechPreviewModelCopyWith<$Res> {
  factory _$$TechPreviewModelImplCopyWith(
    _$TechPreviewModelImpl value,
    $Res Function(_$TechPreviewModelImpl) then,
  ) = __$$TechPreviewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String imagePath, String keyValue});
}

/// @nodoc
class __$$TechPreviewModelImplCopyWithImpl<$Res>
    extends _$TechPreviewModelCopyWithImpl<$Res, _$TechPreviewModelImpl>
    implements _$$TechPreviewModelImplCopyWith<$Res> {
  __$$TechPreviewModelImplCopyWithImpl(
    _$TechPreviewModelImpl _value,
    $Res Function(_$TechPreviewModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TechPreviewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? imagePath = null,
    Object? keyValue = null,
  }) {
    return _then(
      _$TechPreviewModelImpl(
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        imagePath:
            null == imagePath
                ? _value.imagePath
                : imagePath // ignore: cast_nullable_to_non_nullable
                    as String,
        keyValue:
            null == keyValue
                ? _value.keyValue
                : keyValue // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$TechPreviewModelImpl implements _TechPreviewModel {
  const _$TechPreviewModelImpl({
    required this.title,
    required this.imagePath,
    required this.keyValue,
  });

  @override
  final String title;
  @override
  final String imagePath;
  @override
  final String keyValue;

  @override
  String toString() {
    return 'TechPreviewModel(title: $title, imagePath: $imagePath, keyValue: $keyValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TechPreviewModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.keyValue, keyValue) ||
                other.keyValue == keyValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, imagePath, keyValue);

  /// Create a copy of TechPreviewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TechPreviewModelImplCopyWith<_$TechPreviewModelImpl> get copyWith =>
      __$$TechPreviewModelImplCopyWithImpl<_$TechPreviewModelImpl>(
        this,
        _$identity,
      );
}

abstract class _TechPreviewModel implements TechPreviewModel {
  const factory _TechPreviewModel({
    required final String title,
    required final String imagePath,
    required final String keyValue,
  }) = _$TechPreviewModelImpl;

  @override
  String get title;
  @override
  String get imagePath;
  @override
  String get keyValue;

  /// Create a copy of TechPreviewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TechPreviewModelImplCopyWith<_$TechPreviewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
