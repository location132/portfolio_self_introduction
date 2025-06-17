// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ProjectDetailState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoaded => throw _privateConstructorUsedError;
  bool get isScrollEnabled => throw _privateConstructorUsedError;
  String get projectName => throw _privateConstructorUsedError;
  ScrollController? get scrollController =>
      throw _privateConstructorUsedError; // 메뉴 상태
  bool get isMenuClicked => throw _privateConstructorUsedError;

  /// Create a copy of ProjectDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectDetailStateCopyWith<ProjectDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectDetailStateCopyWith<$Res> {
  factory $ProjectDetailStateCopyWith(
    ProjectDetailState value,
    $Res Function(ProjectDetailState) then,
  ) = _$ProjectDetailStateCopyWithImpl<$Res, ProjectDetailState>;
  @useResult
  $Res call({
    bool isLoading,
    bool isLoaded,
    bool isScrollEnabled,
    String projectName,
    ScrollController? scrollController,
    bool isMenuClicked,
  });
}

/// @nodoc
class _$ProjectDetailStateCopyWithImpl<$Res, $Val extends ProjectDetailState>
    implements $ProjectDetailStateCopyWith<$Res> {
  _$ProjectDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isLoaded = null,
    Object? isScrollEnabled = null,
    Object? projectName = null,
    Object? scrollController = freezed,
    Object? isMenuClicked = null,
  }) {
    return _then(
      _value.copyWith(
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            isLoaded:
                null == isLoaded
                    ? _value.isLoaded
                    : isLoaded // ignore: cast_nullable_to_non_nullable
                        as bool,
            isScrollEnabled:
                null == isScrollEnabled
                    ? _value.isScrollEnabled
                    : isScrollEnabled // ignore: cast_nullable_to_non_nullable
                        as bool,
            projectName:
                null == projectName
                    ? _value.projectName
                    : projectName // ignore: cast_nullable_to_non_nullable
                        as String,
            scrollController:
                freezed == scrollController
                    ? _value.scrollController
                    : scrollController // ignore: cast_nullable_to_non_nullable
                        as ScrollController?,
            isMenuClicked:
                null == isMenuClicked
                    ? _value.isMenuClicked
                    : isMenuClicked // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProjectDetailStateImplCopyWith<$Res>
    implements $ProjectDetailStateCopyWith<$Res> {
  factory _$$ProjectDetailStateImplCopyWith(
    _$ProjectDetailStateImpl value,
    $Res Function(_$ProjectDetailStateImpl) then,
  ) = __$$ProjectDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    bool isLoaded,
    bool isScrollEnabled,
    String projectName,
    ScrollController? scrollController,
    bool isMenuClicked,
  });
}

/// @nodoc
class __$$ProjectDetailStateImplCopyWithImpl<$Res>
    extends _$ProjectDetailStateCopyWithImpl<$Res, _$ProjectDetailStateImpl>
    implements _$$ProjectDetailStateImplCopyWith<$Res> {
  __$$ProjectDetailStateImplCopyWithImpl(
    _$ProjectDetailStateImpl _value,
    $Res Function(_$ProjectDetailStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProjectDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isLoaded = null,
    Object? isScrollEnabled = null,
    Object? projectName = null,
    Object? scrollController = freezed,
    Object? isMenuClicked = null,
  }) {
    return _then(
      _$ProjectDetailStateImpl(
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        isLoaded:
            null == isLoaded
                ? _value.isLoaded
                : isLoaded // ignore: cast_nullable_to_non_nullable
                    as bool,
        isScrollEnabled:
            null == isScrollEnabled
                ? _value.isScrollEnabled
                : isScrollEnabled // ignore: cast_nullable_to_non_nullable
                    as bool,
        projectName:
            null == projectName
                ? _value.projectName
                : projectName // ignore: cast_nullable_to_non_nullable
                    as String,
        scrollController:
            freezed == scrollController
                ? _value.scrollController
                : scrollController // ignore: cast_nullable_to_non_nullable
                    as ScrollController?,
        isMenuClicked:
            null == isMenuClicked
                ? _value.isMenuClicked
                : isMenuClicked // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$ProjectDetailStateImpl implements _ProjectDetailState {
  const _$ProjectDetailStateImpl({
    this.isLoading = false,
    this.isLoaded = false,
    this.isScrollEnabled = false,
    this.projectName = '',
    this.scrollController,
    this.isMenuClicked = false,
  });

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isLoaded;
  @override
  @JsonKey()
  final bool isScrollEnabled;
  @override
  @JsonKey()
  final String projectName;
  @override
  final ScrollController? scrollController;
  // 메뉴 상태
  @override
  @JsonKey()
  final bool isMenuClicked;

  @override
  String toString() {
    return 'ProjectDetailState(isLoading: $isLoading, isLoaded: $isLoaded, isScrollEnabled: $isScrollEnabled, projectName: $projectName, scrollController: $scrollController, isMenuClicked: $isMenuClicked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectDetailStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoaded, isLoaded) ||
                other.isLoaded == isLoaded) &&
            (identical(other.isScrollEnabled, isScrollEnabled) ||
                other.isScrollEnabled == isScrollEnabled) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.scrollController, scrollController) ||
                other.scrollController == scrollController) &&
            (identical(other.isMenuClicked, isMenuClicked) ||
                other.isMenuClicked == isMenuClicked));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    isLoaded,
    isScrollEnabled,
    projectName,
    scrollController,
    isMenuClicked,
  );

  /// Create a copy of ProjectDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectDetailStateImplCopyWith<_$ProjectDetailStateImpl> get copyWith =>
      __$$ProjectDetailStateImplCopyWithImpl<_$ProjectDetailStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ProjectDetailState implements ProjectDetailState {
  const factory _ProjectDetailState({
    final bool isLoading,
    final bool isLoaded,
    final bool isScrollEnabled,
    final String projectName,
    final ScrollController? scrollController,
    final bool isMenuClicked,
  }) = _$ProjectDetailStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isLoaded;
  @override
  bool get isScrollEnabled;
  @override
  String get projectName;
  @override
  ScrollController? get scrollController; // 메뉴 상태
  @override
  bool get isMenuClicked;

  /// Create a copy of ProjectDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectDetailStateImplCopyWith<_$ProjectDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
