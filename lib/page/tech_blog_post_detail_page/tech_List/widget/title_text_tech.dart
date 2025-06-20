import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleTextTechBlog extends StatelessWidget {
  final String title;
  final bool isBackgroundColor;
  final bool isMobile;

  const TitleTextTechBlog({
    super.key,
    required this.title,
    this.isBackgroundColor = false,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: const Color.fromARGB(255, 134, 234, 249),
        fontSize: isMobile ? 24.sp : 24,
        fontWeight: FontWeight.w600,
        height: 1.3,
      ),
    );
  }
}
