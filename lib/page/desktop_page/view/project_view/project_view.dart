import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/model/main_page/project_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/widget/menu/project_menu_bar.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/widget/project_title.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/widget/project_list_container.dart';

class ProjectView extends StatefulWidget {
  final ProjectModel state;
  final Function(String) onCategorySelected;
  const ProjectView({
    super.key,
    required this.state,
    required this.onCategorySelected,
  });

  @override
  State<ProjectView> createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {
  bool _isProjectListAni = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 타이틀
        ProjectTitle(isTitleVisible: widget.state.isTitleAniStart),
        const SizedBox(height: 80),
        // 메뉴
        AnimatedOpacity(
          opacity: widget.state.isProjectListAni ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          onEnd: () {
            setState(() {
              _isProjectListAni = true;
            });
          },
          child: ProjectMenuBar(
            state: widget.state,
            onCategorySelected: widget.onCategorySelected,
          ),
        ),
        const SizedBox(height: 60),

        // 프로젝트
        Container(
          constraints: const BoxConstraints(minHeight: 1000),
          child: AnimatedOpacity(
            opacity: _isProjectListAni ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 800),
            child: ProjectListContainer(
              key: ValueKey(widget.state.selectedProjectCategory),
              category: widget.state.selectedProjectCategory,
              isVisible: widget.state.isProjectListAni,
            ),
          ),
        ),

        const SizedBox(height: 100),
      ],
    );
  }
}
