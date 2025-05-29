import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChapterIntroBox extends StatelessWidget {
  final bool isChapterDescriptionAni;
  final bool isTextOpacity;
  const ChapterIntroBox({
    super.key,
    required this.isChapterDescriptionAni,
    required this.isTextOpacity,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
      height: isChapterDescriptionAni ? 200.h : 0.h,
      padding: EdgeInsets.only(
        left: 10.w,
        right: 10.w,
        top: 10.h,
        bottom: 10.h,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[900]?.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey[800]!, width: 1),
      ),
      child: AnimatedOpacity(
        opacity: isTextOpacity ? 1 : 0,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '   챕터 Pick',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10.h),
            Center(
              child: Text(
                '  챕터 1에서는 각종 세미나와 컨퍼런스에 참여한 이유를 확인하실 수 있습니다.\n\n'
                '  세 가지로 구성된 작은 세미나 이야기는 제가 꿈꾸던 목표와 배운 점을 공유할 수 있도록 구성한 챕터입니다.',
                style: TextStyle(
                  fontSize: 16.sp,
                  height: 1.6,
                  color: Colors.grey[300],
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
