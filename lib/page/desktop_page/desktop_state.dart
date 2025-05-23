import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:self_introduction_flutter/model/init_model.dart';
import 'package:self_introduction_flutter/model/main_page/description_model.dart';
import 'package:self_introduction_flutter/model/main_page/mySkill_model.dart';
import 'package:self_introduction_flutter/model/main_page/profile_model.dart';
import 'package:self_introduction_flutter/model/main_page/scroll_model.dart';
import 'package:self_introduction_flutter/model/main_page/start_animation_model.dart';

part 'desktop_state.freezed.dart';

@freezed
class DesktopState with _$DesktopState {
  const factory DesktopState({
    //StartAnimation 컨트롤러
    StartAnimationModel? startAnimation,

    //mySkill 모델
    @Default(MySkillModel()) MySkillModel mySkillModel,

    //DescriptionModel
    @Default(DescriptionModel()) DescriptionModel descriptionModel,

    //ScrollModel
    @Default(ScrollModel()) ScrollModel scrollModel,

    //ProfileModel
    @Default(ProfileModel()) ProfileModel profileModel,

    //InitModel
    @Default(InitModel()) InitModel initModel,
  }) = _DesktopState;
}
