import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/widget/components/category_header.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/widget/components/project_card.dart';

class AllProjectsContainer extends StatelessWidget {
  final bool isVisible;

  const AllProjectsContainer({super.key, required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Flutter 섹션 헤더
        CategoryHeader(
          title: ProjectTextConstants.flutterTitle,
          count: ProjectTextConstants.flutterContainerCount,
        ),

        // Flutter 프로젝트 카드들
        Container(
          height: 620,
          margin: const EdgeInsets.only(bottom: 40),
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
        ),

        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          height: 1,
          color: Colors.white.withValues(alpha: 0.2),
        ),

        CategoryHeader(
          title: ProjectTextConstants.flutterRiveTitle,
          count: ProjectTextConstants.flutterRiveContainerCount,
        ),

        SizedBox(
          height: 620,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: ProjectTextConstants.flutterRiveProjects.length,
            itemBuilder: (context, index) {
              final project = ProjectTextConstants.flutterRiveProjects[index];
              return ProjectCard(
                project: project,
                isVisible: isVisible,
                index: index,
                icon: Icons.animation,
              );
            },
          ),
        ),
      ],
    );
  }
}
