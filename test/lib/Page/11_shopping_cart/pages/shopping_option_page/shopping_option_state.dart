import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_dream/model/cart.dart';
import 'package:my_dream/model/menus_option.dart';

part 'shopping_option_state.freezed.dart';

@freezed
class ShoppingOptionState with _$ShoppingOptionState {
  const factory ShoppingOptionState({
    @Default(ScreenState.loading) ScreenState screenState,
    List<CartModel>? cartModel,
    MenuOptionsModel? menuOptionsModel,
    @Default(1) int quantity,
  }) = _ShoppingOptionState;
}

enum ScreenState { loading, loaded }
