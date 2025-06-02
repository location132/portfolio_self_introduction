import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/components/widget/mobile_animation/two_line_title.dart';
import 'package:self_introduction_flutter/model/mobile_page/aboutMe_model.dart';
import 'package:self_introduction_flutter/model/mobile_page/chapter_model.dart';
import 'package:self_introduction_flutter/model/mobile_page/detailMe_model.dart';
import 'package:self_introduction_flutter/model/mobile_page/skill_model.dart';
import 'package:self_introduction_flutter/model/mobile_page/project_model.dart';
import 'package:self_introduction_flutter/page/mobile_page/mobile_cubit.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/aboutMe_view/aboutMe_page.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/chapter_view/chapter_page.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/detail_view/detailMe_page.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/skill_view/skill_page.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/project_view/project_page.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MainPage extends StatelessWidget {
  final bool isMobileDevice;
  final AboutMeModel aboutMeState;
  final DetailMeModel detailMeState;
  final ChapterModel chapterState;
  final SkillModel skillState;
  final ProjectModel projectState;
  final bool isTitelTextAniStart;
  final bool isChapterContainerAniStart;
  final MobileCubit cubit;
  const MainPage({
    super.key,
    required this.isMobileDevice,
    required this.aboutMeState,
    required this.detailMeState,
    required this.chapterState,
    required this.skillState,
    required this.projectState,
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
                            detailMeState.isDetailMe ||
                            chapterState.isBackGroundAniStart ||
                            skillState.isBackGroundAniStart ||
                            projectState.isBackGroundAniStart
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
              onCardTap: (int chapterIndex) {
                cubit.showChapterDetail(chapterIndex);
              },
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
            const SizedBox(height: 60),
            Visibility(
              visible: skillState.isSkillViewInit,
              child: Column(
                children: [
                  VisibilityDetector(
                    key: const Key('skill-view'),
                    onVisibilityChanged: (VisibilityInfo info) {
                      if (info.visibleFraction > 0.2 &&
                          !skillState.isBackGroundAniStart) {
                        cubit.skillBackGroundColor(true);
                      }
                    },
                    child: SkillPage(state: skillState),
                  ),
                  const SizedBox(height: 40),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TwoLineTitle(
                      isTitelText: projectState.isTitleAniStart,
                      title: '더 강력한 개발자로 UP',
                      subTitle: '신입 프로젝트를 더욱 멋지게',
                      color: Colors.white,
                      subTitleColor: Colors.white,
                    ),
                  ),
                  // 내 프로젝트
                  VisibilityDetector(
                    key: const Key('project-view'),
                    onVisibilityChanged: (VisibilityInfo info) {
                      if (info.visibleFraction > 0.6 &&
                          !projectState.isBackGroundAniStart) {
                        cubit.projectBackGroundColor(true);
                      }
                    },
                    child: ProjectPage(state: projectState, cubit: cubit),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ],
    );
  }
}
