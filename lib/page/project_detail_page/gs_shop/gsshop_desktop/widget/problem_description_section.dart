import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/project_detail_page/gs_shop/gsshop_desktop/widget/description_video_player.dart';
import 'package:self_introduction_flutter/page/project_detail_page/gs_shop/gsshop_desktop/widget/video_player_gs_shop.dart';

class ProblemDescriptionSection extends StatelessWidget {
  final bool isLeft;
  final String videoUrl;
  final String videoTitle;
  final String videoDescription;
  final String sectionTitle;
  final String sectionDescription;

  const ProblemDescriptionSection({
    super.key,
    required this.isLeft,
    required this.videoUrl,
    required this.videoTitle,
    required this.videoDescription,
    required this.sectionTitle,
    required this.sectionDescription,
  });

  @override
  Widget build(BuildContext context) {
    return isLeft
        ? Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DescriptionVideoPlayer(
              title: sectionTitle,
              description: sectionDescription,
            ),
            const SizedBox(width: 30),
            VideoPlayerWithGSShop(
              isLeft: isLeft,
              videoUrl: videoUrl,
              title: videoTitle,
              description: videoDescription,
            ),
          ],
        )
        : Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            VideoPlayerWithGSShop(
              circular: 55,
              isLeft: isLeft,
              videoUrl: videoUrl,
              title: videoTitle,
              description: videoDescription,
            ),
            const SizedBox(width: 30),
            DescriptionVideoPlayer(
              title: sectionTitle,
              description: sectionDescription,
            ),
          ],
        );
  }
}
