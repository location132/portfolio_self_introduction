// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nver_map_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NaverMapResponseImpl _$$NaverMapResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$NaverMapResponseImpl(
      markets: (json['markets'] as List<dynamic>)
          .map((e) =>
              NaverMapMarketModelResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$NaverMapResponseImplToJson(
        _$NaverMapResponseImpl instance) =>
    <String, dynamic>{
      'markets': instance.markets,
    };

_$NaverMapMarketModelResponseImpl _$$NaverMapMarketModelResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$NaverMapMarketModelResponseImpl(
      marketId: (json['marketId'] as num?)?.toInt(),
      mainCategory: json['mainCategory'] as String?,
      majorCategory: json['majorCategory'] as String?,
      locationX: (json['locationX'] as num?)?.toDouble(),
      locationY: (json['locationY'] as num?)?.toDouble(),
      marketImage: json['marketImage'] as String?,
      marketName: json['marketName'] as String?,
      marketDescription: json['marketDescription'] as String?,
      detailAddress: json['detailAddress'] as String?,
      eventMessage: json['eventMessage'] as String?,
      openTime: json['openTime'] as String?,
      closeTime: json['closeTime'] as String?,
      closedDays: json['closedDays'] as String?,
      averageReviewScore: (json['averageReviewScore'] as num?)?.toDouble(),
      reviewCount: (json['reviewCount'] as num?)?.toInt(),
      maxDiscountRate: (json['maxDiscountRate'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$NaverMapMarketModelResponseImplToJson(
        _$NaverMapMarketModelResponseImpl instance) =>
    <String, dynamic>{
      'marketId': instance.marketId,
      'mainCategory': instance.mainCategory,
      'majorCategory': instance.majorCategory,
      'locationX': instance.locationX,
      'locationY': instance.locationY,
      'marketImage': instance.marketImage,
      'marketName': instance.marketName,
      'marketDescription': instance.marketDescription,
      'detailAddress': instance.detailAddress,
      'eventMessage': instance.eventMessage,
      'openTime': instance.openTime,
      'closeTime': instance.closeTime,
      'closedDays': instance.closedDays,
      'averageReviewScore': instance.averageReviewScore,
      'reviewCount': instance.reviewCount,
      'maxDiscountRate': instance.maxDiscountRate,
    };
