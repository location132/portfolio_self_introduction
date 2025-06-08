import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/model/main_page/project_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_cubit.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/project_view.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ProjectPage extends StatelessWidget {
  final ProjectModel state;
  final DesktopCubit cubit;
  const ProjectPage({super.key, required this.state, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('project-view'),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0.3 && !state.isTitleAniStart) {
          cubit.projectAniStart();
        }
      },
      child: ProjectView(state: state, cubit: cubit),
    );
  }
}
