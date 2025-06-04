import 'package:self_introduction_flutter/model/init_model.dart';
import 'package:self_introduction_flutter/model/main_page/description_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_state.dart';
import 'package:self_introduction_flutter/model/main_page/scroll_model.dart';

class Conditions {
  // 배너 설명 활성화
  static bool isBannerDescriptionActive(DesktopState state) =>
      state.descriptionModel.bannerDescriptionState ==
      BannerDescriptionState.active;

  // 배너 설명 비활성화
  static bool isBannerDescriptionInactive(DesktopState state) =>
      state.descriptionModel.bannerDescriptionState ==
      BannerDescriptionState.inactive;

  // 프로필 뷰 활성화
  static bool isProfileViewActive(DesktopState state) =>
      state.scrollModel.profileViewState == ProfileViewState.active;

  // 프로필 뷰 비활성화
  static bool isProfileViewInactive(DesktopState state) =>
      state.scrollModel.profileViewState == ProfileViewState.inactive;

  // 초기화 상태
  static bool isInitState(DesktopState state) =>
      state.initModel.initState == InitState.inactive;

  // 초기화 상태 비활성화
  static bool isInitStateLoaded(DesktopState state) =>
      state.initModel.initState == InitState.active;

  // 메인 페이지 스크롤 활성화
}
