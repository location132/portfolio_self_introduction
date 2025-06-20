import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_dream/model/cart.dart';

part 'cart_reomte_response.freezed.dart';
part 'cart_reomte_response.g.dart';

//-------- 장바구니 조회 응답 --------
@freezed
class CartResponse with _$CartResponse {
  const CartResponse._();
  const factory CartResponse({
    @Default([]) List<Cart>? carts,
  }) = _CartResponse;

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);

  List<CartModel> toModel() {
    return carts!
        .map((cart) => CartModel(
              basketId: cart.basketId,
              marketId: cart.marketId,
              marketName: cart.marketName,
              menu: cart.menu
                  .map((menuResponse) => Menu(
                        basketMenuId: menuResponse.basketMenuId,
                        menuId: menuResponse.menuId,
                        menuName: menuResponse.menuName,
                        menuImageUrl: menuResponse.menuImageUrl,
                        menuPrice: menuResponse.menuPrice,
                        amount: menuResponse.amount,
                        optionTotalPrice: menuResponse.optionTotalPrice,
                        totalPrice: menuResponse.totalPrice,
                        options: menuResponse.options
                            .map((optionResponse) => Option(
                                  optionDescription:
                                      optionResponse.optionDescription,
                                  optionPrice: optionResponse.optionPrice,
                                ))
                            .toList(),
                        discountAmount: menuResponse.discountAmount,
                        discountRate: menuResponse.discountRate,
                        discountAvailability: menuResponse.discountAvailability,
                      ))
                  .toList(),
              totalPrice: cart.totalPrice,
            ))
        .toList();
  }
}

@freezed
class Cart with _$Cart {
  const factory Cart({
    required int basketId,
    required int marketId,
    required String marketName,
    required List<MenuResponse> menu,
    required int totalPrice,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}

@freezed
class MenuResponse with _$MenuResponse {
  const factory MenuResponse({
    required int basketMenuId,
    required int menuId,
    required String menuName,
    required String menuImageUrl,
    required int menuPrice,
    required int amount,
    required int optionTotalPrice,
    required int totalPrice,
    required List<OptionResponse> options,
    required int discountAmount,
    required int discountRate,
    required bool discountAvailability,
  }) = _MenuResponse;

  factory MenuResponse.fromJson(Map<String, dynamic> json) =>
      _$MenuResponseFromJson(json);
}

@freezed
class OptionResponse with _$OptionResponse {
  const factory OptionResponse({
    required String optionDescription,
    required int optionPrice,
  }) = _OptionResponse;

  factory OptionResponse.fromJson(Map<String, dynamic> json) =>
      _$OptionResponseFromJson(json);
}

//-------- 사이드 메뉴 추천 응답 --------
@freezed
class RecommendedSideMenuResponse with _$RecommendedSideMenuResponse {
  const RecommendedSideMenuResponse._();

  const factory RecommendedSideMenuResponse({
    @Default([]) List<SideMenu> sideMenus,
  }) = _RecommendedSideMenuResponse;

  factory RecommendedSideMenuResponse.fromJson(Map<String, dynamic> json) =>
      _$RecommendedSideMenuResponseFromJson(json);

  List<SideMenuModel> toModel() {
    return sideMenus
        .map((menu) => SideMenuModel(
              menuId: menu.menuId,
              price: menu.price,
              imageUrl: menu.imageUrl,
              menuName: menu.menuName,
              bestMenu: menu.bestMenu,
            ))
        .toList();
  }
}

@freezed
class SideMenu with _$SideMenu {
  const factory SideMenu({
    required int menuId,
    required int price,
    required String imageUrl,
    required String menuName,
    required bool bestMenu,
  }) = _SideMenu;

  factory SideMenu.fromJson(Map<String, dynamic> json) =>
      _$SideMenuFromJson(json);
}
