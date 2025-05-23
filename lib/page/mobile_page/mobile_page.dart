import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/core_service/di/injector.dart';
import 'package:self_introduction_flutter/model/main_page/intro_model.dart';
import 'package:self_introduction_flutter/page/mobile_page/mobile_cubit.dart';
import 'package:self_introduction_flutter/page/mobile_page/mobile_state.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/intro_view/intro_page.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/main_page.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/navigation_view/navi_bar.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/navigation_view/widget/menu_screen.dart';
import 'package:self_introduction_flutter/service/mobile_dialog.dart';

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
    return BlocProvider(
      create: (context) => di<MobileCubit>(),
      child: _MobileView(
        deviceType: deviceType,
        isMobileDevice: isMobileDevice,
      ),
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
    print(MediaQuery.of(context).size.height);
    return BlocBuilder<MobileCubit, MobileState>(
      builder: (context, state) {
        if (state.introModel.isMobileDialog == MobileDialogType.active &&
            widget.isMobileDevice) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showMobileDialog(context);
          });
        }
        return Scaffold(
          body: ListView(
            physics:
                state.scrollModel.isScrollWaiting
                    ? const NeverScrollableScrollPhysics()
                    : const AlwaysScrollableScrollPhysics(),
            controller: state.scrollModel.scrollController,
            children: [
              // MainPage(
              //   cubit: context.read<MobileCubit>(),
              //   aboutMeState: state.aboutMeModel,
              //   isTitelTextAniStart: state.introModel.isTitelTextAniStart,
              //   isChapterContainerAniStart:
              //       state.introModel.isChapterContainerAniStart,
              // ),
              Stack(
                children: [
                  Column(
                    children: [
                      AnimatedOpacity(
                        opacity: state.initModel.isMobileInit ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 600),
                        child: NaviBar(
                          deviceType: widget.deviceType,
                          isDeviceSelector: state.introModel.isDeviceSelector,
                          isDescription: state.introModel.isDescription,
                          isMenuClicked: state.introModel.isMenuClicked,
                          onPressed:
                              () => context.read<MobileCubit>().menuClicked(),
                          onHomePressed: () {
                            context.read<MobileCubit>().goHome();
                          },
                        ),
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 1000),
                        child:
                            state.introModel.isPageTransition
                                ? MainPage(
                                  key: const ValueKey('main'),
                                  cubit: context.read<MobileCubit>(),
                                  aboutMeState: state.aboutMeModel,
                                  isTitelTextAniStart:
                                      state.introModel.isTitelTextAniStart,
                                  isChapterContainerAniStart:
                                      state
                                          .introModel
                                          .isChapterContainerAniStart,
                                )
                                : IntroPage(
                                  key: const ValueKey('intro'),
                                  deviceType: widget.deviceType,
                                  introModel: state.introModel,
                                ),
                      ),
                    ],
                  ),
                  MenuScreen(isMenuClicked: state.introModel.isMenuClicked),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
