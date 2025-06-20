import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dream/Page/11_shopping_cart/core/shopping_cart_provider/my_shopping_cart_state.dart';
import 'package:my_dream/model/cart.dart';
import 'package:my_dream/Page/11_shopping_cart/core/shopping_cart_dio/my_shopping_cart_dio.dart';
import 'package:my_dream/repository/cart_api/cart_reomte_service.dart';
import 'package:my_dream/Page/11_shopping_cart/pages/shopping_page/shopping_cart_state.dart';
import 'package:my_dream/coreService/provider.dart';

@injectable
class ShoppingCartCubit extends Cubit<ShoppingCartState> {
  final CartRemoteService _cartRemoteService;

  ShoppingCartCubit(this._cartRemoteService)
      : super(const ShoppingCartState(screenState: ScreenState.loading));

  // 장바구니 조회
  Future<void> getMycart({
    int cacheMemory = 0,
    required LoginModel loginStatus,
    required CartProvider cartProvider,
  }) async {
    if (state.screenState != ScreenState.loading) {
      emit(state.copyWith(screenState: ScreenState.loading));
    }

    try {
      // 1. 장바구니 데이터 가져오기
      final List<CartModel> cartData =
          await _cartRemoteService.getMyCartWithDio(cacheMemory: cacheMemory);

      // 2. 장바구니가 비어있지 않은 경우에만 처리
      if (cartData.isNotEmpty) {
        final int totalMenuItems = cartData[0].menu.length;

        // 캐시 메모리가 0이고 장바구니 수량이 다른 경우 재요청
        if (totalMenuItems != loginStatus.basketCount && cacheMemory == 0) {
          return getMycart(
              cacheMemory: 1,
              loginStatus: loginStatus,
              cartProvider: cartProvider);
        }

        // 3. 사이드 메뉴 추천 및 UI 업데이트
        await getRecommendedSideMenu(cartData[0].marketId);
        _updateUI(loginStatus, cartProvider, cartData, totalMenuItems);
      } else {
        // 장바구니가 비어있는 경우 UI 업데이트
        _updateUI(loginStatus, cartProvider, [], 0);
      }

      emit(state.copyWith(
        cartModel: cartData,
        screenState: ScreenState.loaded,
      ));
    } catch (e) {
      print('장바구니 조회 에러: $e');
      emit(state.copyWith(screenState: ScreenState.loaded));
    }
  }

  // UI 업데이트 로직 분리
  void _updateUI(LoginModel loginStatus, CartProvider cartProvider,
      List<CartModel> cartData, int totalMenuItems) {
    loginStatus.setBasketCount(totalMenuItems);
    cartProvider.setCartData(cartData);
  }

  // 장바구니 삭제
  Future<void> deleteMyCart(List<int> basketMenuIds,
      {required LoginModel loginStatus,
      required CartProvider cartProvider}) async {
    bool success = await deleteShoppingCart(basketMenuIds);
    if (success) {
      emit(state.copyWith(screenState: ScreenState.loading));

      // 장바구니 데이터 새로 가져오기
      await getMycart(
          cacheMemory: 1, loginStatus: loginStatus, cartProvider: cartProvider);

      // state.cartModel이 null이거나 비어있는 경우 처리
      if (state.cartModel.isEmpty) {
        loginStatus.setBasketCount(0);
        cartProvider.setCartData([]); // 빈 배열로 초기화
      } else {
        loginStatus.setBasketCount(cartProvider.totalItemCount);
      }
    }
  }

  // 사장 추천 사이드 메뉴 추천
  Future<void> getRecommendedSideMenu(int marketId) async {
    final List<SideMenuModel> response =
        await _cartRemoteService.getRecommendedSideMenu(marketId);

    emit(state.copyWith(recommendedSideMenu: response));
  }
}
