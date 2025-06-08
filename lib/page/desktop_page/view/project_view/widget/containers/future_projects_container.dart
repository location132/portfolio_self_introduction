import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/widget/components/project_card.dart';

class FutureProjectsContainer extends StatelessWidget {
  final bool isVisible;

  const FutureProjectsContainer({super.key, required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 620,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: ProjectTextConstants.futureProjects.length,
        itemBuilder: (context, index) {
          final project = ProjectTextConstants.futureProjects[index];
          return ProjectCard(
            project: project,
            isVisible: isVisible,
            index: index,
            icon: Icons.lightbulb_outline,
            showBadge: true,
            badgeText: ProjectTextConstants.comingSoonBadge,
          );
        },
      ),
    );
  }
}
