import 'package:freezed_annotation/freezed_annotation.dart';

part 'skill_model.freezed.dart';

@freezed
class SkillModel with _$SkillModel {
  const factory SkillModel({
    @Default(false) bool isSkillViewInit,
    @Default(false) bool isVisible,
    @Default(false) bool isBackGroundAniStart,
    @Default(false) bool isTitleAniStart,
    @Default(false) bool isSkillItemsAniStart,
    @Default(false) bool isProgressAniStart,
  }) = _SkillModel;
}
