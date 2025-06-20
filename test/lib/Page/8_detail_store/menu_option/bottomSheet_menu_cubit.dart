import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dream/Page/11_shopping_cart/core/shopping_cart_dio/my_shopping_cart_dio.dart';
import 'package:my_dream/Page/8_detail_store/menu_option/bottomSheet_menu_state.dart';
import 'package:my_dream/coreService/Dialog/myCart_dialog.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:my_dream/model/menus_option.dart';
import 'package:my_dream/repository/menu_option_api/menu_option_remote_service.dart';
import 'package:provider/provider.dart';

class BottomSheetMenuCubit extends Cubit<BottomSheetMenuState> {
  BuildContext context;
  final MenuOptionRemoteService _menuOptionRemoteService;
  BottomSheetMenuCubit(this._menuOptionRemoteService, this.context)
      : super(const BottomSheetMenuState());

  //메뉴 옵션 조회
  void getMenuOptions(int menuId) async {
    emit(state.copyWith(screenState: ScreenState.loading));

    MenuOptionsModel menuOptions =
        await _menuOptionRemoteService.menusOptions(menuId);

    // 선택된 옵션 초기화
    Map<int, int> initialSelectedOptions = {};
    for (int i = 0; i < menuOptions.categories.length; i++) {
      initialSelectedOptions[i] = 0;
    }

    emit(
      state.copyWith(
        menuOptionsModel: menuOptions,
        selectedOptions: initialSelectedOptions,
        screenState: ScreenState.loaded,
      ),
    );
  }

  // 장바구니에 담기 서버에 요청
  Future<void> handleAddToCart(
      BuildContext context, int marketId, int menuId, int amount) async {
    final menuPriceStatus = Provider.of<MenuPrice>(context, listen: false);

    // 서버로 데이터 전송
    List<int> allSelectedOptionIds =
        menuPriceStatus.selectedOptionIds.values.expand((i) => i).toList();

    Map<String, dynamic> data = {
      "menuOptionIds": allSelectedOptionIds,
    };

    bool result = await addToCart(
      marketId, // 마켓 아이디
      menuId, // 메뉴 아이디
      data, // 메뉴 옵션 아이디
      amount, // 최종 가격
    );

    if (result) {
      await getMyCartWithDioRequest(cacheMemory: 1); // 장바구니 초기화
      final loginStatus = Provider.of<LoginModel>(context, listen: false);
      loginStatus.setBasketCount(loginStatus.basketCount + 1);
      menuPriceStatus.clearAll();
      Navigator.pop(context);
      showLoginRequiredForCartDialog(context);
    }
  }

  void decreaseQuantity() {
    if (state.quantity > 1) {
      emit(state.copyWith(quantity: state.quantity - 1));
    }
    Provider.of<MenuPrice>(context, listen: false).addQuantity(state.quantity);
  }

  void increaseQuantity() {
    if (state.quantity < 5) {
      emit(state.copyWith(quantity: state.quantity + 1));
    }
    Provider.of<MenuPrice>(context, listen: false).addQuantity(state.quantity);
  }
}
