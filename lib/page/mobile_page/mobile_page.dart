import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/core_service/di/injector.dart';
import 'package:self_introduction_flutter/page/mobile_page/mobile_cubit.dart';
import 'package:self_introduction_flutter/page/mobile_page/mobile_state.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/intro_view/intro_page.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/aboutMe_view/widget/player.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/chapter_view/widget/chapter_detail/chapter_detail_screen.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/main_page.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/navigation_view/navi_bar.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/navigation_view/widget/menu_screen.dart';

class MobilePage extends StatelessWidget {
  final String deviceType;
  final bool isMobileDevice;
  const MobilePage({
    super.key,
    required this.deviceType,
    required this.isMobileDevice,
  });

  @override
  Widget build(BuildContext context) {
    final logicalWidth = MediaQuery.of(context).size.width;
    final isFoldable = logicalWidth >= 490;
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
          create: (context) => di<MobileCubit>(),
          child: _MobileView(
            deviceType: deviceType,
            isMobileDevice: isMobileDevice,
            isFoldable: isFoldable,
          ),
        );
      },
    );
  }
}

class _MobileView extends StatefulWidget {
  final String deviceType;
  final bool isMobileDevice;
  final bool isFoldable;
  const _MobileView({
    required this.deviceType,
    required this.isMobileDevice,
    required this.isFoldable,
  });

  @override
  State<_MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<_MobileView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<MobileCubit>().isMobileFoldable(widget.isFoldable);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MobileCubit, MobileState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              ListView(
                physics:
                    state.scrollModel.isScrollWaiting
                        ? const NeverScrollableScrollPhysics()
                        : const ClampingScrollPhysics(),
                controller: state.scrollModel.scrollController,
                children: [
                  Stack(
                    children: [
                      Column(
                        children: [
                          AnimatedOpacity(
                            opacity: state.initModel.isMobileInit ? 1.0 : 0.0,
                            duration: const Duration(milliseconds: 600),
                            child: NaviBar(
                              deviceType: widget.deviceType,
                              isDeviceSelector:
                                  state.introModel.isDeviceSelector,
                              isDescription: state.introModel.isDescription,
                              isMenuClicked: state.introModel.isMenuClicked,
                              onPressed:
                                  () =>
                                      context.read<MobileCubit>().menuClicked(),
                              onHomePressed: () {
                                context.read<MobileCubit>().goHome();
                              },
                            ),
                          ),

                          //--------------------
                          AnimatedOpacity(
                            opacity:
                                state.introModel.isPageTransition ? 0.0 : 1.0,
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.easeInOut,
                            child: Visibility(
                              visible: !state.introModel.isIntroInActive,
                              child: IntroPage(
                                key: const ValueKey('intro'),
                                introModel: state.introModel,
                              ),
                            ),
                          ),
                          Visibility(
                            visible: state.introModel.isIntroImageChange,
                            child: AnimatedOpacity(
                              opacity:
                                  state.introModel.isPageTransition ? 1.0 : 0.0,
                              duration: const Duration(milliseconds: 600),
                              curve: Curves.easeInOut,
                              child: MainPage(
                                key: const ValueKey('main'),
                                chapterState: state.chapterModel,
                                cubit: context.read<MobileCubit>(),
                                aboutMeState: state.aboutMeModel,
                                detailMeState: state.detailMeModel,
                                isTitelTextAniStart:
                                    state.introModel.isTitelTextAniStart,
                                isChapterContainerAniStart:
                                    state.introModel.isChapterContainerAniStart,
                                isMobileDevice: widget.isMobileDevice,
                              ),
                            ),
                          ),
                        ],
                      ),
                      MenuScreen(isMenuClicked: state.introModel.isMenuClicked),
                    ],
                  ),
                ],
              ),
              //플레이어
              Positioned(
                bottom: 30,
                left: 0,
                right: 0,
                child: Player(
                  isPlayerAniOpacity: state.aboutMeModel.isPlayerAniOpacity,
                  isPlayerText: state.isPlayerText,
                ),
              ),
              // 챕터 상세 화면
              Positioned.fill(
                child: ChapterDetailScreen(
                  chapterState: state.chapterModel,
                  onClose: () {
                    context.read<MobileCubit>().hideChapterDetail();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
