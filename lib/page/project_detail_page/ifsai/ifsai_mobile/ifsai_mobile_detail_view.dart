import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:self_introduction_flutter/components/widget/top_nav_bar.dart';
import 'package:self_introduction_flutter/core_service/di/injector.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/navigation_view/widget/menu_screen.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/ifsai_cubit.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/ifsai_state.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/aboutMe_view/widget/player.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_mobile/widget/mobile_project_title.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_mobile/widget/mobile_sub_title.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_mobile/widget/terminal/mobile_terminal_view.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_mobile/widget/project_content/mobile_project_contents.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_mobile/widget/project_content/mobile_project_content2.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_mobile/widget/service/mobile_service_view.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_mobile/widget/background/mobile_background_view.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_mobile/widget/library/mobile_library_view.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_mobile/widget/faq/mobile_faq_view.dart';
import 'package:self_introduction_flutter/service/main_service.dart';
import 'package:visibility_detector/visibility_detector.dart';

class IfsaiMobileDetailPage extends StatelessWidget {
  const IfsaiMobileDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logicalWidth = MediaQuery.of(context).size.width;
    final isFoldable = logicalWidth >= 490;
    final isMobileDevice = MainService().isMobileDevice();

    return ScreenUtilInit(
      designSize:
          isMobileDevice
              ? isFoldable
                  ? const Size(770, 900)
                  : const Size(450, 752)
              : Size(logicalWidth, MediaQuery.of(context).size.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => di<IfsaiCubit>(),
          child: const IfsaiMobileDetailView(),
        );
      },
    );
  }
}

class IfsaiMobileDetailView extends StatelessWidget {
  const IfsaiMobileDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceType = MainService().setScreenSize(
      MediaQuery.of(context).size.width,
    );

    return BlocBuilder<IfsaiCubit, IfsaiState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              // 배경색 컨테이너 (스크롤에 따라 변하는 배경)
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Color.lerp(
                  Colors.white,
                  Colors.black,
                  state.backgroundDarkness,
                ),
              ),

              // 메인 콘텐츠
              SingleChildScrollView(
                controller: state.scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 상단 네비게이션
                    TopNavBar(
                      deviceType: deviceType,
                      isMenuClicked: state.isMenuClicked,
                      onPressed: () {
                        context.read<IfsaiCubit>().toggleMenu();
                      },
                      onHomePressed: () {
                        context.go('/');
                      },
                    ),

                    // 프로젝트 타이틀
                    const MobileProjectTitle(),
                    SizedBox(height: 130.h),
                    // 서브 타이틀
                    const MobileSubTitle(),
                    SizedBox(height: 80.h),
                    // 메인화면 시작 -- 6월 17일 작업 중
                    VisibilityDetector(
                      key: const Key('project-contents-view'),
                      onVisibilityChanged: (info) {
                        if (info.visibleFraction > 0.1 &&
                            !state.isProjectCard1Visible) {
                          context
                              .read<IfsaiCubit>()
                              .onProjectCardVisibilityChanged();
                          context
                              .read<IfsaiCubit>()
                              .hidePlayerForOtherSections();
                        }
                      },
                      child: MobileProjectContents(
                        isVisible: state.isProjectCard1Visible,
                      ),
                    ),

                    SizedBox(height: 100.h),

                    // (기술 스택)
                    VisibilityDetector(
                      key: const Key('project-content2-view'),
                      onVisibilityChanged: (info) {
                        if (info.visibleFraction > 0.1 &&
                            !state.isProjectCard3Visible) {
                          context
                              .read<IfsaiCubit>()
                              .onProjectCard3VisibilityChanged();
                          context
                              .read<IfsaiCubit>()
                              .hidePlayerForOtherSections();
                        }
                      },
                      child: MobileProjectContent2(
                        isVisible: state.isProjectCard3Visible,
                      ),
                    ),

                    SizedBox(height: 100.h),
                    MobileTerminalView(
                      state: state,
                      cubit: context.read<IfsaiCubit>(),
                    ),
                    SizedBox(height: 180.h),
                    VisibilityDetector(
                      key: const Key('mobile-service-view'),
                      onVisibilityChanged: (info) {
                        if (info.visibleFraction > 0.1 &&
                            !state.isServiceTabVisible) {
                          context
                              .read<IfsaiCubit>()
                              .onServiceTabVisibilityChanged();
                          context
                              .read<IfsaiCubit>()
                              .hidePlayerForOtherSections();
                        }
                      },
                      child: MobileServiceView(
                        state: state,
                        cubit: context.read<IfsaiCubit>(),
                      ),
                    ),
                    SizedBox(height: 180.h),
                    VisibilityDetector(
                      key: const Key('mobile-background-view'),
                      onVisibilityChanged: (info) {
                        if (info.visibleFraction > 0.2 &&
                            !state.hasBackgroundStartedPlaying &&
                            state.isBackgroundVideoInitialized) {
                          context
                              .read<IfsaiCubit>()
                              .onBackgroundVisibilityChanged();
                        }
                        if (info.visibleFraction > 0.3 &&
                            !state.isBackgrounTitleVisible) {
                          context
                              .read<IfsaiCubit>()
                              .onBackgroundWidgetVisibilityChanged();
                        }
                      },
                      child: MobileBackgroundView(
                        state: state,
                        cubit: context.read<IfsaiCubit>(),
                      ),
                    ),
                    SizedBox(height: 180.h),
                    MobileLibraryView(
                      state: state,
                      cubit: context.read<IfsaiCubit>(),
                    ),
                    SizedBox(height: 180.h),
                    MobileFaqView(
                      state: state,
                      cubit: context.read<IfsaiCubit>(),
                    ),
                    SizedBox(height: 150.h),
                  ],
                ),
              ),

              // 메뉴 스크린
              MenuScreen(isMenuClicked: state.isMenuClicked),

              // Player 위젯
              Positioned(
                bottom: 30.h,
                left: 0,
                right: 0,
                child: Player(
                  isPlayerAniOpacity: state.isPlayerVisible,
                  isPlayerText: state.playerText,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
