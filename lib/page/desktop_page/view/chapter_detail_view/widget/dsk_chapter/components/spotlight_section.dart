import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpotlightSection extends StatelessWidget {
  final String title;
  final String contentTitle;
  final String description;
  final bool isStart;
  final Color? highlightColor;

  const SpotlightSection({
    super.key,
    required this.title,
    required this.contentTitle,
    required this.description,
    required this.isStart,
    this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: AnimatedOpacity(
            opacity: isStart ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(40.w),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color:
                      highlightColor?.withOpacity(0.3) ??
                      Colors.white.withOpacity(0.1),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 타이틀 배지
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color:
                          highlightColor?.withOpacity(0.15) ??
                          Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(25.r),
                      border: Border.all(
                        color:
                            highlightColor?.withOpacity(0.5) ??
                            Colors.white.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: highlightColor ?? Colors.white,
                      ),
                    ),
                  ),

                  SizedBox(height: 30.h),

                  // 컨텐츠 타이틀
                  Text(
                    contentTitle,
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.3,
                    ),
                  ),

                  SizedBox(height: 25.h),

                  // 설명
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white.withOpacity(0.9),
                      height: 1.7,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 60.h),
      ],
    );
  }
}
