// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'affiliated_store_remote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreImpl _$$StoreImplFromJson(Map<String, dynamic> json) => _$StoreImpl(
      marketId: (json['marketId'] as num).toInt(),
      mainCategory: json['mainCategory'] as String,
      locationX: (json['locationX'] as num).toDouble(),
      locationY: (json['locationY'] as num).toDouble(),
      marketImage: json['marketImage'] as String,
      marketName: json['marketName'] as String,
      marketDescription: json['marketDescription'] as String,
      detailAddress: json['detailAddress'] as String,
      eventMessage: json['eventMessage'] as String?,
      openTime: json['openTime'] as String,
      closeTime: json['closeTime'] as String,
      closedDays: json['closedDays'] as String?,
      averageReviewScore: (json['averageReviewScore'] as num).toDouble(),
      reviewCount: (json['reviewCount'] as num).toInt(),
      maxDiscountRate: (json['maxDiscountRate'] as num).toInt(),
    );

Map<String, dynamic> _$$StoreImplToJson(_$StoreImpl instance) =>
    <String, dynamic>{
      'marketId': instance.marketId,
      'mainCategory': instance.mainCategory,
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
