import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_state.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/widget/background/background_video_player.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/widget/background/background_description.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/widget/background/background_features_grid.dart';

class TabletBackgroundLayout {
  static Widget build(IfsaiState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          '사용자 경험을 위해 탄생한 백그라운드\n조용하게 돌아가는 최고의 기술',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 40),
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 450),
                  child: BackgroundVideoPlayer(state: state),
                ),
              ),
              const SizedBox(width: 40),
              Flexible(
                flex: 1,
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: BackgroundDescription(
                    isTitleVisible: state.isBackgrounTitleVisible,
                    isContentVisible: state.isBackgroundContentVisible,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 60),
        BackgroundFeaturesGrid(
          isBackgroundFeatureVisible: state.isBackgroundFeatureVisible,
        ),
      ],
    );
  }
}
