import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubtitleTextTechBlog extends StatelessWidget {
  final String title;
  final bool isBackgroundColor;
  final bool isMobile;
  const SubtitleTextTechBlog({
    super.key,
    required this.title,
    this.isBackgroundColor = false,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20.w : 20),
      child: Text(
        title,
        style: TextStyle(
          color: const Color.fromARGB(255, 188, 239, 247),
          fontSize: isMobile ? 20.sp : 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
