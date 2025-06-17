import 'package:flutter/material.dart';
import 'project_image_section.dart';
import 'project_text_section.dart';

class ProjectColumnLayout extends StatelessWidget {
  final String imagePath;
  final String imageDescription;
  final String title;
  final List<String> techStack;
  final String bottomDescription;
  final bool isCardStarted;

  const ProjectColumnLayout({
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
    final contentWidth = (screenWidth * 0.9).clamp(280.0, 600.0);
    final imageWidth = (screenWidth * 0.7).clamp(250.0, 400.0);

    return Center(
      child: SizedBox(
        width: contentWidth,
        child: Column(
          children: [
            SizedBox(
              width: imageWidth,
              child: ProjectImageSection(
                imagePath: imagePath,
                imageDescription: imageDescription,
                width: imageWidth,
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: ProjectTextSection(
                title: title,
                techStack: techStack,
                bottomDescription: bottomDescription,
                isCardStarted: isCardStarted,
                width: contentWidth,
                isCenter: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
