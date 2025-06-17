import 'package:flutter/material.dart';

class ProjectImageSection extends StatelessWidget {
  final String imagePath;
  final String imageDescription;
  final double width;

  const ProjectImageSection({
    super.key,
    required this.imagePath,
    required this.imageDescription,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: width,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 14),
        SizedBox(
          width: width,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              imageDescription,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}
