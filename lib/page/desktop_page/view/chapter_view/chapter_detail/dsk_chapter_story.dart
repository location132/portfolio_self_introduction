import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/components/widget/mobile_animation/widget_animation.dart';

class DskChapterStory extends StatelessWidget {
  const DskChapterStory({
    super.key,
    required this.title,
    required this.isStart,
  });
  final String title;
  final bool isStart;

  @override
  Widget build(BuildContext context) {
    return WidgetAnimation(
      isStart: isStart,
      child: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w600,
            color: const Color.fromARGB(255, 210, 255, 254),
            height: 1.3,
          ),
        ),
      ),
    );
  }
}
