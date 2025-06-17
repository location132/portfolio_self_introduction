import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileSubTitle extends StatelessWidget {
  const MobileSubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            '바로 핵심부터',
            style: TextStyle(
              fontSize: 34.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 30.h),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Text(
              '잎사이 프로젝트에 적용한 모든 기술입니다. 상세한 내용은 클릭해주세요',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black,
                height: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
