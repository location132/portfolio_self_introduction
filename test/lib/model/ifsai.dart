import 'package:freezed_annotation/freezed_annotation.dart';

part 'ifsai.freezed.dart';

@freezed
class Ifsai with _$Ifsai {
  const factory Ifsai({
    required bool isServerConnected,
    String? appVersion,
    String? marketDataVersion,
  }) = _Ifsai;
}
