import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:self_introduction_flutter/components/widget/top_nav_bar.dart';
import 'package:self_introduction_flutter/core_service/di/injector.dart';
import 'package:self_introduction_flutter/model/project_detail/ifsai_model.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/navigation_view/widget/menu_screen.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_cubit.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_state.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/widget/background/bg_view.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/widget/faq_widget/faq_manager.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/widget/project_content/project_content2.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/widget/project_content/project_contents.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/widget/project_detail_section.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/widget/project_player.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/widget/service_tabs_widget.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/widget/libraries_widget/library_manager.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/widget/terminal_widget/terminal_view.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/widget/title/sub_title.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/widget/title/project_detail_title_no_animation.dart';
import 'package:self_introduction_flutter/service/main_service.dart';
import 'package:visibility_detector/visibility_detector.dart';

class IfsaiDetailPage extends StatelessWidget {
  const IfsaiDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<IfsaiCubit>(),
      child: IfsaiDetailView(),
    );
  }
}

class IfsaiDetailView extends StatelessWidget {
  const IfsaiDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final logicalWidth = MediaQuery.of(context).size.width;
    final isFoldable = logicalWidth >= 490;
    final isMobileDevice = MainService().isMobileDevice();
    final deviceType = MainService().setScreenSize(
      MediaQuery.of(context).size.width,
    );

    return BlocBuilder<IfsaiCubit, IfsaiState>(
      builder: (context, state) {
        return Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Color.lerp(
                Colors.white,
                Colors.black,
                state.backgroundDarkness,
              ),
            ),

            SingleChildScrollView(
              controller: state.scrollController,
              // physics:
              //     state.isScrollEnabled
              //         ? const BouncingScrollPhysics()
              //         : const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopNavBar(
                    deviceType: deviceType,
                    isMenuClicked: state.isMenuClicked,
                    onPressed:
                        deviceType == 'mobile'
                            ? () {
                              context.read<IfsaiCubit>().toggleMenu();
                            }
                            : null,
                    onHomePressed: () {
                      context.go('/');
                    },
                  ),
                  if (MediaQuery.of(context).size.width > 1200) ...[
                    SizedBox(height: MediaQuery.of(context).size.height - 83),
                    SizedBox(
                      height:
                          (-0.5 * MediaQuery.of(context).size.height + 1650),
                    ),
                  ],
                  Column(
                    children: [
                      if (MediaQuery.of(context).size.width < 1200) ...[
                        ProjectDetailTitleNoAnimation(),
                        SubTitleNoAnimation(),
                      ],

                      VisibilityDetector(
                        key: const Key('project-contents-view'),
                        onVisibilityChanged: (VisibilityInfo info) {
                          if (info.visibleFraction > 0.1 &&
                              !state.isPlayerVisible) {
                            context.read<IfsaiCubit>().setPlayerVisible(true);
                          } else if (info.visibleFraction < 0.1 &&
                              state.isPlayerVisible) {
                            context.read<IfsaiCubit>().setPlayerVisible(false);
                          }
                        },
                        child: ProjectContents(
                          state: state,
                          cubit: context.read<IfsaiCubit>(),
                        ),
                      ),

                      SizedBox(height: 200),
                      ProjectContent2(
                        isProjectCard3Visible: state.isProjectCard3Visible,
                        cubit: context.read<IfsaiCubit>(),
                      ),
                      SizedBox(height: 200),
                      TerminalView(
                        state: state,
                        cubit: context.read<IfsaiCubit>(),
                      ),
                      SizedBox(height: 200),
                      // Service 탭바 위젯
                      VisibilityDetector(
                        key: const Key('service-tab-view'),
                        onVisibilityChanged: (info) {
                          if (info.visibleFraction > 0.5 &&
                              !state.isServiceTabVisible) {
                            context
                                .read<IfsaiCubit>()
                                .onServiceTabVisibilityChanged();
                          }
                        },
                        child: ServiceTabsWidget(
                          isServiceTabVisible: state.isServiceTabVisible,
                        ),
                      ),
                      SizedBox(height: 200),
                      // 백그라운드 섹션
                      VisibilityDetector(
                        key: const Key('background-video'),
                        onVisibilityChanged: (info) {
                          if (info.visibleFraction > 0.2 &&
                              !state.hasBackgroundStartedPlaying &&
                              state.isBackgroundVideoInitialized) {
                            context
                                .read<IfsaiCubit>()
                                .onBackgroundVisibilityChanged();
                          }
                          if (info.visibleFraction > 0.5 &&
                              !state.isBackgrounTitleVisible) {
                            context
                                .read<IfsaiCubit>()
                                .onBackgroundWidgetVisibilityChanged();
                          }

                          if (info.visibleFraction > 0.3) {
                            context
                                .read<IfsaiCubit>()
                                .setBackgroundSectionVisible(true);
                            context
                                .read<IfsaiCubit>()
                                .setLibraryCardsAnimationStarted(false);
                          } else {
                            context
                                .read<IfsaiCubit>()
                                .setBackgroundSectionVisible(false);
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: BgView(state: state),
                        ),
                      ),
                      SizedBox(height: 200),

                      // 라이브러리 섹션
                      VisibilityDetector(
                        key: const Key('library-section-view'),
                        onVisibilityChanged: (info) {
                          if (info.visibleFraction > 0.8) {
                            context
                                .read<IfsaiCubit>()
                                .setLibraryCardsAnimationStarted(true);
                          }
                        },
                        child: LibraryManager.build(context, state),
                      ),
                      SizedBox(height: 200),

                      // FAQ
                      VisibilityDetector(
                        key: const Key('faq-view'),
                        onVisibilityChanged: (info) {
                          if (info.visibleFraction < 0.6) {
                            context.read<IfsaiCubit>().onFaqVisibilityChanged(
                              0,
                            );
                          } else {
                            context.read<IfsaiCubit>().onFaqVisibilityChanged(
                              1,
                            );
                          }
                        },
                        child: FaqManager.build(context, state),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (deviceType == 'mobile') ...[
              ScreenUtilInit(
                designSize:
                    isMobileDevice
                        ? isFoldable
                            ? const Size(770, 900)
                            : const Size(450, 752)
                        : Size(
                          logicalWidth,
                          MediaQuery.of(context).size.height,
                        ),

                minTextAdapt: true,
                splitScreenMode: true,
                builder: (context, child) {
                  return MenuScreen(isMenuClicked: state.isMenuClicked);
                },
              ),
            ],

            if (MediaQuery.of(context).size.width > 1200) ...[
              ProjectDetailSection(
                model: IfsaiModel(),
                mainTitleOpacity: state.mainTitleOpacity,
                descriptionOpacity: state.descriptionOpacity,
                titleOpacity: state.titleOpacity,
                titleScale: state.titleScale,
                titleOffset: state.titleOffset,
                scrollDescriptionOpacity: state.scrollDescriptionOpacity,
                mainTitleTranslateY: state.mainTitleTranslateY,
                descriptionTranslateY: state.descriptionTranslateY,
                textColor: state.textColor,
                setScrollEnabled:
                    (isEnabled) =>
                        context.read<IfsaiCubit>().setScrollEnabled(isEnabled),
              ),
            ],

            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: ProjectPlayer(
                isPlayerAniOpacity: state.isPlayerVisible,
                isPlayerText: state.playerText,
                isLongText: state.isPlayerLongText,
                isWhiteBackground: state.isPlayerWhiteBackground,
              ),
            ),
          ],
        );
      },
    );
  }
}
