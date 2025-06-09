import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FutureSection extends StatelessWidget {
  final String contentTitle;
  final String description;

  const FutureSection({
    super.key,
    required this.contentTitle,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                contentTitle,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  height: 1.25,
                  letterSpacing: -0.3,
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                description,
                style: TextStyle(
                  fontSize: 18.sp,
                  height: 1.6,
                  color: Colors.grey[300],
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.1,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 60.h),
      ],
    );
  }
}
