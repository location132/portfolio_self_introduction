import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/widget/components/category_header.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/widget/components/project_card.dart';

class FlutterAppsSection extends StatelessWidget {
  final bool isVisible;

  const FlutterAppsSection({super.key, required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CategoryHeader(
          title: ProjectTextConstants.flutterTitle,
          count: ProjectTextConstants.flutterContainerCount,
        ),
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
      ],
    );
  }
}
