import 'package:injectable/injectable.dart';
import 'package:my_dream/model/menus_option.dart';
import 'package:my_dream/repository/menu_option_api/menu_option_remote_source.dart';

@singleton
class MenuOptionRemoteRepository {
  final MenuOptionRemoteSource _menuOptionRemoteSource;

  MenuOptionRemoteRepository(this._menuOptionRemoteSource);

  // 메뉴 전체 옵션 조회
  Future<MenuOptionsModel> menusOptions(int menuId,
      {int cacheMemory = 0}) async {
    MenuOptionsModel menuOptions = await _menuOptionRemoteSource
        .menusOptions(menuId, cacheMemory: cacheMemory);
    return menuOptions;
  }

  // 장바구니 옵션 수정
  Future<bool> putMyCartOption(
      int basketMenuId, Map<String, dynamic> data, int amount) async {
    return await _menuOptionRemoteSource.putMyCartOption(
        basketMenuId, data, amount);
  }
}
