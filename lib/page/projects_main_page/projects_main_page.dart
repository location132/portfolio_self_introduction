import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:self_introduction_flutter/components/widget/animation/widget_animation.dart';
import 'package:self_introduction_flutter/components/widget/top_nav_bar.dart';
import 'package:self_introduction_flutter/core_service/di/injector.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/project_page.dart';
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
              body: Column(
                children: [
                  WidgetAnimation(
                    isStart: state.isNaviAniStart,
                    child: TopNavBar(
                      deviceType: deviceType,
                      isMenuClicked: false,
                      onHomePressed: () {
                        context.go('/');
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 83,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height - 83,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                color: Colors.black,
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(height: 120),
                                  ProjectPage(
                                    state: state.projectModel,
                                    onCategorySelected: (category) {
                                      context
                                          .read<ProjectsMainCubit>()
                                          .selectProjectCategory(category);
                                    },
                                    projectAniStart: () {
                                      context
                                          .read<ProjectsMainCubit>()
                                          .startProjectAnimation();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
