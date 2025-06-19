import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoryBlockMobile extends StatelessWidget {
  final String story;
  final bool isBackgroundColor;
  const StoryBlockMobile({
    super.key,
    required this.story,
    this.isBackgroundColor = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: Text(
        story,
        style: TextStyle(
          color: isBackgroundColor ? Colors.black : Colors.white,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
