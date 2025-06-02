import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:self_introduction_flutter/model/init_model.dart';
import 'package:self_introduction_flutter/model/main_page/intro_model.dart';
import 'package:self_introduction_flutter/model/main_page/scroll_model.dart';
import 'package:self_introduction_flutter/model/mobile_page/aboutMe_model.dart';
import 'package:self_introduction_flutter/model/mobile_page/chapter_model.dart';
import 'package:self_introduction_flutter/model/mobile_page/detailMe_model.dart';
import 'package:self_introduction_flutter/model/mobile_page/skill_model.dart';

part 'mobile_state.freezed.dart';

@freezed
class MobileState with _$MobileState {
  const factory MobileState({
    @Default(InitModel()) InitModel initModel,
    @Default(IntroModel()) IntroModel introModel,
    @Default(ScrollModel()) ScrollModel scrollModel,
    @Default(AboutMeModel()) AboutMeModel aboutMeModel,
    @Default(DetailMeModel()) DetailMeModel detailMeModel,
    @Default(ChapterModel()) ChapterModel chapterModel,
    @Default(SkillModel()) SkillModel skillModel,
    @Default('잠시만 기다려주세요.') String isPlayerText,
  }) = _MobileState;
}
