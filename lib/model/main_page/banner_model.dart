import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_model.freezed.dart';

@freezed
class BannerModel with _$BannerModel {
  const factory BannerModel({
    @Default(false) bool isPlayerActive,
    @Default(false) bool player,
    @Default(0) int currentTitleIndex,
    @Default(false) bool isTitleChanging,
    @Default(false) bool isButtonVisible,
    @Default(false) bool isBannerActive,
  }) = _BannerModel;
}
