import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:self_introduction_flutter/components/widget/animation/widget_animation.dart';
import 'package:self_introduction_flutter/components/widget/mobile_animation/two_line_title.dart';
import 'package:self_introduction_flutter/components/widget/top_nav_bar.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/core_service/di/injector.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/widget/menu/project_menu_bar.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/widget/project_list_container.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/widget/project_title.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/project_view/project_page.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/project_view/project_detail_content.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/aboutMe_view/widget/player.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/navigation_view/widget/menu_screen.dart';
import 'package:self_introduction_flutter/page/projects_main_page/projects_main_cubit.dart';
import 'package:self_introduction_flutter/page/projects_main_page/projects_main_state.dart';
import 'package:self_introduction_flutter/service/main_service.dart';

class ProjectsMainPage extends StatefulWidget {
  const ProjectsMainPage({super.key});

  @override
  State<ProjectsMainPage> createState() => _ProjectsMainPageState();
}

class _ProjectsMainPageState extends State<ProjectsMainPage> {
  late ProjectsMainCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = di<ProjectsMainCubit>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cubit.initializePage();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_cubit.state.isMenuClicked) {
      _cubit.toggleMenu();
    }
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(value: _cubit, child: _ProjectsMainView());
  }
}

class _ProjectsMainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mobileDevice = MainService().isMobileDevice();
    final logicalWidth = MediaQuery.of(context).size.width;
    final isFoldable = logicalWidth >= 490;

    final deviceType = MainService().setScreenSize(
      MediaQuery.of(context).size.width,
    );

    return BlocBuilder<ProjectsMainCubit, ProjectsMainState>(
      builder: (context, state) {
        return Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 2500),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        color: Colors.white,
                        child:
                            deviceType == 'desktop'
                                ? WidgetAnimation(
                                  isStart: state.isNaviAniStart,
                                  child: TopNavBar(
                                    deviceType: deviceType,
                                    isMenuClicked: false,
                                    onHomePressed: () {
                                      context.go('/');
                                    },
                                  ),
                                )
                                : TopNavBar(
                                  deviceType: deviceType,
                                  isMenuClicked: state.isMenuClicked,
                                  onPressed: () {
                                    context
                                        .read<ProjectsMainCubit>()
                                        .toggleMenu();
                                  },
                                  onHomePressed: () {
                                    context.go('/');
                                  },
                                ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          color: Colors.black,
                          child: SingleChildScrollView(
                            physics: const ClampingScrollPhysics(),
                            child: Column(
                              children: [
                                if (deviceType == 'desktop') ...[
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      children: [
                                        SizedBox(height: 120),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ProjectTitle(
                                              isTitleVisible:
                                                  state
                                                      .projectModel
                                                      .isTitleAniStart,
                                            ),
                                            const SizedBox(height: 80),
                                            ProjectMenuBar(
                                              state: state.projectModel,
                                              onCategorySelected: (category) {
                                                context
                                                    .read<ProjectsMainCubit>()
                                                    .selectProjectCategory(
                                                      category,
                                                    );
                                              },
                                            ),
                                            const SizedBox(height: 60),
                                            ProjectListContainer(
                                              key: ValueKey(
                                                state
                                                    .projectModel
                                                    .selectedProjectCategory,
                                              ),
                                              category:
                                                  state
                                                      .projectModel
                                                      .selectedProjectCategory,
                                              isVisible:
                                                  state
                                                      .projectModel
                                                      .isProjectListAni,
                                            ),
                                            const SizedBox(height: 100),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                                if (deviceType == 'mobile') ...[
                                  ScreenUtilInit(
                                    designSize:
                                        mobileDevice
                                            ? isFoldable
                                                ? const Size(770, 900)
                                                : const Size(450, 752)
                                            : Size(
                                              logicalWidth,
                                              MediaQuery.of(
                                                context,
                                              ).size.height,
                                            ),
                                    minTextAdapt: true,
                                    splitScreenMode: true,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 32.w,
                                          ),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: TwoLineTitleNoAni(
                                              title:
                                                  MainPageTextConstants
                                                      .projectSectionTitle,
                                              subTitle:
                                                  MainPageTextConstants
                                                      .projectSectionSubTitle,
                                              color: Colors.white,
                                              subTitleColor: Colors.white,
                                            ),
                                          ),
                                        ),
                                        if (!state
                                            .projectModelWithMobile
                                            .isProjectDetailVisible)
                                          ProjectPageWithMobile(
                                            state: state.projectModelWithMobile,
                                            showProjectDetail: (category) {
                                              context
                                                  .read<ProjectsMainCubit>()
                                                  .showProjectDetail(category);
                                            },
                                          ),
                                        if (state
                                            .projectModelWithMobile
                                            .isProjectDetailVisible)
                                          AnimatedOpacity(
                                            opacity:
                                                state
                                                        .projectModelWithMobile
                                                        .isProjectDetailAni
                                                    ? 1.0
                                                    : 0.0,
                                            duration: const Duration(
                                              milliseconds: 400,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 32.w,
                                              ),
                                              child: ProjectDetailContent(
                                                category:
                                                    state
                                                        .projectModelWithMobile
                                                        .selectedProjectCategory,
                                                isAnimationStart:
                                                    state
                                                        .projectModelWithMobile
                                                        .isProjectDetailAni,
                                              ),
                                            ),
                                          ),
                                        SizedBox(height: 100.h),
                                      ],
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (deviceType == 'mobile')
                    MenuScreen(isMenuClicked: state.isMenuClicked),
                  if (deviceType == 'mobile')
                    Positioned(
                      bottom: 30,
                      left: 0,
                      right: 0,
                      child: Player(
                        isPlayerAniOpacity: state.isPlayerVisible,
                        isPlayerText: state.playerText,
                        onTap:
                            state.isPlayerVisible &&
                                    state.playerText ==
                                        ProjectTextConstants.backToProjectList
                                ? () {
                                  context
                                      .read<ProjectsMainCubit>()
                                      .hideProjectDetail();
                                }
                                : null,
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
