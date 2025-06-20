// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bottomSheet_menu_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BottomSheetMenuState {
  ScreenState get screenState => throw _privateConstructorUsedError;
  MenuOptionsModel? get menuOptionsModel => throw _privateConstructorUsedError;
  Map<int, int> get selectedOptions => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BottomSheetMenuStateCopyWith<BottomSheetMenuState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottomSheetMenuStateCopyWith<$Res> {
  factory $BottomSheetMenuStateCopyWith(BottomSheetMenuState value,
          $Res Function(BottomSheetMenuState) then) =
      _$BottomSheetMenuStateCopyWithImpl<$Res, BottomSheetMenuState>;
  @useResult
  $Res call(
      {ScreenState screenState,
      MenuOptionsModel? menuOptionsModel,
      Map<int, int> selectedOptions,
      int quantity});

  $MenuOptionsModelCopyWith<$Res>? get menuOptionsModel;
}

/// @nodoc
class _$BottomSheetMenuStateCopyWithImpl<$Res,
        $Val extends BottomSheetMenuState>
    implements $BottomSheetMenuStateCopyWith<$Res> {
  _$BottomSheetMenuStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screenState = null,
    Object? menuOptionsModel = freezed,
    Object? selectedOptions = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      screenState: null == screenState
          ? _value.screenState
          : screenState // ignore: cast_nullable_to_non_nullable
              as ScreenState,
      menuOptionsModel: freezed == menuOptionsModel
          ? _value.menuOptionsModel
          : menuOptionsModel // ignore: cast_nullable_to_non_nullable
              as MenuOptionsModel?,
      selectedOptions: null == selectedOptions
          ? _value.selectedOptions
          : selectedOptions // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MenuOptionsModelCopyWith<$Res>? get menuOptionsModel {
    if (_value.menuOptionsModel == null) {
      return null;
    }

    return $MenuOptionsModelCopyWith<$Res>(_value.menuOptionsModel!, (value) {
      return _then(_value.copyWith(menuOptionsModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BottomSheetMenuStateImplCopyWith<$Res>
    implements $BottomSheetMenuStateCopyWith<$Res> {
  factory _$$BottomSheetMenuStateImplCopyWith(_$BottomSheetMenuStateImpl value,
          $Res Function(_$BottomSheetMenuStateImpl) then) =
      __$$BottomSheetMenuStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ScreenState screenState,
      MenuOptionsModel? menuOptionsModel,
      Map<int, int> selectedOptions,
      int quantity});

  @override
  $MenuOptionsModelCopyWith<$Res>? get menuOptionsModel;
}

/// @nodoc
class __$$BottomSheetMenuStateImplCopyWithImpl<$Res>
    extends _$BottomSheetMenuStateCopyWithImpl<$Res, _$BottomSheetMenuStateImpl>
    implements _$$BottomSheetMenuStateImplCopyWith<$Res> {
  __$$BottomSheetMenuStateImplCopyWithImpl(_$BottomSheetMenuStateImpl _value,
      $Res Function(_$BottomSheetMenuStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screenState = null,
    Object? menuOptionsModel = freezed,
    Object? selectedOptions = null,
    Object? quantity = null,
  }) {
    return _then(_$BottomSheetMenuStateImpl(
      screenState: null == screenState
          ? _value.screenState
          : screenState // ignore: cast_nullable_to_non_nullable
              as ScreenState,
      menuOptionsModel: freezed == menuOptionsModel
          ? _value.menuOptionsModel
          : menuOptionsModel // ignore: cast_nullable_to_non_nullable
              as MenuOptionsModel?,
      selectedOptions: null == selectedOptions
          ? _value._selectedOptions
          : selectedOptions // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$BottomSheetMenuStateImpl implements _BottomSheetMenuState {
  const _$BottomSheetMenuStateImpl(
      {this.screenState = ScreenState.loading,
      this.menuOptionsModel,
      final Map<int, int> selectedOptions = const {},
      this.quantity = 1})
      : _selectedOptions = selectedOptions;

  @override
  @JsonKey()
  final ScreenState screenState;
  @override
  final MenuOptionsModel? menuOptionsModel;
  final Map<int, int> _selectedOptions;
  @override
  @JsonKey()
  Map<int, int> get selectedOptions {
    if (_selectedOptions is EqualUnmodifiableMapView) return _selectedOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_selectedOptions);
  }

  @override
  @JsonKey()
  final int quantity;

  @override
  String toString() {
    return 'BottomSheetMenuState(screenState: $screenState, menuOptionsModel: $menuOptionsModel, selectedOptions: $selectedOptions, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BottomSheetMenuStateImpl &&
            (identical(other.screenState, screenState) ||
                other.screenState == screenState) &&
            (identical(other.menuOptionsModel, menuOptionsModel) ||
                other.menuOptionsModel == menuOptionsModel) &&
            const DeepCollectionEquality()
                .equals(other._selectedOptions, _selectedOptions) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, screenState, menuOptionsModel,
      const DeepCollectionEquality().hash(_selectedOptions), quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BottomSheetMenuStateImplCopyWith<_$BottomSheetMenuStateImpl>
      get copyWith =>
          __$$BottomSheetMenuStateImplCopyWithImpl<_$BottomSheetMenuStateImpl>(
              this, _$identity);
}

abstract class _BottomSheetMenuState implements BottomSheetMenuState {
  const factory _BottomSheetMenuState(
      {final ScreenState screenState,
      final MenuOptionsModel? menuOptionsModel,
      final Map<int, int> selectedOptions,
      final int quantity}) = _$BottomSheetMenuStateImpl;

  @override
  ScreenState get screenState;
  @override
  MenuOptionsModel? get menuOptionsModel;
  @override
  Map<int, int> get selectedOptions;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$BottomSheetMenuStateImplCopyWith<_$BottomSheetMenuStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
