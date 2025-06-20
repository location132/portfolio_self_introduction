import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:self_introduction_flutter/model/init_model.dart';
import 'package:self_introduction_flutter/model/main_page/banner_model.dart';
import 'package:self_introduction_flutter/model/main_page/chapter_model.dart';

import 'package:self_introduction_flutter/model/main_page/mySkill_model.dart';
import 'package:self_introduction_flutter/model/main_page/scroll_model.dart';
import 'package:self_introduction_flutter/model/main_page/start_animation_model.dart';
import 'package:self_introduction_flutter/model/main_page/detail_me_model.dart';
import 'package:self_introduction_flutter/model/main_page/project_model.dart';

part 'desktop_state.freezed.dart';

@freezed
class DesktopState with _$DesktopState {
  const factory DesktopState({
    //StartAnimation 컨트롤러
    StartAnimationModel? startAnimation,

    //BannerModel
    @Default(BannerModel()) BannerModel bannerModel,

    //mySkill 모델
    @Default(MySkillModel()) MySkillModel mySkillModel,

    //ChapterModel
    @Default(ChapterModel()) ChapterModel chapterModel,

    //ScrollModel
    @Default(ScrollModel()) ScrollModel scrollModel,

    //InitModel
    @Default(InitModel()) InitModel initModel,

    //DetailMeModel
    @Default(DetailMeModel()) DetailMeModel detailMeModel,

    //ProjectModel
    @Default(ProjectModel()) ProjectModel projectModel,
  }) = _DesktopState;
}
