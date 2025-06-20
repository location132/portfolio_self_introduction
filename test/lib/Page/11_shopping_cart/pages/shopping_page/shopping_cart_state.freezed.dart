// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ShoppingCartState {
  ScreenState get screenState => throw _privateConstructorUsedError;
  List<CartModel> get cartModel => throw _privateConstructorUsedError;
  List<SideMenuModel> get recommendedSideMenu =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShoppingCartStateCopyWith<ShoppingCartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingCartStateCopyWith<$Res> {
  factory $ShoppingCartStateCopyWith(
          ShoppingCartState value, $Res Function(ShoppingCartState) then) =
      _$ShoppingCartStateCopyWithImpl<$Res, ShoppingCartState>;
  @useResult
  $Res call(
      {ScreenState screenState,
      List<CartModel> cartModel,
      List<SideMenuModel> recommendedSideMenu});
}

/// @nodoc
class _$ShoppingCartStateCopyWithImpl<$Res, $Val extends ShoppingCartState>
    implements $ShoppingCartStateCopyWith<$Res> {
  _$ShoppingCartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screenState = null,
    Object? cartModel = null,
    Object? recommendedSideMenu = null,
  }) {
    return _then(_value.copyWith(
      screenState: null == screenState
          ? _value.screenState
          : screenState // ignore: cast_nullable_to_non_nullable
              as ScreenState,
      cartModel: null == cartModel
          ? _value.cartModel
          : cartModel // ignore: cast_nullable_to_non_nullable
              as List<CartModel>,
      recommendedSideMenu: null == recommendedSideMenu
          ? _value.recommendedSideMenu
          : recommendedSideMenu // ignore: cast_nullable_to_non_nullable
              as List<SideMenuModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShoppingCartStateImplCopyWith<$Res>
    implements $ShoppingCartStateCopyWith<$Res> {
  factory _$$ShoppingCartStateImplCopyWith(_$ShoppingCartStateImpl value,
          $Res Function(_$ShoppingCartStateImpl) then) =
      __$$ShoppingCartStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ScreenState screenState,
      List<CartModel> cartModel,
      List<SideMenuModel> recommendedSideMenu});
}

/// @nodoc
class __$$ShoppingCartStateImplCopyWithImpl<$Res>
    extends _$ShoppingCartStateCopyWithImpl<$Res, _$ShoppingCartStateImpl>
    implements _$$ShoppingCartStateImplCopyWith<$Res> {
  __$$ShoppingCartStateImplCopyWithImpl(_$ShoppingCartStateImpl _value,
      $Res Function(_$ShoppingCartStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screenState = null,
    Object? cartModel = null,
    Object? recommendedSideMenu = null,
  }) {
    return _then(_$ShoppingCartStateImpl(
      screenState: null == screenState
          ? _value.screenState
          : screenState // ignore: cast_nullable_to_non_nullable
              as ScreenState,
      cartModel: null == cartModel
          ? _value._cartModel
          : cartModel // ignore: cast_nullable_to_non_nullable
              as List<CartModel>,
      recommendedSideMenu: null == recommendedSideMenu
          ? _value._recommendedSideMenu
          : recommendedSideMenu // ignore: cast_nullable_to_non_nullable
              as List<SideMenuModel>,
    ));
  }
}

/// @nodoc

class _$ShoppingCartStateImpl implements _ShoppingCartState {
  const _$ShoppingCartStateImpl(
      {this.screenState = ScreenState.loading,
      final List<CartModel> cartModel = const [],
      final List<SideMenuModel> recommendedSideMenu = const []})
      : _cartModel = cartModel,
        _recommendedSideMenu = recommendedSideMenu;

  @override
  @JsonKey()
  final ScreenState screenState;
  final List<CartModel> _cartModel;
  @override
  @JsonKey()
  List<CartModel> get cartModel {
    if (_cartModel is EqualUnmodifiableListView) return _cartModel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartModel);
  }

  final List<SideMenuModel> _recommendedSideMenu;
  @override
  @JsonKey()
  List<SideMenuModel> get recommendedSideMenu {
    if (_recommendedSideMenu is EqualUnmodifiableListView)
      return _recommendedSideMenu;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendedSideMenu);
  }

  @override
  String toString() {
    return 'ShoppingCartState(screenState: $screenState, cartModel: $cartModel, recommendedSideMenu: $recommendedSideMenu)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingCartStateImpl &&
            (identical(other.screenState, screenState) ||
                other.screenState == screenState) &&
            const DeepCollectionEquality()
                .equals(other._cartModel, _cartModel) &&
            const DeepCollectionEquality()
                .equals(other._recommendedSideMenu, _recommendedSideMenu));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      screenState,
      const DeepCollectionEquality().hash(_cartModel),
      const DeepCollectionEquality().hash(_recommendedSideMenu));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingCartStateImplCopyWith<_$ShoppingCartStateImpl> get copyWith =>
      __$$ShoppingCartStateImplCopyWithImpl<_$ShoppingCartStateImpl>(
          this, _$identity);
}

abstract class _ShoppingCartState implements ShoppingCartState {
  const factory _ShoppingCartState(
      {final ScreenState screenState,
      final List<CartModel> cartModel,
      final List<SideMenuModel> recommendedSideMenu}) = _$ShoppingCartStateImpl;

  @override
  ScreenState get screenState;
  @override
  List<CartModel> get cartModel;
  @override
  List<SideMenuModel> get recommendedSideMenu;
  @override
  @JsonKey(ignore: true)
  _$$ShoppingCartStateImplCopyWith<_$ShoppingCartStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
