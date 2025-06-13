import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/ifsai_state.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/widget/background/background_description.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/widget/background/background_title.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/widget/background/background_video_player.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/widget/background/background_features_grid.dart';

class BgView extends StatelessWidget {
  final IfsaiState state;
  const BgView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
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
            const BackgroundDescription(),
          ],
        ),
        const SizedBox(height: 80),
        const BackgroundFeaturesGrid(),
      ],
    );
  }
}
