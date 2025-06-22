import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../project_thumbnail_mobile.dart';

class GeneralProjectMobileItem extends StatelessWidget {
  final String date;
  final String title;
  final String description;
  final bool isLast;
  final bool isGreen;

  const GeneralProjectMobileItem({
    super.key,
    required this.date,
    required this.title,
    required this.description,
    this.isLast = false,
    this.isGreen = false,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        isGreen ? Colors.green.shade600 : Colors.grey.shade600;

    return Column(
      children: [
        if (date.isNotEmpty) ...[
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                date,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
        ],
        ProjectThumbnailMobile(title: title),
        SizedBox(height: 36.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12.sp, color: Colors.grey, height: 1.5),
          ),
        ),
        if (!isLast) SizedBox(height: 24.h),
      ],
    );
  }
}
