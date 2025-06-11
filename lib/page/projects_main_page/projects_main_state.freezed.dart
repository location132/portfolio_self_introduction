// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'projects_main_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ProjectsMainState {
  // 프로젝트 모델
  ProjectModel get projectModel =>
      throw _privateConstructorUsedError; //네비게이션 애니메이션 상태
  bool get isNaviAniStart => throw _privateConstructorUsedError;

  /// Create a copy of ProjectsMainState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectsMainStateCopyWith<ProjectsMainState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectsMainStateCopyWith<$Res> {
  factory $ProjectsMainStateCopyWith(
    ProjectsMainState value,
    $Res Function(ProjectsMainState) then,
  ) = _$ProjectsMainStateCopyWithImpl<$Res, ProjectsMainState>;
  @useResult
  $Res call({ProjectModel projectModel, bool isNaviAniStart});

  $ProjectModelCopyWith<$Res> get projectModel;
}

/// @nodoc
class _$ProjectsMainStateCopyWithImpl<$Res, $Val extends ProjectsMainState>
    implements $ProjectsMainStateCopyWith<$Res> {
  _$ProjectsMainStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectsMainState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? projectModel = null, Object? isNaviAniStart = null}) {
    return _then(
      _value.copyWith(
            projectModel:
                null == projectModel
                    ? _value.projectModel
                    : projectModel // ignore: cast_nullable_to_non_nullable
                        as ProjectModel,
            isNaviAniStart:
                null == isNaviAniStart
                    ? _value.isNaviAniStart
                    : isNaviAniStart // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of ProjectsMainState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProjectModelCopyWith<$Res> get projectModel {
    return $ProjectModelCopyWith<$Res>(_value.projectModel, (value) {
      return _then(_value.copyWith(projectModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProjectsMainStateImplCopyWith<$Res>
    implements $ProjectsMainStateCopyWith<$Res> {
  factory _$$ProjectsMainStateImplCopyWith(
    _$ProjectsMainStateImpl value,
    $Res Function(_$ProjectsMainStateImpl) then,
  ) = __$$ProjectsMainStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProjectModel projectModel, bool isNaviAniStart});

  @override
  $ProjectModelCopyWith<$Res> get projectModel;
}

/// @nodoc
class __$$ProjectsMainStateImplCopyWithImpl<$Res>
    extends _$ProjectsMainStateCopyWithImpl<$Res, _$ProjectsMainStateImpl>
    implements _$$ProjectsMainStateImplCopyWith<$Res> {
  __$$ProjectsMainStateImplCopyWithImpl(
    _$ProjectsMainStateImpl _value,
    $Res Function(_$ProjectsMainStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProjectsMainState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? projectModel = null, Object? isNaviAniStart = null}) {
    return _then(
      _$ProjectsMainStateImpl(
        projectModel:
            null == projectModel
                ? _value.projectModel
                : projectModel // ignore: cast_nullable_to_non_nullable
                    as ProjectModel,
        isNaviAniStart:
            null == isNaviAniStart
                ? _value.isNaviAniStart
                : isNaviAniStart // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$ProjectsMainStateImpl implements _ProjectsMainState {
  const _$ProjectsMainStateImpl({
    this.projectModel = const ProjectModel(),
    this.isNaviAniStart = false,
  });

  // 프로젝트 모델
  @override
  @JsonKey()
  final ProjectModel projectModel;
  //네비게이션 애니메이션 상태
  @override
  @JsonKey()
  final bool isNaviAniStart;

  @override
  String toString() {
    return 'ProjectsMainState(projectModel: $projectModel, isNaviAniStart: $isNaviAniStart)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectsMainStateImpl &&
            (identical(other.projectModel, projectModel) ||
                other.projectModel == projectModel) &&
            (identical(other.isNaviAniStart, isNaviAniStart) ||
                other.isNaviAniStart == isNaviAniStart));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectModel, isNaviAniStart);

  /// Create a copy of ProjectsMainState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectsMainStateImplCopyWith<_$ProjectsMainStateImpl> get copyWith =>
      __$$ProjectsMainStateImplCopyWithImpl<_$ProjectsMainStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ProjectsMainState implements ProjectsMainState {
  const factory _ProjectsMainState({
    final ProjectModel projectModel,
    final bool isNaviAniStart,
  }) = _$ProjectsMainStateImpl;

  // 프로젝트 모델
  @override
  ProjectModel get projectModel; //네비게이션 애니메이션 상태
  @override
  bool get isNaviAniStart;

  /// Create a copy of ProjectsMainState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectsMainStateImplCopyWith<_$ProjectsMainStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
