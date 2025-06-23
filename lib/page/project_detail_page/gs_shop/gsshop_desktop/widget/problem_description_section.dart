import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/page/project_detail_page/gs_shop/gsshop_desktop/widget/description_video_player.dart';
import 'package:self_introduction_flutter/page/project_detail_page/gs_shop/gsshop_desktop/widget/video_player_gs_shop.dart';

class ProblemDescriptionSection extends StatelessWidget {
  final bool isMobile;
  final bool isLeft;
  final String videoUrl;
  final String videoTitle;
  final String videoDescription;
  final String sectionTitle;
  final String sectionDescription;
  final bool isTextOnTop;

  const ProblemDescriptionSection({
    super.key,
    this.isMobile = false,
    required this.isLeft,
    required this.videoUrl,
    required this.videoTitle,
    required this.videoDescription,
    required this.sectionTitle,
    required this.sectionDescription,
    this.isTextOnTop = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth <= 900;

    if (isSmallScreen) {
      final textWidget = Center(
        child: Container(
          width: 435,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                sectionTitle,
                style: TextStyle(
                  fontSize: isMobile ? 28.sp : 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[100],
                  height: 1.3,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: isMobile ? 40.h : 40),
              Text(
                sectionDescription,
                style: TextStyle(
                  fontSize: isMobile ? 17.sp : 17,
                  color: Colors.grey[300],
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );

      final videoWidget = VideoPlayerWithGSShop(
        circular: 55,
        isLeft: true,
        videoUrl: videoUrl,
        title: videoTitle,
        description: videoDescription,
      );

      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:
            isTextOnTop
                ? [
                  textWidget,
                  SizedBox(height: isMobile ? 40.h : 40),
                  videoWidget,
                ]
                : [
                  videoWidget,
                  SizedBox(height: isMobile ? 40.h : 40),
                  textWidget,
                ],
      );
    } else {
      return isLeft
          ? Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: DescriptionVideoPlayer(
                  title: sectionTitle,
                  description: sectionDescription,
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: VideoPlayerWithGSShop(
                  isLeft: isLeft,
                  videoUrl: videoUrl,
                  title: videoTitle,
                  description: videoDescription,
                ),
              ),
            ],
          )
          : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: VideoPlayerWithGSShop(
                  circular: 55,
                  isLeft: isLeft,
                  videoUrl: videoUrl,
                  title: videoTitle,
                  description: videoDescription,
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: DescriptionVideoPlayer(
                  title: sectionTitle,
                  description: sectionDescription,
                ),
              ),
            ],
          );
    }
  }
}
