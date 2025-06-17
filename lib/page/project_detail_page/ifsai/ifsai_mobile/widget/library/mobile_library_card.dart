import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileLibraryCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const MobileLibraryCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 280.h,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 220.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: Colors.white.withValues(alpha: 0.05),
              border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withValues(alpha: 0.1),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
          ),

          Positioned(
            bottom: 60.h,
            left: 0,
            right: 0,
            child: Container(
              height: 160.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.r),
                  bottomRight: Radius.circular(16.r),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.3),
                    Colors.black.withValues(alpha: 0.7),
                    Colors.black.withValues(alpha: 0.9),
                  ],
                  stops: const [0.0, 0.3, 0.7, 1.0],
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.white.withOpacity(0.7),
                      height: 1.4,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
