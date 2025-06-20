import 'package:injectable/injectable.dart';
import 'package:my_dream/model/cart.dart';
import 'package:my_dream/repository/cart_api/cart_reomte_source.dart';

@singleton
class CartRemoteRepository {
  final CartRemoteSource _cartRemoteSource;
  CartRemoteRepository(this._cartRemoteSource);

  // 내 장바구니 조회
  Future<List<CartModel>> getMyCartWithDio({int cacheMemory = 0}) async {
    List<CartModel> cartData =
        await _cartRemoteSource.getMyCartWithDio(cacheMemory: cacheMemory);
    return cartData;
  }

  // 사이드 메뉴 추천
  Future<List<SideMenuModel>> getRecommendedSideMenu(int marketId) async {
    final List<SideMenuModel> response =
        await _cartRemoteSource.getRecommendedSideMenu(marketId);
    return response;
  }
}
