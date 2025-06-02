// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ProjectModel {
  bool get isVisible => throw _privateConstructorUsedError;
  bool get isBackGroundAniStart => throw _privateConstructorUsedError;
  bool get isTitleAniStart => throw _privateConstructorUsedError;
  bool get isProjectItemsAniStart => throw _privateConstructorUsedError;
  bool get isProjectViewInit => throw _privateConstructorUsedError;

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectModelCopyWith<ProjectModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectModelCopyWith<$Res> {
  factory $ProjectModelCopyWith(
    ProjectModel value,
    $Res Function(ProjectModel) then,
  ) = _$ProjectModelCopyWithImpl<$Res, ProjectModel>;
  @useResult
  $Res call({
    bool isVisible,
    bool isBackGroundAniStart,
    bool isTitleAniStart,
    bool isProjectItemsAniStart,
    bool isProjectViewInit,
  });
}

/// @nodoc
class _$ProjectModelCopyWithImpl<$Res, $Val extends ProjectModel>
    implements $ProjectModelCopyWith<$Res> {
  _$ProjectModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isVisible = null,
    Object? isBackGroundAniStart = null,
    Object? isTitleAniStart = null,
    Object? isProjectItemsAniStart = null,
    Object? isProjectViewInit = null,
  }) {
    return _then(
      _value.copyWith(
            isVisible:
                null == isVisible
                    ? _value.isVisible
                    : isVisible // ignore: cast_nullable_to_non_nullable
                        as bool,
            isBackGroundAniStart:
                null == isBackGroundAniStart
                    ? _value.isBackGroundAniStart
                    : isBackGroundAniStart // ignore: cast_nullable_to_non_nullable
                        as bool,
            isTitleAniStart:
                null == isTitleAniStart
                    ? _value.isTitleAniStart
                    : isTitleAniStart // ignore: cast_nullable_to_non_nullable
                        as bool,
            isProjectItemsAniStart:
                null == isProjectItemsAniStart
                    ? _value.isProjectItemsAniStart
                    : isProjectItemsAniStart // ignore: cast_nullable_to_non_nullable
                        as bool,
            isProjectViewInit:
                null == isProjectViewInit
                    ? _value.isProjectViewInit
                    : isProjectViewInit // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProjectModelImplCopyWith<$Res>
    implements $ProjectModelCopyWith<$Res> {
  factory _$$ProjectModelImplCopyWith(
    _$ProjectModelImpl value,
    $Res Function(_$ProjectModelImpl) then,
  ) = __$$ProjectModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isVisible,
    bool isBackGroundAniStart,
    bool isTitleAniStart,
    bool isProjectItemsAniStart,
    bool isProjectViewInit,
  });
}

/// @nodoc
class __$$ProjectModelImplCopyWithImpl<$Res>
    extends _$ProjectModelCopyWithImpl<$Res, _$ProjectModelImpl>
    implements _$$ProjectModelImplCopyWith<$Res> {
  __$$ProjectModelImplCopyWithImpl(
    _$ProjectModelImpl _value,
    $Res Function(_$ProjectModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isVisible = null,
    Object? isBackGroundAniStart = null,
    Object? isTitleAniStart = null,
    Object? isProjectItemsAniStart = null,
    Object? isProjectViewInit = null,
  }) {
    return _then(
      _$ProjectModelImpl(
        isVisible:
            null == isVisible
                ? _value.isVisible
                : isVisible // ignore: cast_nullable_to_non_nullable
                    as bool,
        isBackGroundAniStart:
            null == isBackGroundAniStart
                ? _value.isBackGroundAniStart
                : isBackGroundAniStart // ignore: cast_nullable_to_non_nullable
                    as bool,
        isTitleAniStart:
            null == isTitleAniStart
                ? _value.isTitleAniStart
                : isTitleAniStart // ignore: cast_nullable_to_non_nullable
                    as bool,
        isProjectItemsAniStart:
            null == isProjectItemsAniStart
                ? _value.isProjectItemsAniStart
                : isProjectItemsAniStart // ignore: cast_nullable_to_non_nullable
                    as bool,
        isProjectViewInit:
            null == isProjectViewInit
                ? _value.isProjectViewInit
                : isProjectViewInit // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$ProjectModelImpl implements _ProjectModel {
  const _$ProjectModelImpl({
    this.isVisible = false,
    this.isBackGroundAniStart = false,
    this.isTitleAniStart = false,
    this.isProjectItemsAniStart = false,
    this.isProjectViewInit = false,
  });

  @override
  @JsonKey()
  final bool isVisible;
  @override
  @JsonKey()
  final bool isBackGroundAniStart;
  @override
  @JsonKey()
  final bool isTitleAniStart;
  @override
  @JsonKey()
  final bool isProjectItemsAniStart;
  @override
  @JsonKey()
  final bool isProjectViewInit;

  @override
  String toString() {
    return 'ProjectModel(isVisible: $isVisible, isBackGroundAniStart: $isBackGroundAniStart, isTitleAniStart: $isTitleAniStart, isProjectItemsAniStart: $isProjectItemsAniStart, isProjectViewInit: $isProjectViewInit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectModelImpl &&
            (identical(other.isVisible, isVisible) ||
                other.isVisible == isVisible) &&
            (identical(other.isBackGroundAniStart, isBackGroundAniStart) ||
                other.isBackGroundAniStart == isBackGroundAniStart) &&
            (identical(other.isTitleAniStart, isTitleAniStart) ||
                other.isTitleAniStart == isTitleAniStart) &&
            (identical(other.isProjectItemsAniStart, isProjectItemsAniStart) ||
                other.isProjectItemsAniStart == isProjectItemsAniStart) &&
            (identical(other.isProjectViewInit, isProjectViewInit) ||
                other.isProjectViewInit == isProjectViewInit));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isVisible,
    isBackGroundAniStart,
    isTitleAniStart,
    isProjectItemsAniStart,
    isProjectViewInit,
  );

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectModelImplCopyWith<_$ProjectModelImpl> get copyWith =>
      __$$ProjectModelImplCopyWithImpl<_$ProjectModelImpl>(this, _$identity);
}

abstract class _ProjectModel implements ProjectModel {
  const factory _ProjectModel({
    final bool isVisible,
    final bool isBackGroundAniStart,
    final bool isTitleAniStart,
    final bool isProjectItemsAniStart,
    final bool isProjectViewInit,
  }) = _$ProjectModelImpl;

  @override
  bool get isVisible;
  @override
  bool get isBackGroundAniStart;
  @override
  bool get isTitleAniStart;
  @override
  bool get isProjectItemsAniStart;
  @override
  bool get isProjectViewInit;

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectModelImplCopyWith<_$ProjectModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
