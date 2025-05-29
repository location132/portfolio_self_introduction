import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/model/mobile_page/aboutMe_model.dart';
import 'package:self_introduction_flutter/model/mobile_page/detailMe_model.dart';
import 'package:self_introduction_flutter/page/mobile_page/mobile_cubit.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/aboutMe_view/aboutMe_page.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/chapter_view/chapter_page.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/detail_view/detailMe_page.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MainPage extends StatelessWidget {
  final bool isMobileDevice;
  final AboutMeModel aboutMeState;
  final DetailMeModel detailMeState;
  final bool isTitelTextAniStart;
  final bool isChapterContainerAniStart;
  final MobileCubit cubit;
  const MainPage({
    super.key,
    required this.isMobileDevice,
    required this.aboutMeState,
    required this.detailMeState,
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
                isMobileDevice
                    ? aboutMeState.isBackGroundAniStart ||
                            detailMeState.isDetailMe
                        ? Colors.black
                        : Colors.transparent
                    : Colors.black,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChapterPage(
              isMobileDevice: isMobileDevice,
              isTitelTextAniStart: isTitelTextAniStart,
              isChapterContainerAniStart: isChapterContainerAniStart,
              isBackGroundAniStart: aboutMeState.isBackGroundAniStart,
            ),
            Visibility(
              visible: isMobileDevice ? aboutMeState.isVisible : true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VisibilityDetector(
                    key: const Key('aboutMe-view'),
                    onVisibilityChanged: (VisibilityInfo info) {
                      if (isMobileDevice) {
                        if (info.visibleFraction > 0.3 &&
                            !aboutMeState.isPlayerAniOpacity &&
                            !detailMeState.isDetailMe) {
                          cubit.aboutMePlayerAni(true);
                        } else if (info.visibleFraction < 0.2 &&
                            aboutMeState.isPlayerAniOpacity) {
                          cubit.aboutMePlayerAni(false);
                        }

                        if (info.visibleFraction > 0.2 &&
                            !aboutMeState.isBackGroundAniStart) {
                          cubit.aboutMeBackGroundColor(true);
                        } else if (info.visibleFraction < 0.2 &&
                            aboutMeState.isBackGroundAniStart) {
                          cubit.aboutMeBackGroundColor(false);
                        }
                      } else {
                        if (MediaQuery.of(context).size.width > 730) {
                          cubit.aboutMeBackGroundColor(true);
                          cubit.aboutMePlayerAni(true);
                        } else {
                          if (info.visibleFraction > 0.3 &&
                              !aboutMeState.isPlayerAniOpacity &&
                              !detailMeState.isDetailMe) {
                            cubit.aboutMePlayerAni(true);
                          } else if (info.visibleFraction < 0.2 &&
                              aboutMeState.isPlayerAniOpacity) {
                            cubit.aboutMePlayerAni(false);
                          }

                          if (info.visibleFraction > 0.2 &&
                              !aboutMeState.isBackGroundAniStart) {
                            cubit.aboutMeBackGroundColor(true);
                          } else if (info.visibleFraction < 0.2 &&
                              aboutMeState.isBackGroundAniStart) {
                            cubit.aboutMeBackGroundColor(false);
                          }
                        }
                      }
                    },
                    child: AboutMePage(
                      state: aboutMeState,
                      isDetailMeRiveStart: detailMeState.isDetailMeRiveStart,
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: detailMeState.isDetailMeRiveStart ? 1 : 0,
                    duration: const Duration(milliseconds: 500),
                    child: Padding(
                      padding: EdgeInsets.only(top: 40.h, left: 32),
                      child: Text(
                        '더 자세히 살펴보기.',
                        style: TextStyle(
                          fontSize: 25.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  VisibilityDetector(
                    key: const Key('detailMe-view'),
                    onVisibilityChanged: (VisibilityInfo info) {
                      if (info.visibleFraction > 0.2 &&
                          !detailMeState.isDetailMe) {
                        cubit.detailMePageStart(true);
                      } else if (info.visibleFraction < 0.2 &&
                          detailMeState.isDetailMe) {
                        cubit.detailMePageStart(false);
                      }

                      if (info.visibleFraction == 1 &&
                          !detailMeState.isDetailMeRiveStart) {
                        cubit.detailMeImageAni();
                      }
                    },
                    child: DetailmePage(state: detailMeState),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
