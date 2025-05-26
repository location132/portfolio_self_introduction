import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/model/mobile_page/aboutMe_model.dart';
import 'package:self_introduction_flutter/page/mobile_page/mobile_cubit.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/aboutMe_view/aboutMe_page.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/chapter_view/chapter_page.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MainPage extends StatelessWidget {
  final AboutMeModel aboutMeState;
  final bool isTitelTextAniStart;
  final bool isChapterContainerAniStart;
  final MobileCubit cubit;
  const MainPage({
    super.key,
    required this.aboutMeState,
    required this.isTitelTextAniStart,
    required this.isChapterContainerAniStart,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            color:
                aboutMeState.isBackGroundAniStart
                    ? Colors.black
                    : Colors.transparent,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChapterPage(
              isTitelTextAniStart: isTitelTextAniStart,
              isChapterContainerAniStart: isChapterContainerAniStart,
              isBackGroundAniStart: aboutMeState.isBackGroundAniStart,
            ),
            const SizedBox(height: 90),
            Visibility(
              visible: aboutMeState.isVisible,
              child: VisibilityDetector(
                key: const Key('aboutMe-view'),
                onVisibilityChanged: (VisibilityInfo info) {
                  if (info.visibleFraction > 0.7 &&
                      !aboutMeState.isPlayerAniOpacity) {
                    cubit.aboutMePlayerAni(true);
                  } else if (info.visibleFraction < 0.7) {
                    cubit.aboutMePlayerAni(false);
                  }

                  if (info.visibleFraction > 0.3) {
                    cubit.aboutMeBackGroundColor(true);
                  } else {
                    cubit.aboutMeBackGroundColor(false);
                  }
                },
                child: AboutMePage(state: aboutMeState, cubit: cubit),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
