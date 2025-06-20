// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_option_remote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuOptionsResponseImpl _$$MenuOptionsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MenuOptionsResponseImpl(
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => MenuOptionCategoryResponse.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MenuOptionsResponseImplToJson(
        _$MenuOptionsResponseImpl instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };

_$MenuOptionCategoryResponseImpl _$$MenuOptionCategoryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MenuOptionCategoryResponseImpl(
      classification: json['classification'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => MenuOptionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      multipleSelection: json['multipleSelection'] as bool,
    );

Map<String, dynamic> _$$MenuOptionCategoryResponseImplToJson(
        _$MenuOptionCategoryResponseImpl instance) =>
    <String, dynamic>{
      'classification': instance.classification,
      'options': instance.options,
      'multipleSelection': instance.multipleSelection,
    };

_$MenuOptionResponseImpl _$$MenuOptionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MenuOptionResponseImpl(
      menuOptionId: (json['menuOptionId'] as num).toInt(),
      description: json['description'] as String,
      optionPrice: (json['optionPrice'] as num).toInt(),
      defaultOption: json['defaultOption'] as bool,
      adultMenu: json['adultMenu'] as bool,
    );

Map<String, dynamic> _$$MenuOptionResponseImplToJson(
        _$MenuOptionResponseImpl instance) =>
    <String, dynamic>{
      'menuOptionId': instance.menuOptionId,
      'description': instance.description,
      'optionPrice': instance.optionPrice,
      'defaultOption': instance.defaultOption,
      'adultMenu': instance.adultMenu,
    };
