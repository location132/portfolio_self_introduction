//아래의 클래스는 프로필 뷰 조건 처리 클래스의 조건을 모아둔 클래스입니다.

import 'package:self_introduction_flutter/model/main_page/scroll_model.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';

class ProfileViewConditionUtils {
  // 프로필 뷰 스크롤 비활성화
  static bool isProfileViewScrollInactive(MainPageState state) =>
      state.scrollModel.profileViewState == ProfileViewState.active &&
      state.profileModel.isUserClick == false &&
      state.scrollModel.isScrollWaiting == false;

  /* 프로필 뷰 카운트가 4가 아닐 때 */
  static bool isNotScrollCountFour(MainPageState state) =>
      state.profileModel.scrollCount != 4;

  /* 파이널 카운트보다 프로필 카운트가 클 때 */
  static bool isProfileCountGreaterThanFinalCount(MainPageState state) =>
      state.profileModel.scrollCount > state.profileModel.finalCount;

  /* 프로필 카운트가 3 또는 4일 때 조건 */
  static bool isCountingWithThreeOrFour(MainPageState state) =>
      state.profileModel.scrollCount == 3 ||
      state.profileModel.scrollCount == 4;

  /* 스크롤 대기 조건 */
  static bool isScrollWaiting(MainPageState state) =>
      state.scrollModel.isScrollWaiting == true;

  /* 프로필 뷰 카운트가 0일 때 */
  static bool isProfileCountZero(MainPageState state) =>
      state.profileModel.scrollCount == 0;

  /* 프로필 뷰 카운트가 2일 때 */
  static bool isProfileCountTwo(MainPageState state) =>
      state.profileModel.scrollCount == 2;
}
