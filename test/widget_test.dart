import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/condition_utils/condition_utils.dart';
import 'package:self_introduction_flutter/components/widget/top_nav_bar.dart';
import 'package:self_introduction_flutter/core_service/di/injector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';

import 'package:self_introduction_flutter/model/main_page/mySkill_model.dart';
import 'package:self_introduction_flutter/model/main_page/scroll_model.dart';
import 'package:self_introduction_flutter/page/main_page/main_cubit.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/profile_view.dart';
import 'package:self_introduction_flutter/page/main_page/view/banner_view/banner_view.dart';
import 'package:self_introduction_flutter/page/main_page/view/intro_view/introShowcase.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/command_scroll.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/profile_background.dart';
import 'package:self_introduction_flutter/page/main_page/view/skill_view/skill_view.dart';

import 'package:visibility_detector/visibility_detector.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:js' as js;

class MainPage extends StatelessWidget {
  final bool isChromeBrowser;
  const MainPage({
    super.key,
    required this.isChromeBrowser,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<MainPageCubit>(),
      child: _MainView(isChromeBrowser: isChromeBrowser),
    );
  }
}

class _MainView extends StatefulWidget {
  final bool isChromeBrowser;
  const _MainView({
    required this.isChromeBrowser,
  });

  @override
  State<_MainView> createState() => _MainViewState();
}

class _MainViewState extends State<_MainView> {
  bool isCurrentlyScrolling = false;

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      // 웹에서 스크롤 속도 제어를 위한 JS 코드
      js.context.callMethod('eval', [
        '''
        document.addEventListener('wheel', function(event) {
          event.preventDefault();
        }, { passive: false });
      '''
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageCubit, MainPageState>(
      builder: (context, state) {
        if (state.initModel.mainViewHeight != 0.0 &&
            state.initModel.mainViewHeight !=
                state.scrollModel.scrollController!.position.maxScrollExtent) {
          context
              .read<MainPageCubit>()
              .changeProfileViewHeight(state.scrollModel.scrollController);
        }

        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              TopNavBar(toggleFullScreen: () {
                // TODO: 전체화면 비활성화
                // context.read<MainPageCubit>().toggleFullScreen(context);
              }),
              SizedBox(
                height: MediaQuery.of(context).size.height - 83,
                width: MediaQuery.of(context).size.width,
                child: kIsWeb
                    ? Listener(
                        onPointerSignal: (PointerSignalEvent event) {
                          if (event is PointerScrollEvent &&
                              Conditions.isMainPageScrollActive(state)) {
                            state.scrollModel.scrollController?.position.jumpTo(
                              (state.scrollModel.scrollController?.position
                                          .pixels ??
                                      0) +
                                  (event.scrollDelta.dy * 0.4),
                            );
                          }
                        },
                        child: CustomScrollView(
                          controller: state.scrollModel.scrollController,
                          physics: const NeverScrollableScrollPhysics(),
                          slivers: [
                            SliverAppBar(
                              expandedHeight:
                                  MediaQuery.of(context).size.height,
                              pinned: false,
                              backgroundColor: Colors.transparent,
                              flexibleSpace: FlexibleSpaceBar(
                                background: Introshowcase(
                                  state: state,
                                  initializeAnimations: context
                                      .read<MainPageCubit>()
                                      .awaitDuration,
                                  isChromeBrowser: widget.isChromeBrowser,
                                  isChromeBrowserWithCubit: context
                                      .read<MainPageCubit>()
                                      .isChromeBrowser,
                                ),
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      // 프로필 배경화면
                                      VisibilityDetector(
                                        key: const Key('profile-background'),
                                        onVisibilityChanged:
                                            (VisibilityInfo info) {
                                          if (Conditions
                                              .isProfileViewScrollActive(
                                                  state)) {
                                            context
                                                .read<MainPageCubit>()
                                                .viewListener(
                                                    'profile_background');
                                          }
                                        },
                                        child: const ProfileBackground(),
                                      ),

                                      // 프로필 뷰
                                      Positioned(
                                        top: 170.sh,
                                        child: ProfileView(
                                          state: state,
                                          onScroll: (String scrollState) {
                                            context
                                                .read<MainPageCubit>()
                                                .viewListener(scrollState);
                                          },
                                        ),
                                      ),
                                      CommandScroll(
                                        state: state,
                                        onScroll: (String scrollState) {
                                          context
                                              .read<MainPageCubit>()
                                              .viewListener(scrollState);
                                        },
                                      ),
                                    ],
                                  ),

                                  // 배너 뷰
                                  Visibility(
                                    visible:
                                        Conditions.isSkillViewActive(state),
                                    child: VisibilityDetector(
                                      key: const Key('banner-view'),
                                      onVisibilityChanged:
                                          (VisibilityInfo info) {
                                        if (info.visibleFraction > 0.2 &&
                                            state.scrollModel.bannerState ==
                                                BannerState.inactive) {
                                          context
                                              .read<MainPageCubit>()
                                              .viewListener('banner');
                                        }
                                      },
                                      child: BannerView(
                                        state: state,
                                        isActive: (bool isActive) {
                                          context
                                              .read<MainPageCubit>()
                                              .descriptionButton(
                                                  'banner', isActive);
                                        },
                                      ),
                                    ),
                                  ),

                                  // 스킬 뷰
                                  Visibility(
                                    visible:
                                        Conditions.isSkillViewActive(state),
                                    child: VisibilityDetector(
                                      key: const Key('skill-view'),
                                      onVisibilityChanged:
                                          (VisibilityInfo info) {
                                        if (info.visibleFraction > 0.8 &&
                                            state.mySkillModel.status ==
                                                MySkillViewStatus.inactive) {
                                          context
                                              .read<MainPageCubit>()
                                              .viewListener('skill');
                                        }
                                      },
                                      child: SkillView(
                                        state: state,
                                        onTap: (int index) {
                                          context
                                              .read<MainPageCubit>()
                                              .descriptionButton('skill', true);
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
              ),
            ],
          ),
        );
      },
    );
  }
}
