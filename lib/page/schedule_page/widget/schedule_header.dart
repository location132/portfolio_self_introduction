import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScheduleHeader extends StatelessWidget {
  const ScheduleHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 60),
        Text(
          '포트폴리오 웹사이트 리모델링과 함께\n더욱 많은 프로젝트들을 소개하겠습니다',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1.4,
          ),
        ),
        SizedBox(height: 20),
        Text(
          '현재는 잎사이 프로젝트만 자세한 프로젝트를 보실 수 있습니다',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey, height: 1.5),
        ),
        SizedBox(height: 40),
      ],
    );
  }
}

class ScheduleHeaderMobile extends StatelessWidget {
  const ScheduleHeaderMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40.h),
        Text(
          '포트폴리오 웹사이트 리모델링과 함께\n더욱 많은 프로젝트들을 소개하겠습니다',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1.4,
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          '현재는 잎사이 프로젝트만 자세한 프로젝트를 보실 수 있습니다',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14.sp, color: Colors.grey, height: 1.5),
        ),
        SizedBox(height: 32.h),
      ],
    );
  }
}
