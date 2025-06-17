import 'package:flutter/material.dart';

class ProjectImageCard extends StatelessWidget {
  final String imagePath;
  final String imageDescription;
  final String title;

  const ProjectImageCard({
    super.key,
    required this.imagePath,
    required this.imageDescription,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 60),
        SizedBox(
          width: 400,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(imagePath),
          ),
        ),
        const SizedBox(height: 14),
        Text(
          imageDescription,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
        const SizedBox(height: 80),
      ],
    );
  }
}
