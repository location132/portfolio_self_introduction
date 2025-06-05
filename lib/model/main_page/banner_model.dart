import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_model.freezed.dart';

@freezed
class BannerModel with _$BannerModel {
  const factory BannerModel({
    @Default(false) bool isPlayerActive,
    @Default(false) bool player,
  }) = _BannerModel;
}
