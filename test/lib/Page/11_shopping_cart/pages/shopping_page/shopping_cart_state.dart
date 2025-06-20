import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_dream/model/cart.dart';
part 'shopping_cart_state.freezed.dart';

@freezed
class ShoppingCartState with _$ShoppingCartState {
  const factory ShoppingCartState({
    @Default(ScreenState.loading) ScreenState screenState,
    @Default([]) List<CartModel> cartModel,
    @Default([]) List<SideMenuModel> recommendedSideMenu,
  }) = _ShoppingCartState;
}

enum ScreenState {
  initial,
  loading,
  loaded,
}
