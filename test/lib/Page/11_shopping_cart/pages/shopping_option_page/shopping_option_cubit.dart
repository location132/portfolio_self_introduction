import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:my_dream/repository/cart_api/cart_reomte_service.dart';
import 'package:my_dream/Page/11_shopping_cart/pages/shopping_option_page/shopping_option_state.dart';
import 'package:my_dream/model/cart.dart';
import 'package:my_dream/model/menus_option.dart';
import 'package:my_dream/repository/menu_option_api/menu_option_remote_service.dart';
import 'package:provider/provider.dart';

@injectable
class ShoppingOptionCubit extends Cubit<ShoppingOptionState> {
  final CartRemoteService _cartRemoteService;
  final MenuOptionRemoteService _menuOptionRemoteService;

  ShoppingOptionCubit(this._cartRemoteService, this._menuOptionRemoteService)
      : super(const ShoppingOptionState());

  // BuildContext가 필요한 메서드에서 파라미터로 받도록 수정
  void getMycart(BuildContext context, int index, {int cacheMemory = 0}) async {
    emit(state.copyWith(screenState: ScreenState.loading));
    final menuPriceStatus = Provider.of<MenuPrice>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      menuPriceStatus.clearAll();
    });
    try {
      // 장바구니 조회
      List<CartModel> cartData =
          await _cartRemoteService.getMyCartWithDio(cacheMemory: cacheMemory);
      // 메뉴 옵션 조회
      MenuOptionsModel menuOptions = await _menuOptionRemoteService
          .menusOptions(cartData[0].menu[index].menuId);

      emit(state.copyWith(
        cartModel: cartData,
        menuOptionsModel: menuOptions,
      ));
      menuPriceStatus.setFinalPrice(cartData[0].menu[index].menuPrice);
      emit(state.copyWith(screenState: ScreenState.loaded));
    } catch (e) {
      emit(state.copyWith(screenState: ScreenState.loaded)); // 에러 처리
      // TODO: 에러 처리 에러시 화면 처리
    }
  }

  // 장바구니 옵션 수정
  Future<bool> putMyCartOption(
      BuildContext context, int basketMenuId, int amount) async {
    emit(state.copyWith(screenState: ScreenState.loading));
    final menuPriceStatus = Provider.of<MenuPrice>(context, listen: false);
    // 서버로 데이터 전송
    List<int> allSelectedOptionIds =
        menuPriceStatus.selectedOptionIds.values.expand((i) => i).toList();

    Map<String, dynamic> data = {
      "menuOptionIds": allSelectedOptionIds,
    };

    // 장바구니 옵션 수정
    bool result = await _menuOptionRemoteService.putMyCartOption(
        basketMenuId, data, amount);
    // 장바구니 초기화
    if (result) {
      await _cartRemoteService.getMyCartWithDio(cacheMemory: 1);
      menuPriceStatus.clearAll();
      emit(state.copyWith(screenState: ScreenState.loaded));
      Navigator.pop(context);
    }
    return true;
  }

  // 수량 감소
  void decreaseQuantity(BuildContext context) {
    if (state.quantity > 1) {
      emit(state.copyWith(quantity: state.quantity - 1));
    }
    Provider.of<MenuPrice>(context, listen: false).addQuantity(state.quantity);
  }

  // 수량 증가
  void increaseQuantity(BuildContext context) {
    if (state.quantity < 5) {
      emit(state.copyWith(quantity: state.quantity + 1));
    }
    Provider.of<MenuPrice>(context, listen: false).addQuantity(state.quantity);
  }
}
