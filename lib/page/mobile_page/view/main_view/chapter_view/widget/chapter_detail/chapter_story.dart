import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/components/widget/mobile_animation/widget_animation.dart';

class ChapterStory extends StatelessWidget {
  const ChapterStory({super.key, required this.title, required this.isStart});
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

/*

   Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color:
                  isHighlight
                      ? Colors.white.withValues(alpha: 0.05)
                      : Colors.grey[900]?.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(8.r),
              border:
                  isHighlight
                      ? Border.all(
                        color: Colors.white.withValues(alpha: 0.2),
                        width: 1,
                      )
                      : null,
            ),
            child: Text(
              content,
              style: TextStyle(
                fontSize: 15.sp,
                height: 1.6,
                color: isHighlight ? Colors.white : Colors.grey[300],
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
 */
