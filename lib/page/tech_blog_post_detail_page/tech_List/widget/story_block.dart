import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoryBlock extends StatelessWidget {
  final String story;
  final bool isBackgroundColor;
  final bool isMobile;
  final bool isPadding;
  const StoryBlock({
    super.key,
    required this.story,
    this.isBackgroundColor = false,
    required this.isMobile,
    this.isPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          isPadding
              ? EdgeInsets.only(left: isMobile ? 20.w : 20)
              : EdgeInsets.zero,
      child: Text(
        story,
        style: TextStyle(
          color: isBackgroundColor ? Colors.black : Colors.white,
          fontSize: isMobile ? 16.sp : 16,
        ),
      ),
    );
  }
}
