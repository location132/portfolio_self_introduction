import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubtitleTextTechBlogMobile extends StatelessWidget {
  final String title;
  final bool isBackgroundColor;

  const SubtitleTextTechBlogMobile({
    super.key,
    required this.title,
    this.isBackgroundColor = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Text(
        title,
        style: TextStyle(
          color: const Color.fromARGB(255, 188, 239, 247),
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
