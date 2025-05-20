//아래의 클래스는 프로필 뷰 조건 처리 클래스의 조건을 모아둔 클래스입니다.

import 'package:self_introduction_flutter/model/main_page/mySkill_model.dart';
import 'package:self_introduction_flutter/model/main_page/scroll_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_state.dart';

class ProfileViewConditionUtils {
  // 프로필 뷰 스크롤 비활성화
  static bool isProfileViewScrollInactive(DesktopState state) =>
      state.scrollModel.isScrollWaiting == false &&
      state.scrollModel.profileViewState == ProfileViewState.active &&
      state.profileModel.scrollCount != 3 &&
      state.profileModel.isUserClick == false;

  /* 프로필 뷰 카운트가 4가 아닐 때 */
  static bool isNotScrollCountFour(DesktopState state) =>
      state.profileModel.scrollCount != 2;

  /* 파이널 카운트보다 프로필 카운트가 클 때 */
  static bool isProfileCountGreaterThanFinalCount(DesktopState state) =>
      state.profileModel.scrollCount > state.profileModel.finalCount;

  /* 프로필 카운트가 3 또는 4일 때 조건 */
  static bool isCountingWithThreeOrFour(DesktopState state) =>
      state.profileModel.scrollCount == 3 ||
      state.profileModel.scrollCount == 4;

  /* 스크롤 대기 조건 */
  static bool isScrollWaiting(DesktopState state) =>
      state.scrollModel.isScrollWaiting == true;

  /* 프로필 뷰 카운트가 0일 때 */
  static bool isProfileCountZero(DesktopState state) =>
      state.profileModel.scrollCount == 0;

  /* 프로필 뷰 카운트가 2일 때 */
  static bool isProfileCountTwo(DesktopState state) =>
      state.profileModel.scrollCount == 2;

  // 프로필 뷰 스크롤 활성화
  static bool isProfileViewScrollActive(DesktopState state) =>
      state.scrollModel.scrollController!.offset ==
          state.initModel.mainViewHeight &&
      state.mySkillModel.status == MySkillViewStatus.init &&
      state.scrollModel.profileViewState == ProfileViewState.inactive;

  //-- 사용자 스크롤 감지 조건 -- //
  static bool isBannerScrollActive(String viewName) => viewName == 'banner';
  static bool isProfileIsTopScrollActive(String viewName) =>
      viewName == 'profile_isTop';
  static bool isProfileIsBottomScrollActive(String viewName) =>
      viewName == 'profile_isBottom';
  static bool isUserScrollActive(String viewName) => viewName == 'skill';

  // 스킬 뷰 활성화
  static bool isSkillViewActive(DesktopState state) =>
      state.mySkillModel.status != MySkillViewStatus.init;
}
