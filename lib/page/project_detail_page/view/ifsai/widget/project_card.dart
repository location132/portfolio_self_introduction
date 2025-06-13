import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final String imagePath;
  final String imageDescription;
  final String title;
  final List<String> techStack;
  final String bottomDescription;
  final bool isReversed;

  const ProjectCard({
    super.key,
    required this.imagePath,
    required this.imageDescription,
    required this.title,
    required this.techStack,
    required this.bottomDescription,
    this.isReversed = false,
  });

  @override
  Widget build(BuildContext context) {
    final imageSection = Column(
      children: [
        SizedBox(
          width: 400,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(imagePath),
          ),
        ),
        const SizedBox(height: 14),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            imageDescription,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),
      ],
    );

    final textSection = Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 60),
            ...techStack.map(
              (tech) => Column(
                children: [
                  Text(
                    '• $tech',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Text(
              bottomDescription,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          isReversed
              ? [textSection, const SizedBox(width: 100), imageSection]
              : [imageSection, const SizedBox(width: 100), textSection],
    );
  }
}
