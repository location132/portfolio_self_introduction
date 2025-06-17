import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectDetailTitleNoAnimation extends StatefulWidget {
  const ProjectDetailTitleNoAnimation({super.key});

  @override
  State<ProjectDetailTitleNoAnimation> createState() =>
      _ProjectDetailTitleNoAnimationState();
}

class _ProjectDetailTitleNoAnimationState
    extends State<ProjectDetailTitleNoAnimation> {
  // 화면 크기에 따른 반응형 크기 계산
  double _getTitleFontSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width <= 350) return 22.sp; // 작은 화면
    if (width <= 400) return 24.sp; // 중간 화면
    return 27.sp; // 큰 화면
  }

  double _getImageHeight(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width <= 350) return 70.h; // 작은 화면
    if (width <= 400) return 85.h; // 중간 화면
    return 100.h; // 큰 화면
  }

  double _getDescriptionFontSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width <= 350) return 14.sp; // 작은 화면
    if (width <= 400) return 15.sp; // 중간 화면
    return 16.sp; // 큰 화면
  }

  EdgeInsets _getDescriptionPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width <= 350) return EdgeInsets.symmetric(horizontal: 20.w); // 작은 화면
    if (width <= 400) return EdgeInsets.symmetric(horizontal: 30.w); // 중간 화면
    return EdgeInsets.symmetric(horizontal: 40.w); // 큰 화면
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '잎사이',
                    style: TextStyle(
                      fontSize: _getTitleFontSize(context),
                      color: Colors.black.withValues(alpha: 0.8),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Image.asset(
                      'assets/Images/ifSai.png',
                      height: _getImageHeight(context),
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    height: 7.h,
                    width: 140.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          const Color.fromARGB(
                            255,
                            72,
                            159,
                            25,
                          ).withValues(alpha: 0.8),
                          const Color.fromARGB(
                            255,
                            129,
                            249,
                            118,
                          ).withValues(alpha: 0.1),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: _getDescriptionPadding(context).copyWith(bottom: 120.h),
              child: Text(
                '지루하지않게 저에 관해서 궁금한 것만 보여드리겠습니다.\n 1200 이상 디바이스에서는 많은 인터렉션이 있습니다!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: _getDescriptionFontSize(context),
                  color: Colors.black,
                  height: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
