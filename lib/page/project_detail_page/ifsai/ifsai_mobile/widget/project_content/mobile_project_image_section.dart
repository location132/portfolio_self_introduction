import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileProjectImageSection extends StatelessWidget {
  final String imagePath;
  final String imageDescription;
  final double width;

  const MobileProjectImageSection({
    super.key,
    required this.imagePath,
    required this.imageDescription,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: width,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
        ),
        SizedBox(height: 14.h),
        SizedBox(
          width: width,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              imageDescription,
              style: TextStyle(color: Colors.grey, fontSize: 14.sp),
            ),
          ),
        ),
      ],
    );
  }
}
