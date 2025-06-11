import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/model/main_page/project_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/project_view.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ProjectPage extends StatelessWidget {
  final ProjectModel state;
  final Function(String) onCategorySelected;
  final Function() projectAniStart;
  const ProjectPage({
    super.key,
    required this.state,
    required this.onCategorySelected,
    required this.projectAniStart,
  });

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('project-view'),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0.1 && !state.isTitleAniStart) {
          projectAniStart();
        }
      },
      child: ProjectView(state: state, onCategorySelected: onCategorySelected),
    );
  }
}
