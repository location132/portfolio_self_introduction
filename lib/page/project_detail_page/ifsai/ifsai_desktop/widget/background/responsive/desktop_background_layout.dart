import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/ifsai_state.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/widget/background/background_title.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/widget/background/background_video_player.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/widget/background/background_description.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/widget/background/background_features_grid.dart';

class DesktopBackgroundLayout {
  static Widget build(IfsaiState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const BackgroundTitle(),
        const SizedBox(height: 60),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BackgroundVideoPlayer(state: state),
            const SizedBox(width: 60),
            BackgroundDescription(
              isTitleVisible: state.isBackgrounTitleVisible,
              isContentVisible: state.isBackgroundContentVisible,
            ),
          ],
        ),
        const SizedBox(height: 80),
        BackgroundFeaturesGrid(
          isBackgroundFeatureVisible: state.isBackgroundFeatureVisible,
        ),
      ],
    );
  }
}
