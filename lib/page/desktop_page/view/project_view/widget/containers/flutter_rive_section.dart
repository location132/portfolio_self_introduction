import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/widget/components/category_header.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/widget/components/square_project_card.dart';

class FlutterRiveSection extends StatelessWidget {
  final bool isVisible;

  const FlutterRiveSection({super.key, required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CategoryHeader(
          title: ProjectTextConstants.flutterRiveTitle,
          count: ProjectTextConstants.flutterRiveContainerCount,
        ),
        SizedBox(
          height: 320,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: ProjectTextConstants.flutterRiveProjects.length,
            itemBuilder: (context, index) {
              final project = ProjectTextConstants.flutterRiveProjects[index];
              return SquareProjectCard(
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
