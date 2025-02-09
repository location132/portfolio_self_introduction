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
  StateMachineController? get controller => throw _privateConstructorUsedError;
  List<SMIInput<bool>?> get buttonTriggers =>
      throw _privateConstructorUsedError;
  MainPageStatus get status => throw _privateConstructorUsedError;

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
      {StateMachineController? controller,
      List<SMIInput<bool>?> buttonTriggers,
      MainPageStatus status});
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
    Object? controller = freezed,
    Object? buttonTriggers = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as StateMachineController?,
      buttonTriggers: null == buttonTriggers
          ? _value.buttonTriggers
          : buttonTriggers // ignore: cast_nullable_to_non_nullable
              as List<SMIInput<bool>?>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MainPageStatus,
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
      {StateMachineController? controller,
      List<SMIInput<bool>?> buttonTriggers,
      MainPageStatus status});
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
    Object? controller = freezed,
    Object? buttonTriggers = null,
    Object? status = null,
  }) {
    return _then(_$MainPageStateImpl(
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as StateMachineController?,
      buttonTriggers: null == buttonTriggers
          ? _value._buttonTriggers
          : buttonTriggers // ignore: cast_nullable_to_non_nullable
              as List<SMIInput<bool>?>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MainPageStatus,
    ));
  }
}

/// @nodoc

class _$MainPageStateImpl extends _MainPageState {
  const _$MainPageStateImpl(
      {this.controller,
      final List<SMIInput<bool>?> buttonTriggers = const [],
      this.status = MainPageStatus.initial})
      : _buttonTriggers = buttonTriggers,
        super._();

  @override
  final StateMachineController? controller;
  final List<SMIInput<bool>?> _buttonTriggers;
  @override
  @JsonKey()
  List<SMIInput<bool>?> get buttonTriggers {
    if (_buttonTriggers is EqualUnmodifiableListView) return _buttonTriggers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_buttonTriggers);
  }

  @override
  @JsonKey()
  final MainPageStatus status;

  @override
  String toString() {
    return 'MainPageState(controller: $controller, buttonTriggers: $buttonTriggers, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainPageStateImpl &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            const DeepCollectionEquality()
                .equals(other._buttonTriggers, _buttonTriggers) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, controller,
      const DeepCollectionEquality().hash(_buttonTriggers), status);

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
      {final StateMachineController? controller,
      final List<SMIInput<bool>?> buttonTriggers,
      final MainPageStatus status}) = _$MainPageStateImpl;
  const _MainPageState._() : super._();

  @override
  StateMachineController? get controller;
  @override
  List<SMIInput<bool>?> get buttonTriggers;
  @override
  MainPageStatus get status;

  /// Create a copy of MainPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MainPageStateImplCopyWith<_$MainPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
