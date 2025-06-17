import 'package:flutter/material.dart';
import 'project_image_section.dart';
import 'project_text_section.dart';

class ProjectRowLayout extends StatelessWidget {
  final String imagePath;
  final String imageDescription;
  final String title;
  final List<String> techStack;
  final String bottomDescription;
  final bool isCardStarted;
  final bool isReversed;

  const ProjectRowLayout({
    super.key,
    required this.imagePath,
    required this.imageDescription,
    required this.title,
    required this.techStack,
    required this.bottomDescription,
    required this.isCardStarted,
    this.isReversed = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = (screenWidth * 0.25).clamp(300.0, 400.0);
    final textWidth = (screenWidth * 0.25).clamp(300.0, 400.0);

    final imageSection = ProjectImageSection(
      imagePath: imagePath,
      imageDescription: imageDescription,
      width: imageWidth,
    );

    final textSection = ProjectTextSection(
      title: title,
      techStack: techStack,
      bottomDescription: bottomDescription,
      isCardStarted: isCardStarted,
      width: textWidth,
      isCenter: false,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:
          isReversed
              ? [
                textSection,
                SizedBox(width: screenWidth > 1400 ? 100 : 60),
                imageSection,
              ]
              : [
                imageSection,
                SizedBox(width: screenWidth > 1400 ? 100 : 60),
                textSection,
              ],
    );
  }
}
