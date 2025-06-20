// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_remote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StartIfsaiResponseImpl _$$StartIfsaiResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$StartIfsaiResponseImpl(
      isServerConnected: json['isServerConnected'] as bool,
      appVersion: json['appVersion'] as String?,
      marketDataVersion: json['marketDataVersion'] as String?,
    );

Map<String, dynamic> _$$StartIfsaiResponseImplToJson(
        _$StartIfsaiResponseImpl instance) =>
    <String, dynamic>{
      'isServerConnected': instance.isServerConnected,
      'appVersion': instance.appVersion,
      'marketDataVersion': instance.marketDataVersion,
    };
