import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/widget/components/square_project_card.dart';

class FlutterRiveProjectsContainer extends StatelessWidget {
  final bool isVisible;

  const FlutterRiveProjectsContainer({super.key, required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
