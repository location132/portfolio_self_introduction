import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/core_service/di/injector.dart';
import 'package:self_introduction_flutter/page/mobile_page/mobile_cubit.dart';
import 'package:self_introduction_flutter/page/mobile_page/mobile_state.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/intro_view/intro_page.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/aboutMe_view/widget/%08player.dart';
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
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => di<MobileCubit>(),
          child: _MobileView(
            deviceType: deviceType,
            isMobileDevice: isMobileDevice,
          ),
        );
      },
    );
  }
}

class _MobileView extends StatefulWidget {
  final String deviceType;
  final bool isMobileDevice;
  const _MobileView({required this.deviceType, required this.isMobileDevice});

  @override
  State<_MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<_MobileView> {
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
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 1000),
                            child:
                                state.introModel.isPageTransition
                                    ? Visibility(
                                      visible: state.scrollModel.isAtBottom,
                                      child: MainPage(
                                        key: const ValueKey('main'),
                                        cubit: context.read<MobileCubit>(),
                                        aboutMeState: state.aboutMeModel,
                                        isTitelTextAniStart:
                                            state
                                                .introModel
                                                .isTitelTextAniStart,
                                        isChapterContainerAniStart:
                                            state
                                                .introModel
                                                .isChapterContainerAniStart,
                                      ),
                                    )
                                    : Visibility(
                                      visible: !state.aboutMeModel.isVisible,
                                      child: IntroPage(
                                        key: const ValueKey('intro'),
                                        introModel: state.introModel,
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
              Positioned(
                bottom: 30,
                left: 0,
                right: 0,
                child: Player(
                  isPlayerAniOpacity: state.aboutMeModel.isPlayerAniOpacity,
                  isPlayerText: state.isPlayerText,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
