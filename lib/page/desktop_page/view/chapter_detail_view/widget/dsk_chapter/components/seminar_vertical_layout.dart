import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_detail_view/dsk_chapter_story.dart';

class SeminarVerticalLayout extends StatelessWidget {
  final String title;
  final String imagePath;
  final String contentTitle;
  final String description;
  final bool isStart;

  const SeminarVerticalLayout({
    super.key,
    required this.title,
    required this.imagePath,
    required this.contentTitle,
    required this.description,
    required this.isStart,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: DskChapterStory(title: title, isStart: isStart),
        ),
        Container(
          height: 250.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          clipBehavior: Clip.hardEdge,
          child: Image.asset(
            imagePath,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 24.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                contentTitle,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  height: 1.25,
                  letterSpacing: -0.3,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                description,
                style: TextStyle(
                  fontSize: 16.sp,
                  height: 1.5,
                  color: Colors.grey[300],
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
