import 'package:freezed_annotation/freezed_annotation.dart';

part 'mySkill_model.freezed.dart';

@freezed
class MySkillModel with _$MySkillModel {
  const factory MySkillModel({
    @Default(MySkillViewStatus.inactive) MySkillViewStatus status,
    @Default(false) bool isPlayerActive,
  }) = _MySkillModel;
}

enum MySkillViewStatus { init, inactive, active }
