import 'package:flutter/material.dart';

class TitleTextTechBlog extends StatelessWidget {
  final String title;
  final bool isBackgroundColor;

  const TitleTextTechBlog({
    super.key,
    required this.title,
    this.isBackgroundColor = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: const Color.fromARGB(255, 134, 234, 249),
        fontSize: 24,
        fontWeight: FontWeight.w600,
        height: 1.3,
      ),
    );
  }
}
