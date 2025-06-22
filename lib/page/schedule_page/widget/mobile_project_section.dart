import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'project_view/general_projects_mobile_view.dart';
import 'project_view/flutter_web_mobile_item.dart';
import 'project_view/rive_mobile_view.dart';

class MobileProjectSection extends StatelessWidget {
  const MobileProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            Text(
              '곧 오픈됩니다.\n이정원의 프로젝트 포트폴리오',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.4,
              ),
            ),
            SizedBox(height: 30.h),
            Container(
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: Colors.grey.shade800),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const GeneralProjectsMobileView(),
                  SizedBox(height: 24.h),
                  const FlutterWebMobileItem(),
                  SizedBox(height: 24.h),
                  const RiveMobileView(),
                ],
              ),
            ),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }
}
