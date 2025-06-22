import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RiveMobileItem extends StatelessWidget {
  final String? date;
  final String title;
  final String description;
  final String riveAsset;
  final bool showDate;

  const RiveMobileItem({
    super.key,
    this.date,
    required this.title,
    required this.description,
    required this.riveAsset,
    this.showDate = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showDate && date != null) ...[
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: Colors.grey.shade600,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                date!,
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
        Container(
          width: 140.w,
          height: 100.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            image: const DecorationImage(
              image: AssetImage('assets/Images/project_img/rive_flutter.png'),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.purple.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12.sp, color: Colors.grey, height: 1.5),
          ),
        ),
      ],
    );
  }
}
