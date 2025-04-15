import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:self_introduction_flutter/model/main_page/description_model.dart';
import 'package:self_introduction_flutter/model/main_page/mySkill_model.dart';
import 'package:self_introduction_flutter/model/main_page/scroll_model.dart';
import 'package:self_introduction_flutter/model/main_page/start_animation_model.dart';

part 'main_state.freezed.dart';

@freezed
class MainPageState with _$MainPageState {
  const factory MainPageState({
    //StartAnimation 컨트롤러
    StartAnimationModel? startAnimation,

    //mySkill 모델
    @Default(MySkillModel()) MySkillModel mySkillModel,

    //DescriptionModel
    @Default(DescriptionModel()) DescriptionModel descriptionModel,

    //ScrollModel
    @Default(ScrollModel()) ScrollModel scrollModel,

    // 프로필 뷰 높이
    @Default(0.0) double mainViewHeight,
  }) = _MainPageState;
}
