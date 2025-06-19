import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleTextTechBlogMobile extends StatelessWidget {
  final String title;
  final bool isBackgroundColor;

  const TitleTextTechBlogMobile({
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
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        height: 1.3,
      ),
    );
  }
}
