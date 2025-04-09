// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scrollActivity_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ScrollActivityModel {
  ScrollStatus get scrollActivityStatus => throw _privateConstructorUsedError;
  ScrollController? get scrollController => throw _privateConstructorUsedError;

  /// Create a copy of ScrollActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScrollActivityModelCopyWith<ScrollActivityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScrollActivityModelCopyWith<$Res> {
  factory $ScrollActivityModelCopyWith(
          ScrollActivityModel value, $Res Function(ScrollActivityModel) then) =
      _$ScrollActivityModelCopyWithImpl<$Res, ScrollActivityModel>;
  @useResult
  $Res call(
      {ScrollStatus scrollActivityStatus, ScrollController? scrollController});
}

/// @nodoc
class _$ScrollActivityModelCopyWithImpl<$Res, $Val extends ScrollActivityModel>
    implements $ScrollActivityModelCopyWith<$Res> {
  _$ScrollActivityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScrollActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scrollActivityStatus = null,
    Object? scrollController = freezed,
  }) {
    return _then(_value.copyWith(
      scrollActivityStatus: null == scrollActivityStatus
          ? _value.scrollActivityStatus
          : scrollActivityStatus // ignore: cast_nullable_to_non_nullable
              as ScrollStatus,
      scrollController: freezed == scrollController
          ? _value.scrollController
          : scrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScrollActivityModelImplCopyWith<$Res>
    implements $ScrollActivityModelCopyWith<$Res> {
  factory _$$ScrollActivityModelImplCopyWith(_$ScrollActivityModelImpl value,
          $Res Function(_$ScrollActivityModelImpl) then) =
      __$$ScrollActivityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ScrollStatus scrollActivityStatus, ScrollController? scrollController});
}

/// @nodoc
class __$$ScrollActivityModelImplCopyWithImpl<$Res>
    extends _$ScrollActivityModelCopyWithImpl<$Res, _$ScrollActivityModelImpl>
    implements _$$ScrollActivityModelImplCopyWith<$Res> {
  __$$ScrollActivityModelImplCopyWithImpl(_$ScrollActivityModelImpl _value,
      $Res Function(_$ScrollActivityModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScrollActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scrollActivityStatus = null,
    Object? scrollController = freezed,
  }) {
    return _then(_$ScrollActivityModelImpl(
      scrollActivityStatus: null == scrollActivityStatus
          ? _value.scrollActivityStatus
          : scrollActivityStatus // ignore: cast_nullable_to_non_nullable
              as ScrollStatus,
      scrollController: freezed == scrollController
          ? _value.scrollController
          : scrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController?,
    ));
  }
}

/// @nodoc

class _$ScrollActivityModelImpl implements _ScrollActivityModel {
  const _$ScrollActivityModelImpl(
      {this.scrollActivityStatus = ScrollStatus.stopped,
      this.scrollController});

  @override
  @JsonKey()
  final ScrollStatus scrollActivityStatus;
  @override
  final ScrollController? scrollController;

  @override
  String toString() {
    return 'ScrollActivityModel(scrollActivityStatus: $scrollActivityStatus, scrollController: $scrollController)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScrollActivityModelImpl &&
            (identical(other.scrollActivityStatus, scrollActivityStatus) ||
                other.scrollActivityStatus == scrollActivityStatus) &&
            (identical(other.scrollController, scrollController) ||
                other.scrollController == scrollController));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, scrollActivityStatus, scrollController);

  /// Create a copy of ScrollActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScrollActivityModelImplCopyWith<_$ScrollActivityModelImpl> get copyWith =>
      __$$ScrollActivityModelImplCopyWithImpl<_$ScrollActivityModelImpl>(
          this, _$identity);
}

abstract class _ScrollActivityModel implements ScrollActivityModel {
  const factory _ScrollActivityModel(
      {final ScrollStatus scrollActivityStatus,
      final ScrollController? scrollController}) = _$ScrollActivityModelImpl;

  @override
  ScrollStatus get scrollActivityStatus;
  @override
  ScrollController? get scrollController;

  /// Create a copy of ScrollActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScrollActivityModelImplCopyWith<_$ScrollActivityModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
