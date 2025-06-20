import 'package:injectable/injectable.dart';
import 'package:my_dream/model/cart.dart';
import 'package:my_dream/repository/cart_api/cart_remote_repository.dart';

@singleton
class CartRemoteService {
  final CartRemoteRepository _cartRemoteRepository;

  CartRemoteService(this._cartRemoteRepository);

  // 내 장바구니 조회
  Future<List<CartModel>> getMyCartWithDio({int cacheMemory = 0}) async {
    return await _cartRemoteRepository.getMyCartWithDio(
        cacheMemory: cacheMemory);
  }

  // 사이드 메뉴 추천
  Future<List<SideMenuModel>> getRecommendedSideMenu(int marketId) async {
    return await _cartRemoteRepository.getRecommendedSideMenu(marketId);
  }
}
