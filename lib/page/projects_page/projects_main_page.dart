import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_cubit.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_state.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/widget/project_title.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/widget/menu/project_menu_bar.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/widget/project_list_container.dart';

class ProjectsMainPage extends StatefulWidget {
  const ProjectsMainPage({super.key});

  @override
  State<ProjectsMainPage> createState() => _ProjectsMainPageState();
}

class _ProjectsMainPageState extends State<ProjectsMainPage> {
  late DesktopCubit _cubit;
  bool _isProjectListAni = false;

  @override
  void initState() {
    super.initState();
    _cubit = DesktopCubit();

    // 프로젝트 화면 초기화
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cubit.projectAniStart();
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          setState(() {
            _isProjectListAni = true;
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.go('/'),
        ),
        title: const Text(
          'Projects',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.black, Colors.grey.shade900, Colors.black],
          ),
        ),
        child: BlocProvider.value(
          value: _cubit,
          child: BlocBuilder<DesktopCubit, DesktopState>(
            builder: (context, state) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 프로젝트 타이틀
                    ProjectTitle(
                      isTitleVisible: state.projectModel.isTitleAniStart,
                    ),
                    const SizedBox(height: 80),

                    // 프로젝트 메뉴바
                    AnimatedOpacity(
                      opacity: state.projectModel.isProjectListAni ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 500),
                      child: ProjectMenuBar(
                        state: state.projectModel,
                        cubit: _cubit,
                      ),
                    ),
                    const SizedBox(height: 60),

                    // 프로젝트 리스트
                    Container(
                      constraints: const BoxConstraints(minHeight: 1000),
                      child: AnimatedOpacity(
                        opacity: _isProjectListAni ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 800),
                        child: ProjectListContainer(
                          key: ValueKey(
                            state.projectModel.selectedProjectCategory,
                          ),
                          category: state.projectModel.selectedProjectCategory,
                          isVisible: state.projectModel.isProjectListAni,
                        ),
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
