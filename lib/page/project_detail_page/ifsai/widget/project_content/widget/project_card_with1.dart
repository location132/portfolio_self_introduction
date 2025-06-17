import 'package:flutter/material.dart';
import 'project_row_layout.dart';
import 'project_column_layout.dart';

class ProjectCardWith1 extends StatelessWidget {
  final String imagePath;
  final String imageDescription;
  final String title;
  final List<String> techStack;
  final String bottomDescription;
  final bool isCardStarted;

  const ProjectCardWith1({
    super.key,
    required this.imagePath,
    required this.imageDescription,
    required this.title,
    required this.techStack,
    required this.bottomDescription,
    required this.isCardStarted,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 1200;
    final isMediumScreen = screenWidth > 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isLargeScreen ? 80 : (isMediumScreen ? 40 : 20),
      ),
      child:
          isLargeScreen
              ? ProjectRowLayout(
                imagePath: imagePath,
                imageDescription: imageDescription,
                title: title,
                techStack: techStack,
                bottomDescription: bottomDescription,
                isCardStarted: isCardStarted,
                isReversed: false,
              )
              : ProjectColumnLayout(
                imagePath: imagePath,
                imageDescription: imageDescription,
                title: title,
                techStack: techStack,
                bottomDescription: bottomDescription,
                isCardStarted: isCardStarted,
              ),
    );
  }
}
