import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/widget/top_nav_bar.dart';
import 'package:self_introduction_flutter/core_service/di/injector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/model/main_page/mySkill_model.dart';
import 'package:self_introduction_flutter/model/main_page/scroll_model.dart';
import 'package:self_introduction_flutter/page/main_page/main_cubit.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';
import 'package:self_introduction_flutter/page/main_page/view/banner_view/widgets/circle_menu.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/profile_view.dart';
import 'package:self_introduction_flutter/page/main_page/view/banner_view/banner_view.dart';
import 'package:self_introduction_flutter/page/main_page/view/intro_view/introShowcase.dart';
import 'package:self_introduction_flutter/page/main_page/view/skill_view/skill_view.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<MainPageCubit>(),
      child: const _MainView(),
    );
  }
}

class _MainView extends StatefulWidget {
  const _MainView();

  @override
  State<_MainView> createState() => _MainViewState();
}

class _MainViewState extends State<_MainView> {
  bool isCurrentlyScrolling = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageCubit, MainPageState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              TopNavBar(toggleFullScreen: () {}),
              SizedBox(
                height: MediaQuery.of(context).size.height - 83,
                width: MediaQuery.of(context).size.width,
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      expandedHeight: MediaQuery.of(context).size.height,
                      pinned: false,
                      backgroundColor: Colors.transparent,
                      flexibleSpace: FlexibleSpaceBar(
                        background:
                            //--------------------------------
                            Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height - 400,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(13),
                                    bottomRight: Radius.circular(13),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 15,
                                      offset: Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 20,
                                      right: 20,
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white.withAlpha(70),
                                        ),
                                        child: const Icon(
                                          Icons.close,
                                          size: 24,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                    const Center(child: CircleMenu())
                                  ],
                                )),
                        //--------------------------------

                        // Introshowcase(
                        //   state: state,
                        //   initializeAnimations: context
                        //       .read<MainPageCubit>()
                        //       .initializeAnimations,
                        // ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 배너 뷰
                          VisibilityDetector(
                            key: const Key('banner-view'),
                            onVisibilityChanged: (VisibilityInfo info) {
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
                                    .descriptionButton('banner', isActive);
                              },
                            ),
                          ),

                          // 프로필 뷰
                          VisibilityDetector(
                            key: const Key('profile-view'),
                            onVisibilityChanged: (VisibilityInfo info) {
                              if (info.visibleFraction > 0.5 &&
                                  state.scrollModel.profileViewState ==
                                      ProfileViewState.inactive) {
                                context
                                    .read<MainPageCubit>()
                                    .viewListener('profile');
                              }
                            },
                            child: ProfileView(state: state),
                          ),

                          // 스킬 뷰
                          // VisibilityDetector(
                          //   key: const Key('skill-view'),
                          //   onVisibilityChanged: (VisibilityInfo info) {
                          //     if (info.visibleFraction > 0.8 &&
                          //         state.mySkillModel.status ==
                          //             MySkillViewStatus.init) {
                          //       context
                          //           .read<MainPageCubit>()
                          //           .mySkillViewListener(info.visibleFraction);
                          //     }
                          //   },
                          //   child: SkillView(
                          //     state: state,
                          //     onTap: (int index) {
                          //       context
                          //           .read<MainPageCubit>()
                          //           .descriptionButton(index);
                          //     },
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
