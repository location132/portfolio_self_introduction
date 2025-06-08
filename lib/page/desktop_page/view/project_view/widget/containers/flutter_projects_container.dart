import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/widget/components/project_card.dart';

class FlutterProjectsContainer extends StatelessWidget {
  final bool isVisible;

  const FlutterProjectsContainer({super.key, required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 620,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: ProjectTextConstants.flutterProjects.length,
        itemBuilder: (context, index) {
          final project = ProjectTextConstants.flutterProjects[index];
          return ProjectCard(
            project: project,
            isVisible: isVisible,
            index: index,
            icon: Icons.flutter_dash,
          );
        },
      ),
    );
  }
}
