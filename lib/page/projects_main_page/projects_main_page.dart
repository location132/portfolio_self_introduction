import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/components/widget/top_nav_bar.dart';
import 'package:self_introduction_flutter/core_service/di/injector.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/project_page.dart';
import 'package:self_introduction_flutter/page/projects_main_page/projects_cubit.dart';
import 'package:self_introduction_flutter/page/projects_main_page/projects_main_state.dart';
import 'package:self_introduction_flutter/service/main_service.dart';

class ProjectsMainPage extends StatefulWidget {
  const ProjectsMainPage({super.key});

  @override
  State<ProjectsMainPage> createState() => _ProjectsMainPageState();
}

class _ProjectsMainPageState extends State<ProjectsMainPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<ProjectsMainCubit>(),
      child: _ProjectsMainView(),
    );
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
                  TopNavBar(deviceType: deviceType, isMenuClicked: false),
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 83,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: ProjectPage(
                        state: state.projectModel,
                        onCategorySelected: (category) {},
                        projectAniStart: () {},
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
