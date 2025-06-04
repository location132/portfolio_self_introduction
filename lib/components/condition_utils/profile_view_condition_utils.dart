//아래의 클래스는 프로필 뷰 조건 처리 클래스의 조건을 모아둔 클래스입니다.

import 'package:self_introduction_flutter/model/main_page/mySkill_model.dart';
import 'package:self_introduction_flutter/model/main_page/scroll_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_state.dart';

class ProfileViewConditionUtils {
  // 프로필 뷰 스크롤 활성화
  static bool isProfileViewScrollActive(DesktopState state) =>
      state.scrollModel.scrollController!.offset ==
          state.initModel.mainViewHeight &&
      state.mySkillModel.status == MySkillViewStatus.init &&
      state.scrollModel.profileViewState == ProfileViewState.inactive;

  //-- 사용자 스크롤 감지 조건 -- //
  static bool isBannerScrollActive(String viewName) => viewName == 'banner';
  static bool isChapterScrollActive(String viewName) => viewName == 'chapter';
  static bool isProfileIsTopScrollActive(String viewName) =>
      viewName == 'profile_isTop';
  static bool isProfileIsBottomScrollActive(String viewName) =>
      viewName == 'profile_isBottom';
  static bool isUserScrollActive(String viewName) => viewName == 'skill';

  // 스킬 뷰 활성화
  static bool isSkillViewActive(DesktopState state) =>
      state.mySkillModel.status != MySkillViewStatus.init;
}
