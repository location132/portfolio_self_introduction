import 'package:injectable/injectable.dart';
import 'package:my_dream/model/cart.dart';
import 'package:my_dream/repository/cart_api/cart_reomte_response.dart';
import 'package:my_dream/Page/11_shopping_cart/core/shopping_cart_dio/my_shopping_cart_dio.dart';

@singleton
class CartRemoteSource {
  // 내 장바구니 조회
  Future<List<CartModel>> getMyCartWithDio({int cacheMemory = 0}) async {
    CartResponse response =
        await getMyCartWithDioRequest(cacheMemory: cacheMemory);
    return response.toModel();
  }

  // 사이드 메뉴 추천
  Future<List<SideMenuModel>> getRecommendedSideMenu(int marketId) async {
    RecommendedSideMenuResponse response =
        await getRecommendedSideMenuRequest(marketId);
    return response.toModel();
  }
}
