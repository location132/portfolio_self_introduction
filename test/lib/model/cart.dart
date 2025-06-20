import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart.freezed.dart';

// 장바구니 모델
@freezed
class CartModel with _$CartModel {
  const factory CartModel({
    int? basketId,
    required int marketId,
    required String marketName,
    required List<Menu> menu,
    int? totalPrice,
  }) = _CartModel;
}

@freezed
class Menu with _$Menu {
  const factory Menu({
    required int basketMenuId,
    required int menuId,
    required String menuName,
    required String menuImageUrl,
    required int menuPrice,
    required int amount,
    required int optionTotalPrice,
    required int totalPrice,
    required List<Option> options,
    required int discountAmount,
    required int discountRate,
    required bool discountAvailability,
  }) = _Menu;
}

@freezed
class Option with _$Option {
  const factory Option({
    required String optionDescription,
    required int optionPrice,
  }) = _Option;
}

// 사이드 메뉴 추천 모델
@freezed
class SideMenuModel with _$SideMenuModel {
  const factory SideMenuModel({
    required int menuId,
    required int price,
    required String imageUrl,
    required String menuName,
    required bool bestMenu,
  }) = _SideMenuModel;
}
