import 'package:flutter/material.dart';

import 'package:self_introduction_flutter/components/condition_utils/profile_view_condition_utils.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/main_page/main_cubit.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/profile_view.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/background/command_scroll.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/background/profile_background.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ProfilePage extends StatelessWidget {
  final MainPageState state;
  final MainPageCubit cubit;
  const ProfilePage({super.key, required this.state, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 프로필 배경화면
        VisibilityDetector(
          key: const Key('profile-background'),
          onVisibilityChanged: (VisibilityInfo info) async {
            if (ProfileViewConditionUtils.isProfileViewScrollActive(state)) {
              await cubit.profileViewActive();
            }
          },
          child: const ProfileBackground(),
        ),

        // 프로필 뷰
        Positioned(
          top: 170.sh,
          child: ProfileView(
            profileModel: state.profileModel,
          ),
        ),

        // // 스크롤 감지, 터치 감지
        CommandScroll(
          state: state,
          cubit: cubit,
          onTap: () {
            cubit.userClickWithProfileViewScreen();
          },
        ),
      ],
    );
  }
}
