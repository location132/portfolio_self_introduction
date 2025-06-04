import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/widget/top_nav_bar.dart';
import 'package:self_introduction_flutter/core_service/di/injector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/core_service/util/slow_scroll_physics.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_cubit.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_state.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/banner_view/banner_page.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_view/chapter_page.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/intro_view/introShowcase.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/skill_view/skill_page.dart';

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
  const _MainView({required this.isChromeBrowser, required this.deviceType});

  @override
  State<_MainView> createState() => _MainViewState();
}

class _MainViewState extends State<_MainView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DesktopCubit, DesktopState>(
      builder: (context, state) {
        return Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 2500),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                children: [
                  TopNavBar(
                    deviceType: widget.deviceType,
                    isMenuClicked: false,
                  ),
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
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: AnimatedOpacity(
                                    opacity:
                                        state
                                                .chapterModel
                                                .isBlackBackgroundColor
                                            ? 1
                                            : 0,
                                    duration: const Duration(seconds: 1),
                                    child: Container(color: Colors.black),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BannerPage(
                                      state: state,
                                      desktopCubit:
                                          context.read<DesktopCubit>(),
                                    ),

                                    SkillPage(
                                      state: state,
                                      desktopCubit:
                                          context.read<DesktopCubit>(),
                                    ),
                                    Visibility(
                                      visible:
                                          state.chapterModel.isChapterActive,
                                      child: ChapterPage(
                                        state: state,
                                        desktopCubit:
                                            context.read<DesktopCubit>(),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
