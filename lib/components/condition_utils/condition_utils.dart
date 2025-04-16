import 'package:self_introduction_flutter/model/main_page/description_model.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';
import 'package:self_introduction_flutter/model/main_page/scroll_model.dart';

class ProfileConditions {
  static bool isProfileViewActive(MainPageState state) =>
      state.scrollModel.profileViewState == ProfileViewState.active;

  static bool isIntroshowcaseActive(MainPageState state) =>
      state.descriptionModel.introshowcaseState == IntroshowcaseState.active;
}
