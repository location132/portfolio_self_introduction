import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/condition_utils/profile_view_condition_utils.dart';
import 'package:self_introduction_flutter/components/widget/top_nav_bar.dart';
import 'package:self_introduction_flutter/core_service/di/injector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/core_service/util/slow_scroll_physics.dart';
import 'package:self_introduction_flutter/model/main_page/mySkill_model.dart';
import 'package:self_introduction_flutter/model/main_page/scroll_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_cubit.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_state.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/profile_view/profile_page.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/banner_view/banner_view.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/intro_view/introShowcase.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/skill_view/skill_view.dart';
import 'package:visibility_detector/visibility_detector.dart';

class DesktopPage extends StatelessWidget {
  final bool isChromeBrowser;
  final String deviceType;

  const DesktopPage({
    super.key,
    required this.isChromeBrowser,
    required this.deviceType,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<DesktopCubit>(),
      child: _MainView(
        isChromeBrowser: isChromeBrowser,
        deviceType: deviceType,
      ),
    );
  }
}

class _MainView extends StatefulWidget {
  final bool isChromeBrowser;
  final String deviceType;
  const _MainView({
    required this.isChromeBrowser,
    required this.deviceType,
  });

  @override
  State<_MainView> createState() => _MainViewState();
}

class _MainViewState extends State<_MainView> {
  @override
  void initState() {
    super.initState();
    print('check ==> initState11');
  }

  @override
  void dispose() {
    super.dispose();
    print('check ==> dispose');
  }

  Widget build(BuildContext context) {
    return BlocBuilder<DesktopCubit, DesktopState>(
      builder: (context, state) {
        if (state.initModel.mainViewHeight != 0.0 &&
            state.initModel.mainViewHeight !=
                state.scrollModel.scrollController!.position.maxScrollExtent) {
          context
              .read<DesktopCubit>()
              .changeProfileViewHeight(state.scrollModel.scrollController);
        }

        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              TopNavBar(deviceType: widget.deviceType),
              SizedBox(
                height: MediaQuery.of(context).size.height - 83,
                width: MediaQuery.of(context).size.width,
                child: SlowScrollPhysics(
                  state: state,
                  child: CustomScrollView(
                    controller: state.scrollModel.scrollController,
                    physics: const NeverScrollableScrollPhysics(),
                    slivers: [
                      SliverAppBar(
                        expandedHeight: MediaQuery.of(context).size.height,
                        pinned: false,
                        backgroundColor: Colors.transparent,
                        flexibleSpace: FlexibleSpaceBar(
                          background: Introshowcase(
                            state: state,
                            cubit: context.read<DesktopCubit>(),
                            isChromeBrowser: widget.isChromeBrowser,
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ProfilePage(
                              state: state,
                              cubit: context.read<DesktopCubit>(),
                            ),
                            // 배너 뷰
                            Visibility(
                              visible:
                                  ProfileViewConditionUtils.isSkillViewActive(
                                      state),
                              child: VisibilityDetector(
                                key: const Key('banner-view'),
                                onVisibilityChanged: (VisibilityInfo info) {
                                  if (info.visibleFraction > 0.2 &&
                                      state.scrollModel.bannerState ==
                                          BannerState.inactive) {
                                    context
                                        .read<DesktopCubit>()
                                        .viewListener('banner');
                                  }
                                },
                                child: BannerView(
                                  state: state,
                                  isActive: (bool isActive) {
                                    context
                                        .read<DesktopCubit>()
                                        .descriptionButton('banner', isActive);
                                  },
                                ),
                              ),
                            ),

                            // 스킬 뷰
                            Visibility(
                              visible:
                                  ProfileViewConditionUtils.isSkillViewActive(
                                      state),
                              child: VisibilityDetector(
                                key: const Key('skill-view'),
                                onVisibilityChanged: (VisibilityInfo info) {
                                  if (info.visibleFraction > 0.8 &&
                                      state.mySkillModel.status ==
                                          MySkillViewStatus.inactive) {
                                    context
                                        .read<DesktopCubit>()
                                        .viewListener('skill');
                                  }
                                },
                                child: SkillView(
                                  state: state,
                                  onTap: (int index) {
                                    context
                                        .read<DesktopCubit>()
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
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
