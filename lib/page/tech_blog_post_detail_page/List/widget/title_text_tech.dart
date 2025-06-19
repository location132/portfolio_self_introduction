import 'package:flutter/material.dart';

class TitleTextTechBlog extends StatelessWidget {
  final String title;

  const TitleTextTechBlog({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Color.fromARGB(255, 134, 234, 249),
        fontSize: 24,
        fontWeight: FontWeight.w600,
        height: 1.3,
      ),
    );
  }
}
