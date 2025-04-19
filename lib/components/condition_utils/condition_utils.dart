import 'package:self_introduction_flutter/model/init_model.dart';
import 'package:self_introduction_flutter/model/main_page/description_model.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';
import 'package:self_introduction_flutter/model/main_page/scroll_model.dart';
import 'package:visibility_detector/visibility_detector.dart';

class Conditions {
  // 배너 설명 활성화
  static bool isBannerDescriptionActive(MainPageState state) =>
      state.descriptionModel.bannerDescriptionState ==
      BannerDescriptionState.active;

  // 배너 설명 비활성화
  static bool isBannerDescriptionInactive(MainPageState state) =>
      state.descriptionModel.bannerDescriptionState ==
      BannerDescriptionState.inactive;

  // 프로필 뷰 활성화
  static bool isProfileViewActive(MainPageState state) =>
      state.scrollModel.profileViewState == ProfileViewState.active;

  // 프로필 뷰 비활성화
  static bool isProfileViewInactive(MainPageState state) =>
      state.scrollModel.profileViewState == ProfileViewState.inactive;

  // 초기화 상태
  static bool isInitState(MainPageState state) =>
      state.initModel.initState == InitState.inactive;

  // 초기화 상태 비활성화
  static bool isInitStateLoaded(MainPageState state) =>
      state.initModel.initState == InitState.active;

  // 메인 페이지 스크롤 활성화
  static bool isMainPageScrollActive(MainPageState state) =>
      state.initModel.initState == InitState.inactive &&
      state.scrollModel.profileViewState == ProfileViewState.inactive;

  // 프로필 뷰 스크롤 활성화
  static bool isProfileViewScrollActive(
          MainPageState state, VisibilityInfo info) =>
      state.scrollModel.scrollController!.offset ==
          state.initModel.mainViewHeight &&
      info.visibleFraction > 0.85 &&
      state.scrollModel.profileViewState == ProfileViewState.inactive;

  // 프로필 뷰 스크롤 비활성화
  static bool isProfileViewScrollInactive(MainPageState state) =>
      state.scrollModel.profileViewState == ProfileViewState.active;

  //-- 사용자 스크롤 감지 조건 -- //
  static bool isBannerScrollActive(String viewName) => viewName == 'banner';
  static bool isProfileBackgroundScrollActive(String viewName) =>
      viewName == 'profile_background';
  static bool isProfileIsTopScrollActive(String viewName) =>
      viewName == 'profile_isTop';
  static bool isProfileIsBottomScrollActive(String viewName) =>
      viewName == 'profile_isBottom';
  static bool isUserScrollActive(String viewName) => viewName == 'skill';
}
