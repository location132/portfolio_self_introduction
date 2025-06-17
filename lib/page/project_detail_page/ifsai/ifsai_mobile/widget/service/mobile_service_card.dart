import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'mobile_service_data.dart';

class MobileServiceCard extends StatelessWidget {
  final MobileServiceData service;

  const MobileServiceCard({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    // Pick 탭인 경우 컨테이너 없이 중앙 정렬
    if (service.title == 'Pick') {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              service.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                height: 1.6,
              ),
            ),
            SizedBox(height: 20.h),
            ...service.features.where((feature) => feature.isNotEmpty).map((
              feature,
            ) {
              return Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: Text(
                  feature,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 14.sp,
                    height: 1.5,
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      );
    }

    // 다른 서비스들은 기존 컨테이너 스타일
    return Container(
      padding: EdgeInsets.all(20.w),
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            service.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            service.description,
            style: TextStyle(
              color: Colors.grey[300],
              fontSize: 13.sp,
              height: 1.4,
            ),
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    service.features.map((feature) {
                      if (feature.isEmpty) return const SizedBox.shrink();

                      return Padding(
                        padding: EdgeInsets.only(bottom: 8.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 4.w,
                              height: 4.h,
                              margin: EdgeInsets.only(top: 8.h, right: 8.w),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                feature,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
