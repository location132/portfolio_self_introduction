import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/components/widget/animation/widget_animation.dart';

class MobileProjectTextSection extends StatelessWidget {
  final String title;
  final List<String> techStack;
  final String bottomDescription;
  final bool isCardStarted;
  final double width;
  final Function(String)? onTechStackTap;

  const MobileProjectTextSection({
    super.key,
    required this.title,
    required this.techStack,
    required this.bottomDescription,
    required this.isCardStarted,
    required this.width,
    this.onTechStackTap,
  });

  @override
  Widget build(BuildContext context) {
    return WidgetAnimation(
      isStart: isCardStarted,
      beginDy: 0.1,
      duration: 1000,
      child: SizedBox(
        width: width * 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                height: 1.4,
              ),
            ),
            SizedBox(height: 40.h),
            ...techStack.map(
              (tech) => Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child:
                    onTechStackTap != null
                        ? MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => onTechStackTap!(tech),
                            child: Text(
                              '• $tech',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                height: 1.3,
                              ),
                            ),
                          ),
                        )
                        : Text(
                          '• $tech',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            height: 1.3,
                          ),
                        ),
              ),
            ),
            SizedBox(height: 40.h),
            Text(
              bottomDescription,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
