import 'package:freezed_annotation/freezed_annotation.dart';

part 'aboutMe_model.freezed.dart';

@freezed
class AboutMeModel with _$AboutMeModel {
  const factory AboutMeModel({
    @Default(false) bool isVisible,
    @Default(false) bool isBackGroundAniStart,
    @Default(false) bool isTitleAniStart,
    @Default(false) bool isDescriptionAniStart,
    @Default(false) bool isPlayerAniOpacity,
  }) = _AboutMeModel;
}
