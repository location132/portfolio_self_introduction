import 'package:injectable/injectable.dart';
import 'package:my_dream/Page/11_shopping_cart/core/shopping_cart_dio/my_shopping_cart_dio.dart';
import 'package:my_dream/model/menus_option.dart';
import 'package:my_dream/repository/menu_option_api/menu_option_remote_response.dart';

@singleton
class MenuOptionRemoteSource {
  // 메뉴 옵션 조회
  Future<MenuOptionsModel> menusOptions(int menuId,
      {int cacheMemory = 0}) async {
    MenuOptionsResponse menuOptions =
        await getmenusOptionsWithDio(menuId, cacheMemory: cacheMemory);
    return menuOptions.toModel();
  }

  // 장바구니 옵션 수정
  Future<bool> putMyCartOption(
      int basketMenuId, Map<String, dynamic> data, int amount) async {
    return await putMyCartOptionWithDio(basketMenuId, data, amount);
  }
}
