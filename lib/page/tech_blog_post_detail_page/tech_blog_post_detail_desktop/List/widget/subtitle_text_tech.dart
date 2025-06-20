import 'package:flutter/material.dart';

class SubtitleTextTechBlog extends StatelessWidget {
  final String title;
  final bool isBackgroundColor;

  const SubtitleTextTechBlog({
    super.key,
    required this.title,
    this.isBackgroundColor = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: TextStyle(
          color: const Color.fromARGB(255, 188, 239, 247),
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
