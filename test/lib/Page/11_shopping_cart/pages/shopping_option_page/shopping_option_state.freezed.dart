// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_option_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ShoppingOptionState {
  ScreenState get screenState => throw _privateConstructorUsedError;
  List<CartModel>? get cartModel => throw _privateConstructorUsedError;
  MenuOptionsModel? get menuOptionsModel => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShoppingOptionStateCopyWith<ShoppingOptionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingOptionStateCopyWith<$Res> {
  factory $ShoppingOptionStateCopyWith(
          ShoppingOptionState value, $Res Function(ShoppingOptionState) then) =
      _$ShoppingOptionStateCopyWithImpl<$Res, ShoppingOptionState>;
  @useResult
  $Res call(
      {ScreenState screenState,
      List<CartModel>? cartModel,
      MenuOptionsModel? menuOptionsModel,
      int quantity});

  $MenuOptionsModelCopyWith<$Res>? get menuOptionsModel;
}

/// @nodoc
class _$ShoppingOptionStateCopyWithImpl<$Res, $Val extends ShoppingOptionState>
    implements $ShoppingOptionStateCopyWith<$Res> {
  _$ShoppingOptionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screenState = null,
    Object? cartModel = freezed,
    Object? menuOptionsModel = freezed,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      screenState: null == screenState
          ? _value.screenState
          : screenState // ignore: cast_nullable_to_non_nullable
              as ScreenState,
      cartModel: freezed == cartModel
          ? _value.cartModel
          : cartModel // ignore: cast_nullable_to_non_nullable
              as List<CartModel>?,
      menuOptionsModel: freezed == menuOptionsModel
          ? _value.menuOptionsModel
          : menuOptionsModel // ignore: cast_nullable_to_non_nullable
              as MenuOptionsModel?,
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
abstract class _$$ShoppingOptionStateImplCopyWith<$Res>
    implements $ShoppingOptionStateCopyWith<$Res> {
  factory _$$ShoppingOptionStateImplCopyWith(_$ShoppingOptionStateImpl value,
          $Res Function(_$ShoppingOptionStateImpl) then) =
      __$$ShoppingOptionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ScreenState screenState,
      List<CartModel>? cartModel,
      MenuOptionsModel? menuOptionsModel,
      int quantity});

  @override
  $MenuOptionsModelCopyWith<$Res>? get menuOptionsModel;
}

/// @nodoc
class __$$ShoppingOptionStateImplCopyWithImpl<$Res>
    extends _$ShoppingOptionStateCopyWithImpl<$Res, _$ShoppingOptionStateImpl>
    implements _$$ShoppingOptionStateImplCopyWith<$Res> {
  __$$ShoppingOptionStateImplCopyWithImpl(_$ShoppingOptionStateImpl _value,
      $Res Function(_$ShoppingOptionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screenState = null,
    Object? cartModel = freezed,
    Object? menuOptionsModel = freezed,
    Object? quantity = null,
  }) {
    return _then(_$ShoppingOptionStateImpl(
      screenState: null == screenState
          ? _value.screenState
          : screenState // ignore: cast_nullable_to_non_nullable
              as ScreenState,
      cartModel: freezed == cartModel
          ? _value._cartModel
          : cartModel // ignore: cast_nullable_to_non_nullable
              as List<CartModel>?,
      menuOptionsModel: freezed == menuOptionsModel
          ? _value.menuOptionsModel
          : menuOptionsModel // ignore: cast_nullable_to_non_nullable
              as MenuOptionsModel?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ShoppingOptionStateImpl implements _ShoppingOptionState {
  const _$ShoppingOptionStateImpl(
      {this.screenState = ScreenState.loading,
      final List<CartModel>? cartModel,
      this.menuOptionsModel,
      this.quantity = 1})
      : _cartModel = cartModel;

  @override
  @JsonKey()
  final ScreenState screenState;
  final List<CartModel>? _cartModel;
  @override
  List<CartModel>? get cartModel {
    final value = _cartModel;
    if (value == null) return null;
    if (_cartModel is EqualUnmodifiableListView) return _cartModel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final MenuOptionsModel? menuOptionsModel;
  @override
  @JsonKey()
  final int quantity;

  @override
  String toString() {
    return 'ShoppingOptionState(screenState: $screenState, cartModel: $cartModel, menuOptionsModel: $menuOptionsModel, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingOptionStateImpl &&
            (identical(other.screenState, screenState) ||
                other.screenState == screenState) &&
            const DeepCollectionEquality()
                .equals(other._cartModel, _cartModel) &&
            (identical(other.menuOptionsModel, menuOptionsModel) ||
                other.menuOptionsModel == menuOptionsModel) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      screenState,
      const DeepCollectionEquality().hash(_cartModel),
      menuOptionsModel,
      quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingOptionStateImplCopyWith<_$ShoppingOptionStateImpl> get copyWith =>
      __$$ShoppingOptionStateImplCopyWithImpl<_$ShoppingOptionStateImpl>(
          this, _$identity);
}

abstract class _ShoppingOptionState implements ShoppingOptionState {
  const factory _ShoppingOptionState(
      {final ScreenState screenState,
      final List<CartModel>? cartModel,
      final MenuOptionsModel? menuOptionsModel,
      final int quantity}) = _$ShoppingOptionStateImpl;

  @override
  ScreenState get screenState;
  @override
  List<CartModel>? get cartModel;
  @override
  MenuOptionsModel? get menuOptionsModel;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$ShoppingOptionStateImplCopyWith<_$ShoppingOptionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
