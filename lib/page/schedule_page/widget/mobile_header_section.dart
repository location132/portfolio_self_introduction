import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MobileHeaderSection extends StatelessWidget {
  const MobileHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 60.h),
            Text(
              '포트폴리오 웹사이트 리모델링과 함께\n더욱 많은 프로젝트 그리고 기술블로그를 소개하겠습니다.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.4,
              ),
            ),
            SizedBox(height: 40.h),
            Text(
              '현재는 잎사이 프로젝트만 자세한 내용을 보실 수 있습니다.\n기술블로그는 8번까지만 업로드 되었습니다.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey,
                height: 1.6,
              ),
            ),
            SizedBox(height: 40.h),
            Container(
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: Colors.grey.shade800),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 90.h,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () => context.go('/project-detail/ifsai'),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade800,
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(color: Colors.grey.shade700),
                            ),
                            child: Text(
                              '잎사이 프로젝트 소개로 이동하기',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Expanded(
                          child: Text(
                            '5만줄 이상 코드 규모에 MVVM, Servicev패턴 Clean Architecture를 적용하고, TestFlight를 통해 협업한 프로젝트입니다.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.grey,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    height: 90.h,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () => context.go('/tech-blog'),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade800,
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(color: Colors.grey.shade700),
                            ),
                            child: Text(
                              '기술블로그 페이지로 이동하기',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Expanded(
                          child: Text(
                            '다른 블로그와 다르게\n개념 20% 프로젝트에 적용하며 직접 구현한 기술 80%로 이루어진 특별한 기술블로그',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.grey,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 60.h),
          ],
        ),
      ),
    );
  }
}
