// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_reomte_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartResponseImpl _$$CartResponseImplFromJson(Map<String, dynamic> json) =>
    _$CartResponseImpl(
      carts: (json['carts'] as List<dynamic>?)
              ?.map((e) => Cart.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CartResponseImplToJson(_$CartResponseImpl instance) =>
    <String, dynamic>{
      'carts': instance.carts,
    };

_$CartImpl _$$CartImplFromJson(Map<String, dynamic> json) => _$CartImpl(
      basketId: (json['basketId'] as num).toInt(),
      marketId: (json['marketId'] as num).toInt(),
      marketName: json['marketName'] as String,
      menu: (json['menu'] as List<dynamic>)
          .map((e) => MenuResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPrice: (json['totalPrice'] as num).toInt(),
    );

Map<String, dynamic> _$$CartImplToJson(_$CartImpl instance) =>
    <String, dynamic>{
      'basketId': instance.basketId,
      'marketId': instance.marketId,
      'marketName': instance.marketName,
      'menu': instance.menu,
      'totalPrice': instance.totalPrice,
    };

_$MenuResponseImpl _$$MenuResponseImplFromJson(Map<String, dynamic> json) =>
    _$MenuResponseImpl(
      basketMenuId: (json['basketMenuId'] as num).toInt(),
      menuId: (json['menuId'] as num).toInt(),
      menuName: json['menuName'] as String,
      menuImageUrl: json['menuImageUrl'] as String,
      menuPrice: (json['menuPrice'] as num).toInt(),
      amount: (json['amount'] as num).toInt(),
      optionTotalPrice: (json['optionTotalPrice'] as num).toInt(),
      totalPrice: (json['totalPrice'] as num).toInt(),
      options: (json['options'] as List<dynamic>)
          .map((e) => OptionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      discountAmount: (json['discountAmount'] as num).toInt(),
      discountRate: (json['discountRate'] as num).toInt(),
      discountAvailability: json['discountAvailability'] as bool,
    );

Map<String, dynamic> _$$MenuResponseImplToJson(_$MenuResponseImpl instance) =>
    <String, dynamic>{
      'basketMenuId': instance.basketMenuId,
      'menuId': instance.menuId,
      'menuName': instance.menuName,
      'menuImageUrl': instance.menuImageUrl,
      'menuPrice': instance.menuPrice,
      'amount': instance.amount,
      'optionTotalPrice': instance.optionTotalPrice,
      'totalPrice': instance.totalPrice,
      'options': instance.options,
      'discountAmount': instance.discountAmount,
      'discountRate': instance.discountRate,
      'discountAvailability': instance.discountAvailability,
    };

_$OptionResponseImpl _$$OptionResponseImplFromJson(Map<String, dynamic> json) =>
    _$OptionResponseImpl(
      optionDescription: json['optionDescription'] as String,
      optionPrice: (json['optionPrice'] as num).toInt(),
    );

Map<String, dynamic> _$$OptionResponseImplToJson(
        _$OptionResponseImpl instance) =>
    <String, dynamic>{
      'optionDescription': instance.optionDescription,
      'optionPrice': instance.optionPrice,
    };

_$RecommendedSideMenuResponseImpl _$$RecommendedSideMenuResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RecommendedSideMenuResponseImpl(
      sideMenus: (json['sideMenus'] as List<dynamic>?)
              ?.map((e) => SideMenu.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RecommendedSideMenuResponseImplToJson(
        _$RecommendedSideMenuResponseImpl instance) =>
    <String, dynamic>{
      'sideMenus': instance.sideMenus,
    };

_$SideMenuImpl _$$SideMenuImplFromJson(Map<String, dynamic> json) =>
    _$SideMenuImpl(
      menuId: (json['menuId'] as num).toInt(),
      price: (json['price'] as num).toInt(),
      imageUrl: json['imageUrl'] as String,
      menuName: json['menuName'] as String,
      bestMenu: json['bestMenu'] as bool,
    );

Map<String, dynamic> _$$SideMenuImplToJson(_$SideMenuImpl instance) =>
    <String, dynamic>{
      'menuId': instance.menuId,
      'price': instance.price,
      'imageUrl': instance.imageUrl,
      'menuName': instance.menuName,
      'bestMenu': instance.bestMenu,
    };
