import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/components/widget/top_nav_bar.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/components/widget/mobile_animation/two_line_title.dart';
import 'package:self_introduction_flutter/model/mobile_page/aboutMe_model.dart';
import 'package:self_introduction_flutter/model/mobile_page/chapter_model.dart';
import 'package:self_introduction_flutter/model/mobile_page/detailMe_model.dart';
import 'package:self_introduction_flutter/model/mobile_page/skill_model.dart';
import 'package:self_introduction_flutter/model/mobile_page/project_model_mobile.dart';
import 'package:self_introduction_flutter/page/mobile_page/mobile_cubit.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/aboutMe_view/about_me_page.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/chapter_view/chapter_page.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/detail_view/detailMe_page.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/skill_view/skill_page.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/project_view/project_page.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatelessWidget {
  final bool isMobileDevice;
  final AboutMeModel aboutMeState;
  final DetailMeModel detailMeState;
  final ChapterModel chapterState;
  final SkillModel skillState;
  final ProjectModelWithMobile projectState;
  final bool isTitelTextAniStart;
  final bool isChapterContainerAniStart;
  final bool isBackGroundAniStart;
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
    required this.isBackGroundAniStart,
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
                (isBackGroundAniStart && isMobileDevice) || !isMobileDevice
                    ? Colors.black
                    : Colors.transparent,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Opacity(
              opacity: 0,
              child: IgnorePointer(
                ignoring: true,
                child: TopNavBar(
                  deviceType: 'mobile',
                  onPressed: () {},
                  onHomePressed: () {},
                  isMenuClicked: false,
                ),
              ),
            ),
            ChapterPage(
              isMobileDevice: isMobileDevice,
              isTitelTextAniStart: isTitelTextAniStart,
              isChapterContainerAniStart: isChapterContainerAniStart,
              isBackGroundAniStart: aboutMeState.isBackGroundAniStart,
              onCardTap: (int chapterIndex) {
                context.push('/chapter/$chapterIndex');
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
                      if (projectState.isProjectDetailVisible) return;

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
                        MainPageTextConstants.detailMeTitle,
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

                      if (info.visibleFraction > 0.9 &&
                          !detailMeState.isDetailMeRiveStart) {
                        cubit.detailMeImageAni();
                      }
                    },
                    child: DetailmePage(
                      state: detailMeState,
                      onReachedBottom: () {
                        cubit.continueMainScroll();
                      },
                      onReachedTop: () {
                        cubit.scrollMainUp();
                      },
                    ),
                  ),
                ],
              ),
            ),

            Visibility(
              visible: skillState.isSkillViewInit,
              child: Column(
                children: [
                  const SizedBox(height: 60),
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
                      title: MainPageTextConstants.projectSectionTitle,
                      subTitle: MainPageTextConstants.projectSectionSubTitle,
                      color: Colors.white,
                      subTitleColor: Colors.white,
                    ),
                  ),
                  // 내 프로젝트
                  VisibilityDetector(
                    key: const Key('project-view'),
                    onVisibilityChanged: (VisibilityInfo info) {
                      if (info.visibleFraction > 0.4 &&
                          projectState.isProjectDetailVisible) {
                        cubit.aboutMePlayerAni(true);
                      }
                      if (info.visibleFraction > 0.4 &&
                          !projectState.isBackGroundAniStart) {
                        cubit.projectBackGroundColor(true);
                      }
                    },
                    child: ProjectPageWithMobile(
                      state: projectState,
                      showProjectDetail: (category) {
                        cubit.showProjectDetail(category);
                      },
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
